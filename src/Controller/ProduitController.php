<?php

namespace App\Controller;

use App\Entity\Produit;
use App\Repository\ProduitRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProduitController extends AbstractController
{
    #[Route('/produit', name: 'app_produit')]
    public function index(ProduitRepository $produitRepository): Response
    {
        return $this->render('produit/index.html.twig', [
            'produits' => $produitRepository->findByStatut(),
        ]);
    }

    #[Route('produit/{id}', name: 'app_produit_show', methods: ['GET'])]
    public function detailprod(Produit $produit ): Response
    {
        return $this->render('produit/detailprod.html.twig', [
            'produits' => $produit,
        ]);

    }





}
