<?php

namespace App\Controller;

use App\Entity\Booking;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\TourRepository;
use App\Repository\UserRepository;
use App\Service\BookingNormalize;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Validator\ValidatorInterface;


/**
 * @Route("/api", name="api_booking_")
 */
class ApiBookingController extends AbstractController
{
    /**
    * @Route(
    *   "/newbooking", 
    *   name="newBooking",
    *   methods={"POST"}
    *)
    */
    public function newBooking(
        Request $request,
        EntityManagerInterface $entityManager,
        UserRepository $userRepository,
        TourRepository $tourRepository,
        ValidatorInterface $validator,
        BookingNormalize $bookingNormalize
        ): Response {
        $data = json_decode($request->getContent(), true);
        
        $user = $userRepository->find($data['userId']);
        $tour = $tourRepository->find($data['tourId']);
        $date = \DateTime::createFromFormat('Y-m-d', $data['date']);

        $booking = new Booking();
        $booking->setUser($user);
        $booking->setTour($tour);
        $booking->setPax($data['pax']);
        $booking->setDate($date);
        $booking->setStatus($data['status']);

        // validar el tour
        $errors = $validator->validate($booking);

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


        $entityManager->persist($booking);
        $entityManager->flush();

        // devolver respuesta con representación JSON del booking y 201 como código HTTP.
        return $this->json(
            $bookingNormalize->bookingNormalize($booking),
            Response::HTTP_CREATED
        );
    }
};
