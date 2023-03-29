<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ReaderRepository;
use OpenApi\Attributes as OA;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Csrf\TokenGenerator\TokenGeneratorInterface;

#[Route("/api")]
#[OA\Tag("Login")]
/**
 * Class LoginApiController
 */
class LoginApiController extends AbstractController
{
    #[Route("/login", name: "api_login", methods: ["POST"])]
    #[OA\Post(summary: "Log in to the API")]
    #[OA\Response(
        response: 200,
        description: "Log in to the API"
    )]
    #[OA\RequestBody(
        required: true,
        description: "fichier jason",
        content: new OA\JsonContent(
            ref: "#/components/schemas/User"
        )
    )]
    /**
     * Log in the reader
     *
     * @param Request $request
     * @param TokenGeneratorInterface $tokenGenerator
     * @param ReaderRepository $readers
     * @param EntityManagerInterface $em
     *
     * @return mixed json with the user or a 400 error
     */
    public function login(Request $request, TokenGeneratorInterface $tokenGenerator, ReaderRepository $readers, EntityManagerInterface $em)
    {
        // Get the data from the request json
        $data = json_decode($request->getContent(), true);
        $email = $data["email"];
        $password = $data["password"];

        // Find the user in the database with the given e-mail address
        $user = $readers->findOneBy(["email" => $email]);

        // If the user exists and the password is correct
        if ($user && $user->getPassword() == $password) {
            // Generate a token
            $token = $tokenGenerator->generateToken();
            $user->setToken($token);
            // Save the token in the database
            $em->persist($user);
            $em->flush();

            // Save the token in the session
            $request->getSession()->set("user_token", $token);

            // Return the reader
            return $this->json([
                "user" => $user
            ]);
        }
        // if the user does not exist or the password is incorrect
        // return a 400 error
        return $this->json([
            "message" => "No user corresponds to the given e-mail address and password."
        ], 400);
    }

    #[Route("/logout", name: "api_logout", methods: ["GET"])]
    #[OA\Get(summary: "Log out to the API")]
    #[OA\Response(
        response: 200,
        description: "Successful logout."
    )]
    #[OA\Response(
        response: 401,
        description: "No user logged in or no user associated to the session token."
    )]
    /**
     * Log out the reader
     *
     * @param Request $request
     * @param ReaderRepository $readers
     * @param EntityManagerInterface $em
     *
     * @return mixed json with the user or a 400 error
     */
    public function logout(Request $request, ReaderRepository $readers, EntityManagerInterface $em)
    {
        // Get the token from the session
        $token = $request->getSession()->get("user_token");

        // If no token is found in the session, there is no user logged in
        if (!$token) {
            // Return a 401 error
            return $this->json(["message" => "No user logged in."], 401);
        }

        // Get the user associated to the token
        $user = $readers->findOneBy(["token" => $token]);

        // If no user is found, there is no user associated to the token
        if (!$user) {
            // Return a 401 error
            return $this->json(["message" => "No user associated to the token.", 401]);
        }

        // Remove the token from the user
        $user->setToken(null);
        $em->persist($user);
        $em->flush();

        // Remove the token from the session
        $request->getSession()->remove('user_token');

        // Return a 200 response
        return new Response();
    }
}
