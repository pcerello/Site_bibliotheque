<?php

namespace App\Controller;

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
    #[OA\Response(
        response: 200,
        description: "List of books",
        content: new OA\JsonContent(
            ref: "#/components/schemas/BookInfos"
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

        if ($title) {
            $queryBuilder->andWhere('b.title LIKE :title')
                ->setParameter('title', "%$title%");
        }

        if ($author) {
            $queryBuilder->andWhere('a.name LIKE :author')
                ->setParameter('author', "%$author%");
        }

        if ($max && is_numeric($max)) {
            if ($max < 0) {
                return $this->json(["message" => "Nombre maximum de pages invalide"], 400);
            } else {
                $queryBuilder->setMaxResults($max);
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
            ref: "#/components/schemas/BookInfos"
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
    public function bookShow(BookRepository $bookRepository, int $id)
    {
        $query = $bookRepository->findBook()
            ->andWhere('b.id = :id')
            ->setParameter('id', $id)
            ->getQuery();

        $book = $query->getOneOrNullResult();

        if (!$book) {
            return $this->json(["message" => "Livre non trouvé"], 404);
        }

        return $this->json($book, 200);
    }
}
