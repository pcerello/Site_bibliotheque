<?php

namespace App\Repository;

use App\Entity\Author;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\QueryBuilder;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr;

/**
 * @extends ServiceEntityRepository<Author>
 *
 * @method Author|null find($id, $lockMode = null, $lockVersion = null)
 * @method Author|null findOneBy(array $criteria, array $orderBy = null)
 * @method Author[]    findAll()
 * @method Author[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AuthorRepository extends ServiceEntityRepository
{
    /**
     * Method __construct
     *
     * @param ManagerRegistry $registry
     */
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Author::class);
    }

    /**
     * Method findAuthor
     *
     * @return QueryBuilder
     */
    public function findAuthor(): QueryBuilder
    {
        // return the query builder for the author with the name in ascending order
        return $this->createQueryBuilder('a')
            ->orderBy('a.name', 'ASC');
    }

    /**
     * Method findAuthorsOfBook
     *
     * @return QueryBuilder
     */
    public function findAuthorsOfBook(int $idBook): QueryBuilder
    {
        // return the query builder for find the authors of the book
        return $this->createQueryBuilder('a')
            ->innerJoin('\App\Entity\Write', 'w', Expr\Join::WITH, 'a.id = w.idAuthor')
            ->where('w.idBook = :idBook')
            ->setParameter('idBook', $idBook)
            ->orderBy('a.name', 'ASC');
    }
}
