<?php

namespace App\Controller;

use App\Repository\AuthorRepository;
use App\Repository\BookRepository;
use OpenApi\Attributes as OA;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations\View;

#[Route("/api")]
#[OA\Tag("Books")]
/**
 * Class BookApiController
 */
class BookApiController extends AbstractController
{
    #[OA\Get(summary: "List of books")]
    #[OA\Parameter(
        name: "author",
        in: "query",
        description: "Author name",
        required: false,
        example: "J.K. Rowling"
    )]
    #[OA\Parameter(
        name: "max",
        in: "query",
        description: "Maximum number of books",
        required: false,
        example: 10
    )]
    #[OA\Parameter(
        name: "title",
        in: "query",
        description: "Book title",
        required: false,
        example: "Harry Potter"
    )]
    #[OA\Parameter(
        name: "date",
        in: "query",
        description: "Sort by date",
        required: false,
        example: "DESC"
    )]
    #[OA\Parameter(
        name: "idAuthor",
        in: "query",
        description: "Author id",
        required: false,
        example: 1
    )]
    #[OA\Response(
        response: 200,
        description: "List of books",
        content: new OA\JsonContent(
            ref: "#/components/schemas/BookAuthors"
        )
    )]
    #[View(serializerGroups: ["book_infos"])]
    #[Route("/books", methods: ["GET"])]
    /**
     * Return a list of books with the posibility to filter by author, max, title, date, idAuthor
     *
     * @param Request $request
     * @param BookRepository $bookRepository
     *
     * @return mixed json with the list of books or a 404 error
     */
    public function listBook(Request $request, BookRepository $bookRepository)
    {
        // get queryBuilder
        $queryBuilder = $bookRepository->findBook();

        // get query parameters
        $author = $request->query->get('author');
        $max = $request->query->get('max');
        $title = $request->query->get('title');
        $date = $request->query->get('date');
        $idAuthor = $request->query->get('idAuthor');

        // if we have in the query the filter title
        if ($title) {
            // we add the filter title to the queryBuilder
            $queryBuilder->andWhere('b.title LIKE :title')
                ->setParameter('title', "%$title%");
        }

        // if we have in the query the filter author
        if ($author) {
            // we add the filter author to the queryBuilder
            $queryBuilder->andWhere('a.name LIKE :author')
                ->setParameter('author', "%$author%");
        }

        // if we have in the query the filter idAuthor
        if ($idAuthor) {
            // we add the filter idAuthor to the queryBuilder
            $queryBuilder->andWhere('a.id = :idAuthor')
                ->setParameter('idAuthor', $idAuthor);
        }

        // if we have in the query the filter max
        if ($max && is_numeric($max)) {
            // if max is negative
            if ($max < 0) {
                // we return an error 400
                return $this->json(["message" => "Number invalid"], 400);
            } else {
                // else we add the filter max to the queryBuilder
                $queryBuilder->setMaxResults($max);
            }
        }

        // if we have in the query the filter date
        if ($date) {
            // if date is DESC
            if ($date === "DESC") {
                // we add the filter date to the queryBuilder
                $queryBuilder->orderBy('b.year', 'DESC');
            } else {
                // else we return an error 400
                return $this->json(["message" => "Sort invalid"], 400);
            }
        }

        // we get the result of the query, all the books
        $books = $queryBuilder->getQuery()->getResult();

        // if we don't have any book
        if (!$books) {
            return $this->json(["message" => "No book found"], 404);
        }

        // we return the list of books
        return $this->json($books, 200);
    }

    #[OA\Get(summary: "Get a book")]
    #[OA\Parameter(
        name: "id",
        in: "path",
        description: "Book id",
        required: true,
        example: 1
    )]
    #[OA\Response(
        response: 200,
        description: "Get a book",
        content: new OA\JsonContent(
            ref: "#/components/schemas/BookAuthors"
        )
    )]
    #[OA\Response(
        response: 404,
        description: "Book not found"
    )]
    #[View(serializerGroups: ["books_infos"])]
    #[Route("/books/{id}", methods: ["GET"])]
    /**
     * Return a book with the right id
     *
     * @param BookRepository $bookRepository
     * @param AuthorRepository $authorRepository
     * @param int $id
     *
     * @return mixed json with the book or a 404 error
     */
    public function bookShow(BookRepository $bookRepository, AuthorRepository $authorRepository, int $id)
    {
        // we get the book with the right id
        $book = $bookRepository->findOneBy(["id" => $id]);

        // if we don't have any book
        if (!$book) {
            // we return an error 404
            return $this->json(["message" => "The book with id $id doesn't exist"], 404);
        }

        // we get the authors of the book
        $query = $authorRepository->findAuthorsOfBook($id);

        // we get the result of the query, all the authors
        $authors = $query->getQuery()->getResult();

        // if we don't have any author
        if (!$authors) {
            // we return an empty array
            $authors = [];
        }

        // we return the book and the authors
        return $this->json(["book" => $book, "authors" => $authors], 200);
    }

    #[OA\Get(summary: "Get the authors of a book")]
    #[OA\Parameter(
        name: "id",
        in: "path",
        description: "Book id",
        required: true,
        example: 1
    )]
    #[OA\Response(
        response: 200,
        description: "Get the authors of a book",
        content: new OA\JsonContent(
            ref: "#/components/schemas/BookAuthors"
        )
    )]
    #[OA\Response(
        response: 404,
        description: "Book not found or no author found"
    )]
    #[View(serializerGroups: ["authors_infos"])]
    #[Route("/books/{id}/authors", methods: ["GET"])]
    /**
     * Return the authors of a book with the right id
     *
     * @param AuthorRepository $authorRepository
     * @param int $id
     *
     * @return mixed
     */
    public function bookAuthors(AuthorRepository $authorRepository, int $id)
    {
        // we get the request
        $query = $authorRepository->findAuthorsOfBook($id);

        // we get the result of the requests, all the authors
        $authors = $query->getQuery()->getResult();

        // if we don't have any author
        if (!$authors) {
            // we return an error 404
            return $this->json(["message" => "No author found for the book with id $id"], 404);
        }

        // we return the list of authors
        return $this->json($authors, 200);
    }
}
