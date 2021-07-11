<?php

namespace App\Service;

use App\Entity\Category;

class CategoryNormalize {


    /**
     * Normalize an interest.
     * 
     * @param Category $interest
     * 
     * @return array|null
    */
    public function categoryNormalize (Category $category): ?array {

        return [
            'id' => $category->getId(),
            'tag' => $category->getTag()
        ];
    }


}