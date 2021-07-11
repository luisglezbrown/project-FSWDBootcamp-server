<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use App\Entity\User;
use App\Repository\UserRepository;
use App\Repository\TourRepository;
use App\Service\GuideNormalize;
use App\Service\TourNormalize;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;


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
                    $request->server->get('DOCUMENT_ROOT') . DIRECTORY_SEPARATOR . 'guides', // El primer parámetro es la ruta
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
        foreach($tourRepository->findToursByGuide($id) as $tour) {
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
            "totalTours" => count($tourRepository->findToursByGuide($id)),
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

}
