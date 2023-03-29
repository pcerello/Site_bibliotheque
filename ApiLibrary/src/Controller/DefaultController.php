<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends AbstractController
{
    #[Route('/', name: 'app_default')]
    /**
     * Redirect to /api/doc
     *
     * @return Response
     */
    public function index(): Response
    {
        return $this->redirectToRoute('app.swagger_ui');
    }
}
