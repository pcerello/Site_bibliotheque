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
 * Summary of BookApiController
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
        example: 1)]
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
     * Return a list of books
     * @return mixed
     */
    public function listBook(Request $request, BookRepository $bookRepository)
    {
        $queryBuilder = $bookRepository->findBook();

        $author = $request->query->get('author');
        $max = $request->query->get('max');
        $title = $request->query->get('title');
        $date = $request->query->get('date');
        $idAuthor = $request->query->get('idAuthor');

        if ($title) {
            $queryBuilder->andWhere('b.title LIKE :title')
                ->setParameter('title', "%$title%");
        }

        if ($author) {
            $queryBuilder->andWhere('a.name LIKE :author')
                ->setParameter('author', "%$author%");
        }

        if ($idAuthor) {
            $queryBuilder->andWhere('a.id = :idAuthor')
                ->setParameter('idAuthor', $idAuthor);
        }

        if ($max && is_numeric($max)) {
            if ($max < 0) {
                return $this->json(["message" => "Nombre maximum de pages invalide"], 400);
            } else {
                $queryBuilder->setMaxResults($max);
            }
        }

        if ($date) {
            if ($date === "DESC") {
                $queryBuilder->orderBy('b.year', 'DESC');
            } else {
                return $this->json(["message" => "Tri invalide"], 400);
            }
        }

        $books = $queryBuilder->getQuery()->getResult();

        if (!$books) {
            return $this->json(["message" => "Aucun livre trouvé"], 404);
        }

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
     * Return a book
     * @return mixed
     */
    public function bookShow(BookRepository $bookRepository, AuthorRepository $authorRepository, int $id)
    {
        $book = $bookRepository->findOneBy(["id" => $id]);

        if (!$book) {
            return $this->json(["message" => "Livre non trouvé"], 404);
        }

        $query = $authorRepository->findAuthorsOfBook($id);

        $authors = $query->getQuery()->getResult();

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
     * Return the authors of a book
     * @return mixed
     */
    public function bookAuthors(AuthorRepository $authorRepository, int $id)
    {
    $query = $authorRepository->findAuthorsOfBook($id);

    $authors = $query->getQuery()->getResult();

    if (!$authors) {
        return $this->json(["message" => "Aucun auteur trouvé"], 404);
    }

    return $this->json($authors, 200);
    }
}
