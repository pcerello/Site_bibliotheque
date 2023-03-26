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
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Book::class);
    }

    public function findBook(): QueryBuilder
    {
        return $this->createQueryBuilder('b')
            ->leftJoin('\App\Entity\Write', 'w', Expr\Join::WITH, 'b.id = w.idBook')
            ->leftJoin('\App\Entity\Author', 'a', Expr\Join::WITH, 'w.idAuthor = a.id')
            ->leftJoin('\App\Entity\Borrow', 'bo', Expr\Join::WITH, 'b.id = bo.idBook')
            ->groupBy('b.id');
    }
}
