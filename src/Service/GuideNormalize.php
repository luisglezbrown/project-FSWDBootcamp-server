<?php

namespace App\Service;

use App\Entity\User;

class GuideNormalize {


    /**
    * Normalize the requested tour.
    * 
    * @param User $guide
    * 
    * @return array|null
    */
    public function guideNormalize(User $guide): ?array {

        // $guideInfo = [];

        // foreach($tour->getUser() as $user) {
        //     array_push($guideInfo, [
        //         'id' => $user->getId(),
        //         'imgpath' => $user->getImgpath(),
        //         'name' => $user->getName()
        //     ]);
        // }

        // $cityInfo = [];

        // foreach($tour->getCity() as $city) {
        //     array_push($cityInfo, [
        //         'id' => $city->getId(),
        //         'name' => $city->getName()
        //     ]);
        // }
        
        // $guide = $tour->getUser();
        // $city = $tour->getCity();

        $data = [
            'id' => $guide->getId(),
            'name' => $guide->getName(),
            'since' => $guide->getSince(),
            'shortDesc' => $guide->getShortDesc(),
            'description' => $guide->getDescription(),
            'imgpath' => $guide->getImgpath(),
        ];

        return $data;
    }


}