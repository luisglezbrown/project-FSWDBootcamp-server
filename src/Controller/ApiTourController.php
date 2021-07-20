<?php

namespace App\Controller;

use App\Entity\Booking;
use App\Entity\Tour;
use App\Repository\BookingRepository;
use App\Repository\CategoryRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\TourRepository;
use App\Repository\CityRepository;
use App\Repository\UserRepository;
use App\Service\TourNormalize;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Component\HttpFoundation\File\Exception\FileException;


/**
 * @Route("/api", name="api_tour_")
 */
class ApiTourController extends AbstractController
{
    /**
    * @Route(
    *      "/tourdetails/{id}",
    *      name="tourDetails",
    *      methods={"GET"},
    *      requirements={
    *          "id": "\d+"
    *      }     
    * )
    */
    public function index(
        int $id, 
        TourRepository $tourRepository, 
        TourNormalize $tourNormalize): Response
    {
        $data = $tourRepository->find($id);
        return $this->json($tourNormalize->tourNormalize($data));
    }


    /**
    * @Route(
    *   "/toursbyguide/{id}", 
    *   name="toursByGuide",
    *   methods={"GET"}
    *)
    */
    public function toursByGuide(
        int $id, 
        TourRepository $tourRepository, 
        TourNormalize $tourNormalize): Response
    {
        $toursResult = $tourRepository->findToursByGuide($id);
        $enabledTours = [];
        $inactiveTours = [];
        foreach($toursResult as $tour) {
            if ($tour->getStatus() === Tour::STATUS_ENABLED) {
                array_push($enabledTours, $tourNormalize->tourNormalize($tour));
            } elseif ($tour->getStatus() === Tour::STATUS_INACTIVE) {
                array_push($inactiveTours, $tourNormalize->tourNormalize($tour));
            }
        };

        $results = [
            "totalTours" => count($tourRepository->findToursByGuide($id)),
            "totalActiveTours" => count($enabledTours),
            "totalInactiveTours" => count($inactiveTours),
            "enabled" => $enabledTours,
            "inactive" => $inactiveTours,
        ];

        return $this->json($results);
    }

    /**
    * @Route(
    *   "/toursbycity/{id}", 
    *   name="toursByCity",
    *   methods={"GET"}
    *)
    */
    public function toursbycity(int $id, 
    // Request $request, 
    TourRepository $tourRepository, 
    CityRepository $cityRepository, 
    TourNormalize $tourNormalize,
    EntityManagerInterface $entityManager): Response
    {
        // $filters = $request->request; // Esto te da un array asaociativo con todos los parámetros que te llegan en el query string.

        // if ($filters) {
        //     $toursResult = $tourRepository->findToursByCityAndCriteria($id, ['durattions' => $filters['duration'], 'catgeries' => $filters['categories'] ]);
        // } else {
        //     $toursResult = $tourRepository->findToursByCity($id, ['durattions' => $filters['duration'], 'catgeries' => $filters['categories'] ] );
        // }

        $toursResult = $tourRepository->findToursByCity($id);
        $tours = [];
        foreach($toursResult as $tour) {
            if ($tour->getStatus() === Tour::STATUS_ENABLED) {
                array_push($tours, $tourNormalize->tourNormalize($tour));
            }
        };

        $city = $cityRepository->find($id);
        $currentRank = $city->getRanking();
        $city->setRanking($currentRank + 1);
        
        $entityManager->persist($city);
        $entityManager->flush();

        $results = [
            "totalTours" => count($tourRepository->findToursByCity($id)),
            "city" => [
                'id' => $city->getId(),
                'name' => $city->getName(),
                'imgpath' => $city->getImgpath(),
            ],
            "tours" => $tours
        ];

        return $this->json($results);
    }

