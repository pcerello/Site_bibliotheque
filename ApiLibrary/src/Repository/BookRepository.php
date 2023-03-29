<?php

namespace App\Repository;

use App\Entity\Book;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\QueryBuilder;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr;

/**
 * @extends ServiceEntityRepository<Book>
 *
 * @method Book|null find($id, $lockMode = null, $lockVersion = null)
 * @method Book|null findOneBy(array $criteria, array $orderBy = null)
 * @method Book[]    findAll()
 * @method Book[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BookRepository extends ServiceEntityRepository
{
    /**
     * Method __construct
     *
     * @param ManagerRegistry $registry
     */
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Book::class);
    }

    /**
     * Method findBook
     *
     * @return QueryBuilder
     */
    public function findBook(): QueryBuilder
    {
        // return the query builder for the books
        return $this->createQueryBuilder('b')
            ->leftJoin('\App\Entity\Write', 'w', Expr\Join::WITH, 'b.id = w.idBook')
            ->leftJoin('\App\Entity\Author', 'a', Expr\Join::WITH, 'w.idAuthor = a.id')
            ->leftJoin('\App\Entity\Borrow', 'bo', Expr\Join::WITH, 'b.id = bo.idBook')
            ->addSelect('b, a.name as nameAuthor')
            ->groupBy('b.id');
    }

    /**
     * Method findBookBorrow
     *
     * @return QueryBuilder
     */
    public function findBookBorrow(): QueryBuilder
    {
        // return the query builder for the books with the date of borrow and return
        return $this->createQueryBuilder('b')
            ->leftJoin('\App\Entity\Write', 'w', Expr\Join::WITH, 'b.id = w.idBook')
            ->leftJoin('\App\Entity\Author', 'a', Expr\Join::WITH, 'w.idAuthor = a.id')
            ->leftJoin('\App\Entity\Borrow', 'bo', Expr\Join::WITH, 'b.id = bo.idBook')
            ->addSelect('b, bo.dateBorrow as dateBorrow, bo.dateReturn as dateReturn, a.name as nameAuthor')
            ->groupBy('b.id')
            ->orderBy('bo.dateBorrow', 'DESC');
    }
}
