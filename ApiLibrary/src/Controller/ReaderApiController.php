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
use Symfony\Component\HttpFoundation\Request;


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
    #[OA\Parameter(
        name: "max",
        in: "query",
        description: "Maximum number of books",
        required: false,
        example: 4
    )]
    #[OA\Response(
        response: 200,
        description: "List book read by a reader",
        content: new OA\JsonContent(
            ref: "#/components/schemas/BookBorrow"
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
    public function booksReadByReader(BookRepository $bookRepository, int $id, Request $request)
    {
        $max = $request->query->get('max');

        $queryBuilder = $bookRepository->findBookBorrow();

        $queryBuilder->where('bo.idReader = :id')
            ->setParameter('id', $id)
            ->getQuery();

        if ($max) {
            $queryBuilder->setMaxResults($max);
        }

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
            ref: "#/components/schemas/BookAuthors"
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

    #[OA\Get(summary: "List of follows")]
    #[OA\Response(
        response: 200,
        description: "List of follows",
        content: new OA\JsonContent(
            ref: "#/components/schemas/ReaderInfos"
        )
    )]
    #[View(serializerGroups: ["reader_infos"])]
    #[Route("/readers/{id}/follow", methods: ["GET"])]
    /**
     * Return a list of follows
     * @return mixed
     */
    public function listFollow(ReaderRepository $readerRepository, int $id)
    {
        $queryBuilder = $readerRepository->findFollow();

        $queryBuilder->where('f.idFollow = :id')
            ->setParameter('id', $id)
            ->getQuery();

        $follows = $queryBuilder->getQuery()->getResult();

        if (!$follows) {
            return $this->json(["message" => "Follows not found"], 404);
        }

        return $this->json($follows, 200);
    }

    #[OA\Get(summary: "List of followers recommended")]
    #[OA\Response(
        response: 200,
        description: "List of followers recommended",
        content: new OA\JsonContent(
            ref: "#/components/schemas/ReaderInfos"
        )
    )]
    #[OA\Response(
        response: 404,
        description: "Reader not found"
    )]
    #[View(serializerGroups: ["reader_infos"])]
    #[Route("/readers/{id}/follow/recommendations", methods: ["GET"])]
    /**
     * Return a list of followers recommended
     * It's the follow of the follow of the reader
     * +1 level of recommendation
     * 
     * @return mixed
     */
    public function listFollowRecommendation(ReaderRepository $readerRepository, int $id)
    {
        $queryBuilder = $readerRepository->findFollow();

        // follow of the reader
        $queryBuilder->where('f.idFollow = :id')
            ->setParameter('id', $id)
            ->getQuery();

        $myFollow = $queryBuilder->getQuery()->getResult();

        $queryBuilder = $readerRepository->findFollow();

        // follow of the follow of the reader
        $queryBuilder->where('f.idFollow IN (:readers)')
            ->setParameter('readers', $myFollow)
            ->andWhere('f.idIsFollowed != :id')
            ->setParameter('id', $id)
            ->andWhere('f.idIsFollowed NOT IN (:myFollow)')
            ->setParameter('myFollow', $myFollow)
            ->getQuery();

        $follows = $queryBuilder->getQuery()->getResult();

        if (!$follows) {
            return $this->json(["message" => "Follows not found"], 404);
        }

        return $this->json($follows, 200);
    }
}
