<?php

namespace App\Controller;

use App\Entity\Produit;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;


class UserProduitController extends AbstractController
{
    private $em,$security;
    public function __construct(EntityManagerInterface $em,Security $security)
    {
        $this->em = $em;
        $this->security = $security;
    }

    #[Route('/userr/produit', name: 'app_user_produit')]
    public function index(): Response
    {
        $produit = $this->em->getRepository(Produit::class)->findAll();
        $couleur = $this->em->getRepository(Produit::class)->getCouleur();

        if(isset($_GET['couleur'])){
            if($_GET['qte'] != null && $_GET['qte']!= '' && $_GET['couleur'] != null && $_GET['couleur']!= ''){
                $produit = $this->em->getRepository(Produit::class)->getByQteAndColor($_GET['qte'],$_GET['couleur']);
            }else if($_GET['qte'] == null || $_GET['qte'] == ''){
                $produit = $this->em->getRepository(Produit::class)->getByColor($_GET['couleur']);
            }else if($_GET['couleur'] == null || $_GET['couleur'] == ''){
                $produit = $this->em->getRepository(Produit::class)->getByQte($_GET['qte']);
            }else if($_GET['qte'] == null || $_GET['qte']== '' && $_GET['couleur'] == null || $_GET['couleur']== ''){
                $produit = $this->em->getRepository(Produit::class)->findAll();
            }
        }

        return $this->render('user_produit/index.html.twig', [
            'produits'=>$produit,
            'couleur'=>$couleur,
        ]);
    }
}
