<?php

namespace App\DataFixtures;

use App\Entity\Category;
use App\Entity\Editor;
use App\Entity\Book;
use App\Entity\Author;
use App\Entity\Borrow;
use App\Entity\Reader;
use App\Entity\Follow;
use App\Entity\Write;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class BookFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        /*
        $messages = [
            [-0.573892, 44.8451032, 'Super la #foire place des quinconces!'],
            [-0.6116024, 44.7913014, 'Un bonjour du département #iutinformatique'],
            [-0.712858, 44.830072, "Je viens d'arriver à #aeoroportDeBordeaux, j'arrive en ville!"],
            [-0.5684104, 44.8942553, "Bientôt le #BordeauxGeekFest, venez nombreux!"],
            [-0.6020268, 44.8293753, "Prenez soin de vous et des autres, donnez votre sang"]
        ];

        foreach ($messages as list($lng, $lat, $text)) {
            $message = new Message;
            $message
                ->setText($text)
                ->setLongitude($lng)
                ->setLatitude($lat);
            $manager->persist($message);
        }

        $manager->flush();
        */

        /**
         * INSERT INTO `test_Author` (`id`, `name`) VALUES
*(1, 'Charles Baudelaire'),
*(2, 'Jean-Luc Riva'),
*(3, 'Philippe B.');
*
*INSERT INTO `test_Book` (`id`, `title`, `picture`, `language`, `nbr_pages`, `resume`, `year`, `category`, `editor`) VALUES
*(1, 'Edgar Poe, sa vie et ses oeuvres', 'http://books.google.com/books/content?id=8XGXEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'fr', 36, 'C\'est vers 1848 que Charles Baudelaire découvrit l\'oeuvre de Poe', 2022, 1, 1),
*(2, 'GIGN : confessions d\'un OPS', NULL, 'fr', 42, 'Philippe B. n\'aurait jamais dû se trouver à la place qui fut si souvent la sienne durant ces quinze dernières années', 2010, 1, 1),
*(3, 'Les fleurs du mal', 'http://books.google.com/books/content?id=HriGrgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'fr', 200, '\\\"Plonger au fond du gouffre, Enfer ou Ciel, qu\importe ? Au fond de l\inconnu, pour trouver du nouveau !\\\". Ces vers du \\\"Voyage\\\" éclairent à eux seuls l\entreprise du poète. Esprit vagabond, toujours mobile, Baudelaire explore les dédales de la conscience. Il atteint tantôt à l\extase, tantôt se perd dans les abîmes du péché. A travers ses poèmes, il nous fait partager le drame qui se joue en lui et qui n\est autre que la tragédie humaine. Baudelaire, premier poète moderne, donne à la poésie sa véritable dimension : exprimer, par-delà les mots, ce vertige absolu qui s\empare de l\âme. Tout chez lui, en lui affirme la nécessité de la souffrance, la fatalité du péché. Tout traduit en lui une âme profondément troublée mais charitable. Baudelaire fait des Fleurs du Mal un immense poème de la vie et du monde.', 2004, 2, 2);
*
*INSERT INTO `test_Borrow` (`id`, `date_borrow`, `date_return`, `id_book`, `id_reader`) VALUES
*(1, '2023-03-24', NULL, 1, 1),
*(2, '2023-03-23', '2023-03-31', 3, 1);
*
*INSERT INTO `test_Category` (`id`, `name`) VALUES
*(1, 'Biography & Autobiography'),
*(2, 'French poetry');

*INSERT INTO `test_Editor` (`id`, `name`) VALUES
*(1, 'BoD - Books on Demand'),
*(2, 'Editions Gallimard');

*INSERT INTO `test_Follow` (`id`, `id_follow`, `id_is_followed`) VALUES
*(1, 1, 2),
*(2, 2, 1);

*INSERT INTO `test_Reader` (`id`, `first_name`, `last_name`, `email`, `picture`, `password`) VALUES
*(1, 'maud', 'genetet', 'maud@mail.fr', NULL, '1234'),
*(2, 'pauline', 'cerello', 'pauline@mail.fr', NULL, '1234');

*INSERT INTO `test_Write_` (`id`, `id_author`, `id_book`) VALUES
*(1, 1, 3),
*(2, 1, 1),
*(3, 2, 2),
*(4, 3, 2);


         */

        

        $categories = [
            ['Biography & Autobiography'],
            ['French poetry']
        ];

        foreach ($categories as list($name)) {
            $category = new Category;
            $category
                ->setName($name);
            $manager->persist($category);
        }

        $authors = [
            ['Charles Baudelaire'],
            ['Jean-Luc Riva'],
            ['Philippe B.']
        ];

        foreach ($authors as list($name)) {
            $author = new Author;
            $author
                ->setName($name);
            $manager->persist($author);
        }

        $editors = [
            ['BoD - Books on Demand'],
            ['Editions Gallimard']
        ];

        foreach ($editors as list($name)) {
            $editor = new Editor;
            $editor
                ->setName($name);
            $manager->persist($editor);
        }

        $readers = [
            ['maud', 'genetet', 'maud.genetet@', 'image.png', '1234'],
            ['pauline', 'cerello', 'pauline.cerello@', 'image.png', '1234'],
            ['benjamin', 'loupiac', 'benjamin.loupiac@', null, '1234']
        ];

        foreach ($readers as list($first_name, $last_name, $email, $picture, $password)) {
            $reader = new Reader;
            $reader
                ->setFirstName($first_name)
                ->setLastName($last_name)
                ->setEmail($email)
                ->setPicture($picture)
                ->setPassword($password);
            $manager->persist($reader);
        }

        $manager->flush();

        $books = [
            ['Edgar Poe, sa vie et ses oeuvres', 'http://books.google.com/books/content?id=8XGXEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'fr', 36, 'C\'est vers 1848 que Charles Baudelaire découvrit l\'oeuvre de Poe', 2022, 'Biography & Autobiography', 'BoD - Books on Demand'],
            ['GIGN : confessions d\'un OPS', NULL, 'fr', 42, 'Philippe B. n\'aurait jamais dû se trouver à la place qui fut si souvent la sienne durant ces quinze dernières années', 2010, 'Biography & Autobiography', 'BoD - Books on Demand'],
            ['Les fleurs du mal', 'http://books.google.com/books/content?id=HriGrgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'fr', 200, 'Plonger au fond du gouffre, Enfer ou Ciel, qu\'importe ? Au fond de l\'inconnu, pour trouver du nouveau !', 2004, 'French poetry', 'Editions Gallimard']
        ];

        foreach ($books as list($title, $cover, $language, $pages, $summary, $year, $category, $editor)) {
            $book = new Book;
            $book
                ->setTitle($title)
                ->setPicture($cover)
                ->setLanguage($language)
                ->setNbrPages($pages)
                ->setResume($summary)
                ->setYear($year)
                ->setCategory($manager->getRepository(Category::class)->findOneBy(['name' => $category]))
                ->setEditor($manager->getRepository(Editor::class)->findOneBy(['name' => $editor]));
            $manager->persist($book);
        }
        $manager->flush();

        $borrows = [
            ['2023-03-24', '2023-03-27', 'Edgar Poe, sa vie et ses oeuvres', 'maud'],
            ['2023-03-23', '2023-03-31', 'Les fleurs du mal', 'maud'],
            ['2023-03-17', '2023-03-31', 'Les fleurs du mal', 'pauline'],
            ['2023-03-23', '2023-03-25', 'GIGN : confessions d\'un OPS', 'pauline'],
            ['2023-03-23', '2023-03-31', 'GIGN : confessions d\'un OPS', 'benjamin']
        ];

        foreach ($borrows as list($date_borrow, $date_return, $title, $first_name)) {
            $borrow = new Borrow;
            $borrow
                ->setDateBorrow(new \DateTime($date_borrow))
                ->setDateReturn(new \DateTime($date_return))
                ->setBook($manager->getRepository(Book::class)->findOneBy(['title' => $title]))
                ->setReader($manager->getRepository(Reader::class)->findOneBy(['firstName' => $first_name]));
            $manager->persist($borrow);
        }
        $manager->flush();

        $follows = [
            ['maud', 'pauline'],
            ['pauline', 'maud'],
            ['benjamin', 'maud'],
            ['maud', 'benjamin']
        ];

        foreach ($follows as list($first_name, $first_name_follow)) {
            $follow = new Follow;
            $follow
                ->setFollow($manager->getRepository(Reader::class)->findOneBy(['firstName' => $first_name]))
                ->setFollowed($manager->getRepository(Reader::class)->findOneBy(['firstName' => $first_name_follow]));
            $manager->persist($follow);
        }

        $manager->flush();

        $writes = [
            ['Charles Baudelaire', 'Edgar Poe, sa vie et ses oeuvres'],
            ['Charles Baudelaire', 'Les fleurs du mal'],
            ['Jean-Luc Riva', 'GIGN : confessions d\'un OPS'],
            ['Philippe B.', 'GIGN : confessions d\'un OPS']
        ];

        foreach ($writes as list($name, $title)) {
            $write = new Write;
            $write
                ->setIdAuthor($manager->getRepository(Author::class)->findOneBy(['name' => $name]))
                ->setIdBook($manager->getRepository(Book::class)->findOneBy(['title' => $title]));
            $manager->persist($write);
        }

        $manager->flush();
    }
}

