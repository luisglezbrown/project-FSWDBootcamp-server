<?php

namespace App\Service;

use App\Entity\Booking;

class BookingNormalize {


    /**
    * Normalize the requested booking.
    * 
    * @param Booking $booking
    * 
    * @return array|null
    */
    public function bookingNormalize(Booking $booking): ?array {

        $user = $booking->getUser();
        $tour = $booking->getTour();

        $data = [
            'id' => $booking->getId(),
            'date' => $booking->getDate(),
            'pax' => $booking->getPax(),
            'status' => $booking->getStatus(),
            'user' => [
                'id' => $user->getId(),
                'name' => $user->getName()
            ],
            'tour' => [
                'id' => $tour->getId(),
                'imgpath' => $tour->getImgpath(),
                'title' => $tour->getTitle(),
                'city' => $tour->getCity(),
                'duration' => $tour->getDuration(),
                'startingTime' => $tour->getStartingTime(),
                'duration' => $tour->getDuration(),
                'meetingPoint' => $tour->getMeetingPoint(),
            ]
        ];

        return $data;
    }


}