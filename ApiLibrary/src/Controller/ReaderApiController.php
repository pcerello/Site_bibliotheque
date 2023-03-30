<?php

namespace App\Controller;

use App\Repository\BookRepository;
use App\Repository\ReaderRepository;
use OpenApi\Attributes as OA;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations\View;
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
     *
     * @param ReaderRepository $readerRepository
     * @return mixed json with the list of readers
     */
    public function listReader(ReaderRepository $readerRepository)
    {
        // get all readers
        $readers = $readerRepository->findAll();

        // return a json with the list of readers
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
     * Return a reader with the given id
     *
     * @param ReaderRepository $readerRepository
     * @param int $id
     *
     * @return mixed json with the reader or a 404 error
     */
    public function readerShow(ReaderRepository $readerRepository, int $id)
    {
        // get the reader with the given id
        $reader = $readerRepository->find($id);

        // if the reader is not found, return a 404 error
        if (!$reader) {
            return $this->json(["message" => "Reader not found"], 404);
        }

        // return a json with the reader
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
     * Return a list of books read by a reader with the given id
     * and the possibility to limit the number of books
     *
     * @param BookRepository $bookRepository
     * @param int $id
     * @param Request $request
     *
     * @return mixed json with the list of books or a 404 error
     */
    public function booksReadByReader(BookRepository $bookRepository, int $id, Request $request)
    {
        // get the maximum number of books
        $max = $request->query->get('max');

        // get the query builder
        $queryBuilder = $bookRepository->findBookBorrow();

        // add the where clause with the id of the reader
        $queryBuilder->where('bo.idReader = :id')
            ->setParameter('id', $id)
            ->getQuery();

        // if we have a maximum number of books, add the limit
        if ($max) {
            $queryBuilder->setMaxResults($max);
        }

        // get the list of books
        $books = $queryBuilder->getQuery()->getResult();

        // if the list of books is empty, return a 404 error
        if (!$books) {
            return $this->json(["message" => "Books not found"], 404);
        }

        // return a json with the list of books
        return $this->json($books, 200);
    }

    #[OA\Get(summary: "Recommendation of books for a reader")]
    #[OA\Parameter(
        name: "max",
        in: "query",
        description: "Maximum number of books",
        required: false,
        example: 4
    )]
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
     * It's the list of books read by the readers followed by the reader
     *
     * @param BookRepository $bookRepository
     * @param ReaderRepository $readerRepository
     * @param int $id
     *
     * @return mixed
     */
    public function booksRecommendationForReader(BookRepository $bookRepository, ReaderRepository $readerRepository, int $id, Request $request)
    {
        // get the query builder
        $queryBuilder = $readerRepository->findFollow();

        // add the where clause with the id of the reader to get the list of readers followed by the reader
        $queryBuilder->where('f.idFollow = :id')
            ->setParameter('id', $id)
            ->getQuery();

        // get the list of readers followed by the reader
        $myFollow = $queryBuilder->getQuery()->getResult();

        // get the query builder of the books
        $queryBuilder = $bookRepository->findBook();

        // add the where clause with the list of readers followed by the reader
        $queryBuilder->where('bo.idReader IN (:readers)')
            ->setParameter('readers', $myFollow);

        // get the maximum number of books
        $max = $request->query->get('max');

        // if we have a maximum number of books, add the limit
        if ($max) {
            $queryBuilder->setMaxResults($max);
        }

        // get the list of books
        $books = $queryBuilder->getQuery()->getResult();

        // if the list of books is empty, return a 404 error
        if (!$books) {
            return $this->json(["message" => "Books not found"], 404);
        }

        // return a json with the list of books
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
     * Return the list of readers followed by a reader
     *
     * @param ReaderRepository $readerRepository
     * @param int $id
     *
     * @return mixed json with the list of readers or a 404 error
     */
    public function listFollow(ReaderRepository $readerRepository, int $id)
    {
        // get the query builder
        $queryBuilder = $readerRepository->findFollow();

        // add the where clause with the id of the reader
        $queryBuilder->where('f.idFollow = :id')
            ->setParameter('id', $id)
            ->getQuery();

        // get the list of readers followed by the reader
        $follows = $queryBuilder->getQuery()->getResult();

        // if the list of readers is empty, return a 404 error
        if (!$follows) {
            return $this->json(["message" => "Follows not found"], 404);
        }

        // return a json with the list of readers
        return $this->json($follows, 200);
    }

    #[OA\Get(summary: "List of followers recommended")]
    #[OA\Parameter(
        name: "max",
        in: "query",
        description: "Maximum number of followers recommended",
        required: false,
        example: 4
    )]
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
    public function listFollowRecommendation(ReaderRepository $readerRepository, int $id, Request $request)
    {
        // get the query builder
        $queryBuilder = $readerRepository->findFollow();

        // set the where clause with the id of the reader
        $queryBuilder->where('f.idFollow = :id')
            ->setParameter('id', $id)
            ->getQuery();

        // get the maximum number of followers recommended
        $max = $request->query->get('max');

        // get the list of readers followed by the reader
        $myFollow = $queryBuilder->getQuery()->getResult();

        // get the query builder of the readers
        $queryBuilder = $readerRepository->findFollow();

        // we want the follow of the follow of the reader
        // and not the reader himself and not the reader already followed
        $queryBuilder->where('f.idFollow IN (:readers)')
            ->setParameter('readers', $myFollow)
            ->andWhere('f.idIsFollowed != :id')
            ->setParameter('id', $id)
            ->andWhere('f.idIsFollowed NOT IN (:myFollow)')
            ->setParameter('myFollow', $myFollow);
            
        // if we have a maximum number of followers recommended, add the limit
        if ($max) {
            $queryBuilder->setMaxResults($max);
        }

        // get the list of readers
        $follows = $queryBuilder->getQuery()->getResult();

        // if the list of readers is empty, return a 404 error
        if (!$follows) {
            return $this->json(["message" => "Follows not found"], 404);
        }

        // return a json with the list of readers
        return $this->json($follows, 200);
    }
}