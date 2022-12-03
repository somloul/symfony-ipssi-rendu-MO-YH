<?php

namespace App\Controller;

use App\Entity\Article;
use App\Repository\ArticleRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    #[Route('/test', name: 'app_home')]
    public function index(ArticleRepository $articleRepository): Response
    {
        return $this->render('home/index.html.twig', [
            'articles' => $articleRepository->findByCreatedDate(3),
        ]);
    }


   /* #[Route('/{id}', name: 'app_detail_article', methods: ['GET'])]
    public function show(Article $article): Response
    {
        return $this->render('home/show.html.twig', [
            'article' => $article,
        ]);
    }
*/











    
}