    /**
    * @Route(
    *   "/newtour", 
    *   name="newTour",
    *   methods={"POST"}
    *)
    */
    public function newtour(
        Request $request,
        EntityManagerInterface $entityManager,
        CategoryRepository $categoryRepository,
        UserRepository $userRepository,
        CityRepository $cityRepository,
        ValidatorInterface $validator,
        TourNormalize $tourNormalize
        ): Response {
        $data = json_decode($request->getContent(), true);
        // $data = {"name": "Test Tour",......, "categories": [1,4,14]}
        
        $user = $userRepository->find($data['userId']);
        $city = $cityRepository->find($data['cityId']);

        $tour = new Tour();
        $tour->setUser($user);
        $tour->setCity($city);
        $tour->setTitle($data['title']);
        $tour->setDuration($data['duration']);
        $tour->setWeekDays($data['weekDays']);
        $tour->setHighlight($data['highlight']);
        $tour->setStartingTime($data['startingTime']);
        $tour->setMeetingPoint($data['meetingPoint']);
        $tour->setDescription($data['description']);
        foreach ($data['categories'] as $categoryId) {
            $category = $categoryRepository->find($categoryId);
            $tour->addCategory($category);
        }

        // validar el tour
        $errors = $validator->validate($user);

        if (count($errors) > 0) {
            $dataErrors = [];

            /** @var \Symfony\Component\Validator\ConstraintViolation $error */
            foreach($errors as $error){
                $dataErrors[] = $error->getMessage();
            }

            return $this->json([
                'status' => 'error',
                'data' => [
                    'errors' => $dataErrors
                    ]
                ],
                Response::HTTP_BAD_REQUEST);
        }


        $entityManager->persist($tour);
        $entityManager->flush();

        // devolver respuesta con representación JSON del tour y 201 como código HTTP.
        return $this->json(
            $tourNormalize->tourNormalize($tour),
            Response::HTTP_CREATED
        );
    }

    /**
    * @Route(
    *      "/uploadtourimage/{id}",
    *      name="uploadtourimage",
    *      methods={"POST"},
    *      requirements={
    *          "id": "\d+"
    *      }     
    * )
    */
    public function uploadTourImage(
        Tour $tour, 
        Request $request, 
        EntityManagerInterface $entityManager):Response {
        // dump($request->request);
        // dump($request->files);
        // dump($tour);
        // die();

        if($request->files->has('File')) {
            $tourImgFile = $request->files->get('File');

            $newFilename = uniqid().'.'.$tourImgFile->guessExtension();

            // Intentamos mover el fichero a la carpeta public
            try {
                $tourImgFile->move(
                    $request->server->get('DOCUMENT_ROOT') . DIRECTORY_SEPARATOR . 'images' . DIRECTORY_SEPARATOR . 'tours', // El primer parámetro es la ruta
                    $newFilename // El 2º param es el nombre del fichero
                );
            } catch (FileException $error) {
                throw new \Exception($error->getMessage());
            }

            $tour->setImgpath($newFilename);
        }

        $entityManager->flush();
        
        return $this->json(
            null,
            Response::HTTP_NO_CONTENT
        );
    }


    /**
    * @Route(
    *      "/tourupdate/{id}",
    *      name="updatetourupdateTour",
    *      methods={"PUT"},
    *      requirements={
    *          "id": "\d+"
    *      }     
    * )
    */
    public function updateTour(
        int $id,
        Request $request,
        TourRepository $tourRepository,
        CategoryRepository $categoryRepository,
        EntityManagerInterface $entityManager 
        ): Response
    {        
        $data = json_decode($request->getContent(), true);
        $tour = $tourRepository->find($id);

        $tour->setTitle($data['title']);
        $tour->setDuration($data['duration']);
        $tour->setWeekDays($data['weekDays']);
        $tour->setHighlight($data['highlight']);
        $tour->setStartingTime($data['startingTime']);
        $tour->setMeetingPoint($data['meetingPoint']);
        $tour->setDescription($data['description']);

        // Primero obtenemos las categorías actuales y las eliminamos una a una
        $currentCategories = $tour->getCategories();
        foreach ($currentCategories as $category){
            $tour->removeCategory($category);
        }

        // Aquí añadimos cada una de las nuevas categorías
        foreach ($data['categories'] as $categoryId) {
            $category = $categoryRepository->find($categoryId);
            $tour->addCategory($category);
        }
    
        $entityManager->flush();

        return $this->json($tour, Response::HTTP_ACCEPTED);
    }


    /**
    * @Route(
    *      "/deletetour/{id}",
    *      name="disableTour",
    *      methods={"PATCH"},
    *      requirements={
    *          "id": "\d+"
    *      }     
    * )
    */
    public function deleteTour(
        int $id,
        TourRepository $tourRepository,
        BookingRepository $bookingRepository,
        EntityManagerInterface $entityManager 
        ): Response
    {
        $tour = $tourRepository->find($id);
        $tour->setDuration(0);
        $tour->setWeekDays([]);
        $tour->setHighlight("Este tour ha sido eliminado");
        $tour->setStartingTime("--");
        $tour->setMeetingPoint("--");
        $tour->setDescription("El guía ha decidido eliminar este tour, por lo que ya no está disponible");
        $tour->setImgpath("deleted.jpg");
        $tour->setStatus(Tour::STATUS_INACTIVE);

        foreach($bookingRepository->findBookingsByTour($id) as $booking) {
            $booking->setStatus(Booking::STATUS_CANCELLED);
        };
        
        $entityManager->flush();

        return $this->json($tour, Response::HTTP_ACCEPTED);
    }
    
}
