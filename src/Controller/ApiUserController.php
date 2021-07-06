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
use DateTimeImmutable;

/**
 * @Route("/api", name="api_user_")
 */
class ApiUserController extends AbstractController
{
    /**
    * @Route(
    *   "/newuser", 
    *   name="newUser",
    *   methods={"POST"}
    *)
    */
    public function newUser(
        Request $request,
        EntityManagerInterface $entityManager,
        ValidatorInterface $validator, 
    ): Response
    {
        $data = json_decode($request->getContent(), true);
        dump($data);

        //Creamos un nuevo objeto para enviar en la solicitud
        $user = new User();

        $user->setEmail($data['email']);
        $user->setPassword($data['password']);
        $user->setName($data['name']);
        $user->setLastname($data['lastname']);
        $user->setPhone($data['phone']);
        $user->setRole('ROLE_USER');
        $user->setShortDesc('n/a');
        $user->setDescription('n/a');
        //$user->setSince(DateTimeImmutable::__construct());
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
            Response::HTTP_CREATED,
            201
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
