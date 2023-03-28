<?php

namespace App\Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class CountDataBaseTest extends WebTestCase
{
    public function testCountBook(): void
    {
        $client = static::createClient();
        $entityManager = $client->getContainer()->get('doctrine')->getManager();
        $req = $entityManager->createQueryBuilder()
        ->select('book.id')
        ->from('\App\Entity\Book', 'book');

        $books = $req->getQuery()->getResult();
        $nbr_book = count($books);
        $this->assertGreaterThan(200, $nbr_book);
        $this->assertEquals(206, $nbr_book);   
    }

    public function testCountAuthor(): void
    {
        $client = static::createClient();
        $entityManager = $client->getContainer()->get('doctrine')->getManager();
        $req = $entityManager->createQueryBuilder()
        ->select('author.id')
        ->from('\App\Entity\Author', 'author');

        $author = $req->getQuery()->getResult();
        $nbr_author = count($author);
        $this->assertGreaterThan(50, $nbr_author);
        $this->assertEquals(223, $nbr_author);   
    }


    public function testCountEditor(): void
    {
        $client = static::createClient();
        $entityManager = $client->getContainer()->get('doctrine')->getManager();
        $req = $entityManager->createQueryBuilder()
        ->select('editor.id')
        ->from('\App\Entity\Editor', 'editor');

        $editor = $req->getQuery()->getResult();
        $nbr_editor = count($editor);
        
        $this->assertEquals(93, $nbr_editor);   
    }
    
    
    public function testCountCategory(): void
    {
        $client = static::createClient();
        $entityManager = $client->getContainer()->get('doctrine')->getManager();
        $req = $entityManager->createQueryBuilder()
        ->select('category.id')
        ->from('\App\Entity\Category', 'category');

        $category = $req->getQuery()->getResult();
        $nbr_category = count($category);
        
        $this->assertEquals(49, $nbr_category);   
    }

    public function testCountFollow(): void
    {
        $client = static::createClient();
        $entityManager = $client->getContainer()->get('doctrine')->getManager();
        $req = $entityManager->createQueryBuilder()
        ->select('follow.id')
        ->from('\App\Entity\Follow', 'follow');

        $follow = $req->getQuery()->getResult();
        $nbr_follow = count($follow);
        
        $this->assertEquals(52, $nbr_follow);   
    }

    public function testCountBorrow(): void
    {
        $client = static::createClient();
        $entityManager = $client->getContainer()->get('doctrine')->getManager();
        $req = $entityManager->createQueryBuilder()
        ->select('borrow.id')
        ->from('\App\Entity\Borrow', 'borrow');

        $borrow = $req->getQuery()->getResult();
        $nbr_borrow = count($borrow);
       
        $this->assertEquals(128, $nbr_borrow);   
    }

    public function testCountReader(): void
    {
        $client = static::createClient();
        $entityManager = $client->getContainer()->get('doctrine')->getManager();
        $req = $entityManager->createQueryBuilder()
        ->select('reader.id')
        ->from('\App\Entity\Reader', 'reader');

        $reader = $req->getQuery()->getResult();
        $nbr_reader = count($reader);
        
        $this->assertEquals(51, $nbr_reader);   
    }

    public function testCountWrite_(): void
    {
        $client = static::createClient();
        $entityManager = $client->getContainer()->get('doctrine')->getManager();
        $req = $entityManager->createQueryBuilder()
        ->select('write.id')
        ->from('\App\Entity\Write', 'write');

        $write = $req->getQuery()->getResult();
        $nbr_write = count($write);
        
        $this->assertEquals(220, $nbr_write);   
    }
}


