<?php

namespace App\Service;

use App\Entity\User;

class UserNormalize {


    /**
    * Normalize the requested tour.
    * 
    * @param User $guide
    * 
    * @return array|null
    */
    public function userNormalize(User $user): ?array {

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
            'id' => $user->getId(),
            'roles' => $user->getRoles(),
            'email' => $user->getEmail(),
            'name' => $user->getName(),
            'lastname' => $user->getLastname(),
            'phone' => $user->getPhone(),
            'since' => $user->getSince(),
            'shortDesc' => $user->getShortDesc(),
            'description' => $user->getDescription(),
            'imgpath' => $user->getImgpath(),
        ];

        return $data;
    }


}