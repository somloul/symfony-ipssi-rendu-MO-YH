<?php

namespace App\Controller;

use App\Entity\Produit;
use App\Form\ProduitAdminType;
use App\Repository\ProduitRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/produit')]
class AdminProduitController extends AbstractController
{
    #[Route('/liste', name: 'app_admin_produit_index', methods: ['GET'])]
    public function index(ProduitRepository $produitRepository): Response
    {
        return $this->render('admin/admin_produit/index.html.twig', [
            'produits' => $produitRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_admin_produit_new', methods: ['GET', 'POST'])]
    public function new( EntityManagerInterface $entityManager, Request $request, ProduitRepository $produitRepository): Response
    {

        if (isset($_POST['produitAdmin'])) {
            $produitAdmin = new Produit();

            $produitAdmin->setTitre($_POST['titre']);
            $produitAdmin->setDescription($_POST['description']);
            $produitAdmin->setPrix($_POST['prix']);
            $produitAdmin->setStatut($_POST['statut']);
            $produitAdmin->setQuantiteStock($_POST['quantiteStock']);
            $produitAdmin->setCouleur($_POST['couleur']);
            $produitAdmin->setImage($_POST['image']);

            $entityManager->persist($produitAdmin);
            $entityManager->flush();

            return $this->redirectToRoute('app_login');
        }

        return $this->renderForm('admin/admin_produit/new.html.twig', [
        ]);
    }




















    #[Route('/{id}', name: 'app_admin_produit_show', methods: ['GET'])]
    public function show(Produit $produit): Response
    {
        return $this->render('admin/admin_produit/show.html.twig', [
            'produit' => $produit,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_admin_produit_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Produit $produit, ProduitRepository $produitRepository): Response
    {
        $form = $this->createForm(ProduitAdminType::class, $produit);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $produitRepository->save($produit, true);

            return $this->redirectToRoute('app_admin_produit_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('admin/admin_produit/edit.html.twig', [
            'produit' => $produit,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_admin_produit_delete', methods: ['POST'])]
    public function delete(Request $request, Produit $produit, ProduitRepository $produitRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$produit->getId(), $request->request->get('_token'))) {
            $produitRepository->remove($produit, true);
        }

        return $this->redirectToRoute('app_admin_produit_index', [], Response::HTTP_SEE_OTHER);
    }
}
