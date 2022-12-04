<?php

namespace App\Controller;

use App\Entity\Produit;
use App\Form\ProduitType;
use App\Repository\ProduitRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;

#[Route('/produit')]
class ProduitController extends AbstractController
{
    private $em,$security;
    public function __construct(EntityManagerInterface $em,Security $security)
    {
        $this->em = $em;
        $this->security = $security;
    }

    #[Route('/', name: 'app_produit', methods: ['GET'])]
    public function index(ProduitRepository $produitRepository): Response
    {
        $user = $this->security->getUser();
        $listProduits = $this->em->getRepository(Produit::class)->findAll();
       /* if(isset($_GET['prix'])){
            $prix = array();
            foreach ($listProduits as $key => $row)
            {
                $prix[$key] = $row['prix'];
            }
            if($_GET['prix']=="checked"){
                array_multisort($prix, SORT_DESC, $inventory);
            }else{
                array_multisort($prix, SORT_ASC, $inventory);
            }
        }

        if(isset($_GET['vendeur'])) {
            $vendeur = array();
            foreach ($listProduits as $key => $row) {
                $vendeur[$key] = $row['vendeur'];
            }
            if($_GET['vendeur']=="checked"){
                array_multisort($vendeur, SORT_DESC, $inventory);
            }else{
                array_multisort($vendeur, SORT_ASC, $inventory);
            }

        }
        if(isset($_GET['vendeur'])) {
            if(isset($_GET['categorie'])) {
                $categorie = array();
                foreach ($listProduits as $key => $row) {
                    $categorie[$key] = $row['categorie'];
                }
            }
            if($_GET['categorie']=="checked"){
                array_multisort($categorie, SORT_DESC, $inventory);
            }else{
                array_multisort($categorie, SORT_ASC, $inventory);
            }
        }*/


        return $this->render('produit/index.html.twig', [
            'produits' => $listProduits,
        ]);
    }

    

    #[Route('/{id}', name: 'app_produit_show', methods: ['GET'])]
    public function detailprod(Produit $produit ): Response
    {
        return $this->render('produit/show.html.twig', [
            'produit' => $produit,
        ]);
    }

}
