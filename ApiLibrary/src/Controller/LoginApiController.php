<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ReaderRepository;
use App\Security\AccessTokenHandler;
use OpenApi\Attributes as OA;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;

use Doctrine\ORM\EntityManager;
use FOS\RestBundle\Controller\Annotations\View;
use Nelmio\ApiDocBundle\Annotation\Security as AnnotationSecurity;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted as ConfigurationIsGranted;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Csrf\TokenGenerator\TokenGeneratorInterface;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route("/api")]
#[OA\Tag("Login")]
/**
 * LoginApiController
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
        required : true,
        description: "fichier jason",
        content : new OA\JsonContent(
            ref: "#/components/schemas/User"
        )
    )]
    /**
     * Log in to the API
     * @return mixed
     */
    public function login(Request $request, TokenGeneratorInterface $tokenGenerator, ReaderRepository $readers, EntityManagerInterface $em)
    {
        // Récupérer les données de la requête json
        $data = json_decode($request->getContent(), true);
        $email = $data["email"];
        $password = $data["password"];

        // Vérifier si les identifiants de l'utilisateur sont bons
        $user = $readers->findOneBy(["email" => $email]);
        if ($user && $user->getPassword() == $password) {
            // Le nouveau token associé à l'utilisateur
            $token = $tokenGenerator->generateToken();
            $user->setToken($token);
            // Le sauvegarder en base de données
            $em->persist($user);
            $em->flush();

            // Enregistrer le token dans la session courante
            $request->getSession()->set("user_token", $token);

            // TODO : à voir quoi retourner en réponse avec les développeurs front-end
            return $this->json([
                "user" => $user
            ]);
        }
        // TODO : à voir avec les développeurs front-end
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
     * Log out to the API
     * @return mixed
     */
    public function logout(Request $request, ReaderRepository $readers, EntityManagerInterface $em)
    {
        // Obtenir le token sauvegardé en session
        $token = $request->getSession()->get("user_token");

        // S'il n'y pas de token de session, alors il n'y pas d'utilisateur connecté
        if (!$token) {
            return $this->json(["message" => "No user logged in."], 401);
        }
        
        // Obtenir l'utilisateur associé au token
        $user = $readers->findOneBy(["token" => $token]);
        
        // Si aucun utilisateur n'est associé à ce token
        if (!$user) {
            return $this->json(["message" => "No user associated to the token.", 401]);
        }

        // L'utilisateur existe, donc on supprime le token dans la base de données et dans la session
        $user->setToken(null);
        $em->persist($user);
        $em->flush();

        $request->getSession()->remove('user_token');

        return new Response();
    }
}
