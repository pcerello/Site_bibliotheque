<?php

namespace App\Controller;

use OpenApi\Attributes as OA;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations\View;
use Doctrine\ORM\EntityManagerInterface;

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
    public function listBook(EntityManagerInterface $entityManager)
    {
        $query = $entityManager
            ->createQuery("SELECT b.id, b.title FROM \App\Entity\Book b");

        $books = $query->getResult();

        return $this->json($books, 200);
    }
}
