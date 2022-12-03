<?php

namespace App\Form;

use App\Entity\Article;
use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ArticleAdminType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('titre')
            ->add('contenu')
            ->add('datecreation')
            ->add('datemodification')
            //->add('auteur')
            ->add('auteur')
           /* ->add('auteur', EntityType::class, [
                'class' => User::class,
                'label' => 'User',
                'choice_label' => 'email',
                'choice_value' => 'nom'
            ])   */     
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Article::class,
        ]);
    }
}
