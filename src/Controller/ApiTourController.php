<?php

namespace App\Controller;

use App\Entity\Tour;
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
    public function index(int $id, TourRepository $tourRepository, TourNormalize $tourNormalize): Response
    {
        $data = $tourRepository->find($id);
        return $this->json($tourNormalize->tourNormalize($data));
    }

    /**
    * @Route(
    *   "/toursbycity/{id}", 
    *   name="toursByCity",
    *   methods={"GET"}
    *)
    */
    public function toursbycity(int $id, TourRepository $tourRepository, CityRepository $cityRepository, TourNormalize $tourNormalize): Response
    {

        $tours = [];
        foreach($tourRepository->findToursByCity($id) as $tour) {
            array_push($tours, $tourNormalize->tourNormalize($tour));
        };

        $city = $cityRepository->find($id);

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

}
