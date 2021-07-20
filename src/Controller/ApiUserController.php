<?php

namespace App\Controller;

use App\Entity\Booking;
use App\Entity\Tour;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use App\Entity\User;
use App\Repository\BookingRepository;
use App\Repository\UserRepository;
use App\Repository\TourRepository;
use App\Service\GuideNormalize;
use App\Service\TourNormalize;
use App\Service\UserNormalize;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;


/**
 * @Route("/api", name="api_user_")
 */
class ApiUserController extends AbstractController
{
    /**
    * @Route(
    *   "/register", 
    *   name="register",
    *   methods={"POST"}
    *)
    */
    public function newUser(
        Request $request,
        UserPasswordHasherInterface $hasher,
        EntityManagerInterface $entityManager,
        ValidatorInterface $validator, 
        GuideNormalize $guideNormalize
    ): Response
    {
        $data = json_decode($request->getContent(), true);
        dump($data);


        //Creamos un nuevo objeto para enviar en la solicitud
        $user = new User();

        $unhashedPassword = $data['password'];
        $hashedPassword = $hasher->hashPassword($user, $unhashedPassword);

        $user->setEmail($data['email']);
        $user->setPassword($hashedPassword);
        $user->setName($data['name']);
        $user->setLastname($data['lastname']);
        $user->setPhone($data['phone']);
        $user->setRoles($data['role']);
        $user->setShortDesc($data['shortDesc']);
        $user->setDescription($data['description']);
        $user->setSince(new \DateTimeImmutable());
        dump($user);


        //Hacemos la validación según las constraints
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

        $entityManager->persist($user);
        $entityManager->flush();


        return $this->json(
            $guideNormalize->guideNormalize($user),
            Response::HTTP_CREATED
        );
    }

    /**
    * @Route(
    *    "/userupdate/{id}", 
    *    name="userUpdate",
    *    methods={"PUT"},
    *    requirements={
    *       "id": "\d+"
    *    }
    *)
    */        
    public function userUpdate(
        User $user, 
        Request $request, 
        UserRepository $userRepository, 
        EntityManagerInterface $entityManager, 
        UserPasswordHasherInterface $hasher
    ): Response
    {
        $data = json_decode($request->getContent(), true);
        dump($data);

//TODO GESTIONAR EL CAMBIO DE CONTRASEÑAS
        $userId = $this->getUser()->getId();
        $user = $userRepository->find($userId);

        // $unhashedPassword = $data['password'];
        // $hashedPassword = $hasher->hashPassword($unhashedPassword);

        $user->setEmail($data['email']);
        // $user->setPassword($hashedPassword);
        $user->setName($data['name']);
        $user->setLastname($data['lastname']);
        $user->setPhone($data['phone']);
        $user->setShortDesc($data['shortDesc']);
        $user->setDescription($data['description']);

        $entityManager->flush();

        return $this->json($user, Response::HTTP_ACCEPTED);
    }


    /**
     * @Route(
     *      "/me",
     *      name="current_user_info",
     *      methods={"GET"},
     *  )
     *  @IsGranted("ROLE_USER")
     */
    public function me(UserNormalize $userNormalizer): Response
    {
        return $this->json(
            $userNormalizer->userNormalize($this->getUser())
        );
    }

    /**
     * @Route(
     *      "/token_check",
     *      name="token_check",
     *  )
     *  @IsGranted("ROLE_USER")
     */

    public function auth_token(): Response
    {
        return $this->json(
            null,
            Response::HTTP_ACCEPTED
        );
    }

    /**
    * @Route(
    *      "/uploadguideimage/{id}",
    *      name="uploadguideimage",
    *      methods={"POST"},
    *      requirements={
    *          "id": "\d+"
    *      }     
    * )
    */
    public function uploadGuideImage(
        User $user, 
        Request $request, 
        EntityManagerInterface $entityManager):Response {
        // dump($request->request);
        // dump($request->files);
        // dump($user);
        // die();

        if($request->files->has('File')) {
            $avatarFile = $request->files->get('File');

            $newFilename = uniqid().'.'.$avatarFile->guessExtension();

            // Intentamos mover el fichero a la carpeta public
            try {
                $avatarFile->move(
                    $request->server->get('DOCUMENT_ROOT') . DIRECTORY_SEPARATOR . 'images' . DIRECTORY_SEPARATOR . 'guides', // El primer parámetro es la ruta
                    $newFilename // El 2º param es el nombre del fichero
                );
            } catch (FileException $error) {
                throw new \Exception($error->getMessage());
            }

            $user->setImgpath($newFilename);
        }

        $entityManager->flush();
        
        return $this->json(
            null,
            Response::HTTP_NO_CONTENT
        );
    }

    /**
     * @Route(
     *      "/guidedetails/{id}",
     *      name="guideDetails",
     *      methods={"GET"},
     *      requirements={
     *          "id": "\d+"
     *      }     
     * )
     */
    public function guideDetails(
        int $id, 
        UserRepository $userRepository, 
        TourRepository $tourRepository, 
        TourNormalize $tourNormalize): Response
    {
        $tours = [];
        foreach($tourRepository->findActiveToursByGuide($id) as $tour) {
            array_push($tours, $tourNormalize->tourNormalize($tour));
        };

        $guide = $userRepository->find($id);

        $results = [
            'id' => $guide->getId(),
            'name' => $guide->getName(),
            'since' => $guide->getSince(),
            'shortDesc' => $guide->getShortDesc(),
            'description' => $guide->getDescription(),
            'imgpath' => $guide->getImgpath(),
            "totalTours" => count($tourRepository->findActiveToursByGuide($id)),
            "tours" => $tours
        ];

        return $this->json($results);
    }

    /**
     * @Route(
     *      "/latestguides",
     *      name="latestGuides",
     *      methods={"GET"},
     * )
     */
    public function latestGuides( 
        UserRepository $userRepository): Response
    {
        $results = [
            "results" => $userRepository->latestGuides()
        ];

        return $this->json($results);
    }
  
    /**
    * @Route(
    *    "/deleteuser/{id}", 
    *    name="deleteuser",
    *    methods={"DELETE"},
    *    requirements={
    *        "id": "\d+"
    *    }     
    *)
    * @IsGranted("ROLE_USER")
    */
    public function deleteUser(
        int $id, 
        UserRepository $userRepository,
        BookingRepository $bookingRepository,
        TourRepository $tourRepository,
        EntityManagerInterface $entityManager): Response
    {
        $user = $userRepository->find($id);

        foreach($bookingRepository->findBookingsByUser($id) as $booking) {
            $booking->setUser($userRepository->find(1));
            $booking->setStatus(Booking::STATUS_CANCELLED);
        };

        foreach($tourRepository->findToursByGuide($id) as $tour) {
            $tour->setUser($userRepository->find(1));
            $tour->setStatus(Tour::STATUS_INACTIVE);
        }

        $entityManager->remove($user);
        $entityManager->flush();

        return $this->json(
            null, 
            Response::HTTP_OK
        );
    }

}
