<?php

namespace App\Repository;

use App\Entity\Produit;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Produit>
 *
 * @method Produit|null find($id, $lockMode = null, $lockVersion = null)
 * @method Produit|null findOneBy(array $criteria, array $orderBy = null)
 * @method Produit[]    findAll()
 * @method Produit[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProduitRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Produit::class);
    }

    public function save(Produit $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Produit $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

//    /**
//     * @return Produit[] Returns an array of Produit objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('p')
//            ->andWhere('p.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('p.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

    public function findByStatut(): array
    {
        $qb = $this->createQueryBuilder('a');
        $qb->Where('a.statut = 1 and a.quantiteStock > 1');
        return $qb->getQuery()->getResult();
    }

    public function getByQteAndColor($qte,$color): array
    {
        $qb = $this->createQueryBuilder("a");
        $qb->Where("a.quantiteStock = ".$qte." and a.couleur = '.$color.'");
        return $qb->getQuery()->getResult();
    }

    public function getByQte($qte): array
    {
        $qb = $this->createQueryBuilder("a");
        $qb->Where("a.quantiteStock = ".$qte);
        return $qb->getQuery()->getResult();
    }

    public function getByColor($color): array
    {
        $qb = $this->createQueryBuilder("a");
        $qb->Where("a.couleur = '.$color.'");
        return $qb->getQuery()->getResult();
    }



 //   public function findOneBySomeField($statut statut): ?Produit
   // {
     //   return $this->createQueryBuilder('p')
       //     ->andWhere('p. = :statut')
         //   ->setParameter('val', $value)
           // ->getQuery()
           // ->getOneOrNullResult()
     //   ;
 //  }
}
