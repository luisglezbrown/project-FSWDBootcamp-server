<?php

namespace App\Repository;

use App\Entity\Tour;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Tour|null find($id, $lockMode = null, $lockVersion = null)
 * @method Tour|null findOneBy(array $criteria, array $orderBy = null)
 * @method Tour[]    findAll()
 * @method Tour[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TourRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Tour::class);
    }

    /**
     * @return Tour[]|null Returns an array of Tour objects
     */
    public function findToursByCity($id)
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.city = :id')
            ->setParameter('id', $id)
            ->orderBy('t.ranking', 'DESC')
            ->getQuery()
            ->getResult()
        ;
    }


    /**
     * @return Tour[]|null Returns an array of Tour objects
     */
    public function findToursByGuide($id)
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.user = :id')
            ->setParameter('id', $id)
            ->orderBy('t.ranking', 'DESC')
            ->orderBy('t.city', 'ASC')
            ->getQuery()
            ->getResult()
        ;
    }

    /*
    public function findOneBySomeField($value): ?Tour
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
