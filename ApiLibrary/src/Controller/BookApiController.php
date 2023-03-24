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
        ->select('b.id, b.title')
        ->from('\App\Entity\Book', 'b');

        /* Gestion des paramètres de la query string de la requête */
        $author_name = $request->get('author');
        // Nombre maximum de livres
        $max = $request->get('max');
        // Vérification des valeurs des paramètres
        if ($author_name) {
            $query
            ->innerJoin('\App\Entity\Write', 'w', Expr\Join::WITH, 'b.id = w.idBook')
            ->innerJoin('\App\Entity\Author', 'a', Expr\Join::WITH, 'w.idAuthor = a.id')
            ->where("a.name LIKE :author_name")
            ->setParameter('author_name', "%$author_name%");
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
        ->select('b.id, b.title, b.picture, b.language, b.nbrPages, b.resume, b.year, c.name, e.name')
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
