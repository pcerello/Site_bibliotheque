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
/**
 * Class AuthorApiController
 */
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
     * Return a list of authors with with the posibility to filter by name, max
     *
     * @param AuthorRepository $authorRepository
     * @param Request $request
     *
     * @return mixed json with the list of authors or a 404 error
     */
    public function findAuthor(AuthorRepository $authorRepository, Request $request)
    {
        // get query parameters
        $name = $request->query->get('name');
        $max = $request->query->get('max');

        // get the query
        $query = $authorRepository->findAuthor();

        // if we have in the query parameters the filter name
        if ($name) {
            // add the filter to the query
            $query->andWhere('a.name LIKE :name')
                ->setParameter('name', $name . '%');
        }

        // if we have in the query parameters the filter max
        if ($max) {
            // add the filter to the query
            $query->setMaxResults($max);
        }

        // get the authors
        $authors = $query->getQuery()->getResult();

        // if we don't have authors
        if (!$authors) {
            // return a 404 error
            return $this->json(["message" => "No authors"], 404);
        }

        // return the authors
        return $this->json($authors, 200);
    }
}
