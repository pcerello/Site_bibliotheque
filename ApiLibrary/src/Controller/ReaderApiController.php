<?php

namespace App\Controller;

use OpenApi\Attributes as OA;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations\View;
use Doctrine\ORM\EntityManagerInterface;

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
        $query = $entityManager
            ->createQuery("SELECT r.id, r.firstName, r.lastName, r.email FROM \App\Entity\Reader r");

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
        $query = $entityManager
            ->createQuery("SELECT r.id, r.firstName, r.lastName, r.email FROM \App\Entity\Reader r WHERE r.id = :id")
            ->setParameter("id", $id);

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
        $query = $entityManager
            ->createQuery("SELECT b.id, b.title FROM \App\Entity\Borrow bo 
                JOIN bo.idBook b JOIN bo.idReader r WHERE r.id = :id")
            ->setParameter("id", $id);

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
        $query = $entityManager
            ->createQuery("SELECT b.id, b.title FROM \App\Entity\Borrow bo 
                JOIN bo.idBook b JOIN bo.idReader r WHERE r.id = :id")
            ->setParameter("id", $id);

        $books = $query->getResult();

        if (!$books) {
            return $this->json(["message" => "Reader not found"], 404);
        }

        // Get the list of books read by the reader
        $booksRead = [];
        foreach ($books as $book) {
            $booksRead[] = $book["id"];
        }
        //Pour l'instant on a 1 ami donc la vie est triste
        /*
        // Get the list of books read by the reader's friends
        $query = $entityManager
        ->createQuery("SELECT b.id FROM \App\Entity\Borrow bo JOIN bo.idBook b
            JOIN bo.idReader r JOIN r.friends f WHERE f.id = :id")
        ->setParameter("id", $id);
        $books = $query->getResult();
        // Get the list of books read by the reader's friends
        $booksReadByFriends = [];
        foreach ($books as $book) {
        $booksReadByFriends[] = $book["id"];
        }
        */

        return $this->json($books, 200);
    }
}
