<?php

namespace App\Controller;

use OpenApi\Attributes as OA;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations\View;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Query\Expr;

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
    public function listBook(Request $request, EntityManagerInterface $entityManager)
    {
        $query = $entityManager->createQueryBuilder()
        ->select('b.id, b.title, b.picture, b.language, b.nbrPages as nbr_pages, b.resume, b.year, c.name as category, e.name as editor')
        ->from('\App\Entity\Book', 'b')
        ->innerJoin('\App\Entity\Category', 'c', Expr\Join::WITH, 'b.category = c.id')
        ->innerJoin('\App\Entity\Editor', 'e', Expr\Join::WITH, 'b.editor = e.id');

        /* Gestion des paramètres de la query string de la requête */
        $author_name = $request->get('author');
        // Nombre maximum de livres
        $max = $request->get('max');
        // Titre du livre
        $title = $request->get('title');
        // Vérification des valeurs des paramètres
        if ($author_name) {
            $query
            ->innerJoin('\App\Entity\Write', 'w', Expr\Join::WITH, 'b.id = w.idBook')
            ->innerJoin('\App\Entity\Author', 'a', Expr\Join::WITH, 'w.idAuthor = a.id')
            ->where("a.name LIKE :author_name")
            ->setParameter('author_name', "%$author_name%");
        }
        if ($title) {
            $query
            ->where("b.title LIKE :title")
            ->setParameter('title', "%$title%");
        }
        if ($max && is_numeric($max)) {
            // Si la valeur est négative
            if ($max < 0) {
                return $this->json(["message" => "Nombre maximum de pages invalide"], 400);
            } else {
                $query->setMaxResults($max);
            }
        }

        $query = $query->getQuery();
        $books = $query->getResult();

        return $this->json($books, 200);
    }

    #[OA\Get(summary: "Get a book")]
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
    public function bookShow(EntityManagerInterface $entityManager, int $id)
    {
        $query = $entityManager->createQueryBuilder()
        ->select('b.id, b.title, b.picture, b.language, b.nbrPages as nbr_pages, b.resume, b.year, c.name as category, e.name as editor')
        ->from('\App\Entity\Book', 'b')
        ->where('b.id = :id')
        ->setParameter('id', $id)
        ->innerJoin('\App\Entity\Category', 'c', Expr\Join::WITH, 'b.category = c.id')
        ->innerJoin('\App\Entity\Editor', 'e', Expr\Join::WITH, 'b.editor = e.id')
        ->getQuery();

        $reader = $query->getOneOrNullResult();

        if (!$reader) {
            return $this->json(["message" => "Book not found"], 404);
        }

        return $this->json($reader, 200);
    }
}
