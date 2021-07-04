<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\TourRepository;
use App\Repository\CityRepository;
use App\Service\TourNormalize;

/**
 * @Route("/api", name="api_tour_")
 */
class ApiTourController extends AbstractController
{
    /**
     * @Route(
     *      "/tourdetails/{id}",
     *      name="tourDetails",
     *      methods={"GET"},
     *      requirements={
     *          "id": "\d+"
     *      }     
     * )
     */
    public function index(int $id, TourRepository $tourRepository, TourNormalize $tourNormalize): Response
    {
        $data = $tourRepository->find($id);
        return $this->json($tourNormalize->tourNormalize($data));
    }

    /**
    * @Route(
    *   "/toursbycity/{id}", 
    *   name="toursByCity",
    *   methods={"GET"}
    *)
    */
    public function toursbycity(int $id, TourRepository $tourRepository, CityRepository $cityRepository, TourNormalize $tourNormalize): Response
    {

        $tours = [];
        foreach($tourRepository->findToursByCity($id) as $tour) {
            array_push($tours, $tourNormalize->tourNormalize($tour));
        };

        $city = $cityRepository->find($id);

        $results = [
            "totalTours" => count($tourRepository->findToursByCity($id)),
            "city" => [
                'id' => $city->getId(),
                'name' => $city->getName(),
                'imgpath' => $city->getImgpath(),
            ],
            "tours" => $tours
        ];

        return $this->json($results);
    }
}
