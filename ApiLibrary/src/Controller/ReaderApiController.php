<?php

namespace App\Controller;

use ContainerURNMEDA\getSluggerService;
use OpenApi\Attributes as OA;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations\View;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Query\Expr;

#[Route("/api")]
#[OA\Tag("Readers")]
/**
 * Summary of UserApiController
 */
class ReaderApiController extends AbstractController
{
    #[OA\Get(summary: "List of readers")]
    #[OA\Response(
        response: 200,
        description: "List of readers",
        content: new OA\JsonContent(
            ref: "#/components/schemas/ReaderInfos"
        )
    )]
    #[View(serializerGroups: ["reader_infos"])]
    #[Route("/readers", methods: ["GET"])]
    /**
     * Return a list of readers
     * @return mixed
     */
    public function listReader(EntityManagerInterface $entityManager)
    {
        $query = $entityManager->createQueryBuilder()
            ->select('r.id, r.firstName, r.lastName, r.email, r.picture')
            ->from('\App\Entity\Reader', 'r')
            ->getQuery();

        $readers = $query->getResult();

        return $this->json($readers, 200);
    }

    #[OA\Get(summary: "Get a reader")]
    #[OA\Response(
        response: 200,
        description: "Get a reader",
        content: new OA\JsonContent(
            ref: "#/components/schemas/ReaderInfos"
        )
    )]
    #[OA\Response(
        response: 404,
        description: "Reader not found"
    )]
    #[View(serializerGroups: ["reader_infos"])]
    #[Route("/readers/{id}", methods: ["GET"])]
    /**
     * Return a reader
     * @return mixed
     */
    public function readerShow(EntityManagerInterface $entityManager, int $id)
    {
        $query = $entityManager->createQueryBuilder()
            ->select('r.id, r.firstName, r.lastName, r.email, r.picture')
            ->from('\App\Entity\Reader', 'r')
            ->where('r.id = :id')
            ->setParameter('id', $id)
            ->getQuery();

        $reader = $query->getOneOrNullResult();

        if (!$reader) {
            return $this->json(["message" => "Reader not found"], 404);
        }

        return $this->json($reader, 200);
    }

    #[OA\Get(summary: "List book read by a reader")]
    #[OA\Response(
        response: 200,
        description: "List book read by a reader",
        content: new OA\JsonContent(
            ref: "#/components/schemas/BookInfos"
        )
    )]
    #[OA\Response(
        response: 404,
        description: "Reader not found"
    )]
    #[View(serializerGroups: ["book_infos"])]
    #[Route("/readers/{id}/books", methods: ["GET"])]
    /**
     * Return a list of books read by a reader
     * @return mixed
     */
    public function booksReadByReader(EntityManagerInterface $entityManager, int $id)
    {
        $query = $entityManager->createQueryBuilder()
            ->select('b.id, b.title, b.picture, b.language, b.nbrPages as nbr_pages, b.resume, b.year, c.name as category, e.name as editor')
            ->from('\App\Entity\Book', 'b')
            ->innerJoin('\App\Entity\Category', 'c', Expr\Join::WITH, 'b.category = c.id')
            ->innerJoin('\App\Entity\Editor', 'e', Expr\Join::WITH, 'b.editor = e.id')
            ->innerJoin('\App\Entity\Borrow', 'bo', Expr\Join::WITH, 'b.id = bo.idBook')
            ->innerJoin('\App\Entity\Reader', 'r', Expr\Join::WITH, 'bo.idReader = r.id')
            ->where('r.id = :id')
            ->setParameter('id', $id)
            ->getQuery();

        $books = $query->getResult();

        if (!$books) {
            return $this->json(["message" => "Reader not found"], 404);
        }

        return $this->json($books, 200);
    }

    #[OA\Get(summary: "Recommendation of books for a reader")]
    #[OA\Response(
        response: 200,
        description: "Recommendation of books for a reader",
        content: new OA\JsonContent(
            ref: "#/components/schemas/BookInfos"
        )
    )]
    #[OA\Response(
        response: 404,
        description: "Reader not found"
    )]
    #[View(serializerGroups: ["book_infos"])]
    #[Route("/readers/{id}/books/recommendations", methods: ["GET"])]
    /**
     * Return a list of books recommended for a reader
     * @return mixed
     */
    public function booksRecommendationForReader(EntityManagerInterface $entityManager, int $id)
    {
        // recuperer les id de mes followers
        $query = $entityManager->createQueryBuilder()
            ->select('r.id')
            ->from('\App\Entity\Reader', 'r')
            ->innerJoin('\App\Entity\Follow', 'f', Expr\Join::WITH, 'r.id = f.idIsFollowed')
            ->where('f.idFollow = :id')
            ->setParameter('id', $id)
            ->getQuery();

        $friends = $query->getResult();

        // recuperer les id des livres que mes followers ont lu
        $query = $entityManager->createQueryBuilder()
            ->select('b.id, b.title, b.picture, b.language, b.nbrPages as nbr_pages, b.resume, b.year, c.name as category, e.name as editor')
            ->from('\App\Entity\Book', 'b')
            ->innerJoin('\App\Entity\Borrow', 'bo', Expr\Join::WITH, 'b.id = bo.idBook')
            ->innerJoin('\App\Entity\Category', 'c', Expr\Join::WITH, 'b.category = c.id')
            ->innerJoin('\App\Entity\Editor', 'e', Expr\Join::WITH, 'b.editor = e.id')
            ->where('bo.idReader IN (:friends)')
            ->setParameter('friends', $friends)
            ->getQuery();

        $books = $query->getResult();


        return $this->json($books, 200);
    }
}
