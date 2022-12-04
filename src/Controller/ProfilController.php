<?php

namespace App\Controller;

use App\Entity\Categorie;
use App\Entity\Produit;
use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;

class ProfilController extends AbstractController
{
    private $em,$security;
    public function __construct(EntityManagerInterface $em,Security $security)
    {
        $this->em = $em;
        $this->security = $security;
    }

    #[Route('/profil', name: 'profil')]
    public function index(): Response
    {
        $profil = $this->security->getUser();
        $produit = $this->em->getRepository(Produit::class)->findBy(['vendeur'=>$profil->getId()]);
        return $this->render('profil/index.html.twig', [
            'profil'=>$profil,
            'produits'=>$produit,
        ]);
    }

    #[Route('/modifierProfil', name: 'modifierProfil')]
    public function modifierProfil(UserPasswordHasherInterface $userPasswordHasher): Response
    {
        $profil = $this->security->getUser();
        if(isset($_POST['enregistrer'])){
            $user = $this->em->find(User::class,$profil->getId());
            $user->setNom($_POST['nom']);
            $user->setPrenom($_POST['prenom']);
            $user->setEmail($_POST['email']);
            $user->setPassword(
                $userPasswordHasher->hashPassword(
                    $user,
                    $_POST['password']
                )
            );
            $this->em->persist($user);
            $this->em->flush();
        }

        return $this->render('profil/modifierProfil.html.twig', [
            'profil'=>$profil,
        ]);
    }

    #[Route('/ajouterProduit', name: 'ajouterProduit')]
    public function ajouterProduit(): Response
    {
        $profil = $this->security->getUser();
        $categorie = $this->em->getRepository(Categorie::class)->findAll();
        if(isset($_POST['ajouter'])){
            $user = new Produit();
            $user->setPrix($_POST['prix']);
            $user->setCouleur($_POST['couleur']);
            $user->setDescription($_POST['description']);
            $user->setQuantiteStock($_POST['qte']);
            $user->setStatut($_POST['statut']);
            $user->setVendeur($profil);
            $user->setTitre($_POST['titre']);
            $user->setImage('image');
            $user->setCategorie($this->em->find(Categorie::class,$_POST['categorie']));

            $this->em->persist($user);
            $this->em->flush();

        }

        return $this->render('produit/ajouterProduit.html.twig', [
            'categorie'=>$categorie,
        ]);
    }

    #[Route('/modifierProduit/{id}', name: 'modifierProduit')]
    public function modifierProduit($id): Response
    {
        $profil = $this->security->getUser();
        $categorie = $this->em->getRepository(Categorie::class)->findAll();
        $produit = $this->em->find(Produit::class,$id);

        if(isset($_POST['modifier'])){

            $produit->setPrix($_POST['prix']);
            $produit->setCouleur($_POST['couleur']);
            $produit->setDescription($_POST['description']);
            $produit->setQuantiteStock($_POST['qte']);

            $_POST['statut'] == 'true' ? $produit->setStatut(true):$produit->setStatut(false);
            $produit->setTitre($_POST['titre']);
            $produit->setImage('image');
            $produit->setCategorie($this->em->find(Categorie::class,$_POST['categorie']));

            $this->em->persist($produit);
            $this->em->flush();

        }

        return $this->render('produit/modifierProduit.html.twig', [
            'data'=>$produit,
            'categorie'=>$categorie,
        ]);
    }
}
