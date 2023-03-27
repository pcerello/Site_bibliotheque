<?php

namespace App\Controller;

use App\Repository\BookRepository;
use App\Repository\ReaderRepository;
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
    public function listReader(ReaderRepository $readerRepository)
    {
        $readers = $readerRepository->findAll();

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
    public function readerShow(ReaderRepository $readerRepository, int $id)
    {
        $reader = $readerRepository->find($id);

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
    public function booksReadByReader(BookRepository $bookRepository, int $id)
    {
        $queryBuilder = $bookRepository->findBookBorrow();

        $queryBuilder->where('bo.idReader = :id')
            ->setParameter('id', $id)
            ->getQuery();

        $books = $queryBuilder->getQuery()->getResult();

        if (!$books) {
            return $this->json(["message" => "Books not found"], 404);
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
    public function booksRecommendationForReader(BookRepository $bookRepository, ReaderRepository $readerRepository, int $id)
    {
        $queryBuilder = $readerRepository->findFollow();

        $queryBuilder->where('f.idFollow = :id')
            ->setParameter('id', $id)
            ->getQuery();

        $myFollow = $queryBuilder->getQuery()->getResult();

        $queryBuilder = $bookRepository->findBook();

        $queryBuilder->where('bo.idReader IN (:readers)')
            ->setParameter('readers', $myFollow)
            ->getQuery();

        $books = $queryBuilder->getQuery()->getResult();

        if (!$books) {
            return $this->json(["message" => "Books not found"], 404);
        }

        return $this->json($books, 200);
    }
}
