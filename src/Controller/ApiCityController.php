<?php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\CityRepository;

/**
 * 
 * @Route("/api", name="api_city_")
 * 
 * 
 */
class ApiCityController extends AbstractController
{
    /**
    * @Route(
    *   "/allcities", 
    *   name="all",
    *   methods={"GET"}
    *)
    */
    public function allCities(CityRepository $cityRepository): Response
    {
            $results = [
            "total" => count($cityRepository->findAll()),
            "results" => $cityRepository->findAllOrderedByName()
        ];

        return $this->json($results);
    }


    /**
    * @Route(
    *   "/topdestinations", 
    *   name="topDestinations",
    *   methods={"GET"}
    *)
    */
    public function topDestinations(CityRepository $cityRepository): Response
    {
        $results = [
            "total" => count($cityRepository->topDestinations()),
            "results" => $cityRepository->topDestinations()
        ];

        return $this->json($results);
    }

}
