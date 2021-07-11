<?php
namespace App\Controller;

use App\Repository\CategoryRepository;
use Symfony\Component\Routing\Annotation\Route;
use App\Service\CategoryNormalize;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

/**
 * @Route("/api", name="api_category_")
 */
class ApiCategoryController extends AbstractController{

    /**
     * @Route(
     *      "/categorieslist", 
     *      name="list",
     *      methods={"GET"})
     */
    public function categoriesList( 
        CategoryRepository $categoryRepository, 
        CategoryNormalize $categoryNormalize): Response
        {
            $categories = [];
    
            foreach($categoryRepository->findAll() as $category) {
                array_push($categories, $categoryNormalize->categoryNormalize($category));
            };
    
            return $this->json($categories);
        }

}