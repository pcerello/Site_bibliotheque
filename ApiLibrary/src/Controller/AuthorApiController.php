<?php

namespace App\Controller;

use App\Repository\AuthorRepository;
use OpenApi\Attributes as OA;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations\View;

#[Route("/api")]
#[OA\Tag("Authors")]
class AuthorApiController extends AbstractController
{
    #[OA\Get(summary: "Get authors")]
    #[OA\Parameter(
        name: "name",
        in: "query",
        description: "Author name",
        required: true,
        example: "Béa"
    )]
    #[OA\Parameter(
        name: "max",
        in: "query",
        description: "Maximum number of authors",
        required: false,
        example: 4
    )]
    #[OA\Response(
        response: 200,
        description: "Get authors",
        content: new OA\JsonContent(
            ref: "#/components/schemas/AuthorInfos"
        )
    )]
    #[OA\Response(
        response: 404,
        description: "Author not found",
    )]
    #[View(serializerGroups: ["author_infos"])]
    #[Route("/authors", methods: ["GET"])]
    /**
     * Return a list of authors
     * @return mixed
     */
    public function findAuthor(AuthorRepository $authorRepository , Request $request)
    {
        $name = $request->query->get('name');
        $max = $request->query->get('max');

        // find by name = name% and max = max
        $query = $authorRepository->findAuthor();

if ($name) {
    $query->andWhere('a.name LIKE :name')
        ->setParameter('name', $name . '%');
}

        if ($max) {
            $query->setMaxResults($max);
        }

        $authors = $query->getQuery()->getResult();

        if (!$authors) {
            return $this->json(["message" => "Pas d'auteurs"], 404);
        }

        return $this->json($authors, 200);
    }
}
