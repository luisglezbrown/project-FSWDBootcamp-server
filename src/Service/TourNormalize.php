<?php

namespace App\Service;

use App\Entity\Tour;

class TourNormalize {


    /**
    * Normalize the requested tour.
    * 
    * @param Tour $tour
    * 
    * @return array|null
    */
    public function tourNormalize(Tour $tour): ?array {

        // $guideInfo = [];

        // foreach($tour->getUser() as $user) {
        //     array_push($guideInfo, [
        //         'id' => $user->getId(),
        //         'imgpath' => $user->getImgpath(),
        //         'name' => $user->getName()
        //     ]);
        // }

        $categories = [];

        foreach($tour->getCategories() as $category) {
            array_push($categories, ["id" => $category->getId(), "tag" => $category->getTag()]);
        }

        
        $guide = $tour->getUser();
        $city = $tour->getCity();

        $data = [
            'id' => $tour->getId(),
            'title' => $tour->getTitle(),
            'duration' => $tour->getDuration(),
            'weekDays' => $tour->getWeekDays(),
            'startingTime' => $tour->getStartingTime(),
            'meetingPoint' => $tour->getMeetingPoint(),
            'categories' => $categories,
            'imgpath' => $tour->getImgpath(),
            'highlight' => $tour->getHighlight(),
            'description' => $tour->getDescription(),
            'guide' => [
                'id' => $guide->getId(),
                'imgpath' => $guide->getImgpath(),
                'name' => $guide->getName(),
            ],
            'city' => [
                'id' => $city->getId(),
                'imgpath' => $city->getImgpath(),
                'name' => $city->getName(),
            ]
            // 'city' => $cityInfo
        ];

        return $data;
    }


}