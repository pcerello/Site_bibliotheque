<?php

namespace App\Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class CountDataBaseTest extends WebTestCase
{
    /**
     * Test the number of books
     */
    public function testCountBook(): void
    {
        // Create a client to make requests
        $client = static::createClient();
        // Take the entity manager
        $entityManager = $client->getContainer()->get('doctrine')->getManager();

        // Make a request to get all the books
        $req = $entityManager->createQueryBuilder()
            ->select('book.id')
            ->from('\App\Entity\Book', 'book');

        // Get the response
        $books = $req->getQuery()->getResult();

        // Check if we have more than 200 books
        $nbr_book = count($books);
        $this->assertGreaterThan(200, $nbr_book);
        $this->assertEquals(206, $nbr_book);
    }

    /**
     * Test the number of authors
     */
    public function testCountAuthor(): void
    {
        // Create a client to make requests
        $client = static::createClient();
        // Take the entity manager
        $entityManager = $client->getContainer()->get('doctrine')->getManager();

        // Make a request to get all the authors
        $req = $entityManager->createQueryBuilder()
            ->select('author.id')
            ->from('\App\Entity\Author', 'author');

        // Get the response
        $author = $req->getQuery()->getResult();

        // Check if we have more than 50 authors
        $nbr_author = count($author);
        $this->assertGreaterThan(50, $nbr_author);
        $this->assertEquals(223, $nbr_author);
    }


    /**
     * Test the number of editors
     */
    public function testCountEditor(): void
    {
        // Create a client to make requests
        $client = static::createClient();
        // Take the entity manager
        $entityManager = $client->getContainer()->get('doctrine')->getManager();

        // Make a request to get all the editors
        $req = $entityManager->createQueryBuilder()
            ->select('editor.id')
            ->from('\App\Entity\Editor', 'editor');

        // Get the response
        $editor = $req->getQuery()->getResult();
        $nbr_editor = count($editor);

        // Check if we have the correct number of editors (93)
        $this->assertEquals(93, $nbr_editor);
    }

    /**
     * Test the number of categories
     */
    public function testCountCategory(): void
    {
        // Create a client to make requests
        $client = static::createClient();
        // Take the entity manager
        $entityManager = $client->getContainer()->get('doctrine')->getManager();

        // Make a request to get all the categories
        $req = $entityManager->createQueryBuilder()
            ->select('category.id')
            ->from('\App\Entity\Category', 'category');

        // Get the response
        $category = $req->getQuery()->getResult();
        $nbr_category = count($category);

        // Check if we have the correct number of categories (49)
        $this->assertEquals(49, $nbr_category);
    }

    /**
     * Test the number of follows
     */
    public function testCountFollow(): void
    {
        // Create a client to make requests
        $client = static::createClient();
        // Take the entity manager
        $entityManager = $client->getContainer()->get('doctrine')->getManager();

        // Make a request to get all the follows
        $req = $entityManager->createQueryBuilder()
            ->select('follow.id')
            ->from('\App\Entity\Follow', 'follow');

        // Get the response
        $follow = $req->getQuery()->getResult();
        $nbr_follow = count($follow);

        // Check if we have the correct number of follows (51)
        $this->assertEquals(51, $nbr_follow);
    }

    /**
     * Test the number of borrows
     */
    public function testCountBorrow(): void
    {
        // Create a client to make requests
        $client = static::createClient();
        // Take the entity manager
        $entityManager = $client->getContainer()->get('doctrine')->getManager();

        // Make a request to get all the borrows
        $req = $entityManager->createQueryBuilder()
            ->select('borrow.id')
            ->from('\App\Entity\Borrow', 'borrow');

        // Get the response
        $borrow = $req->getQuery()->getResult();
        $nbr_borrow = count($borrow);

        // Check if we have the correct number of borrows (128)
        $this->assertEquals(128, $nbr_borrow);
    }

    /**
     * Test the number of readers
     */
    public function testCountReader(): void
    {
        // Create a client to make requests
        $client = static::createClient();
        // Take the entity manager
        $entityManager = $client->getContainer()->get('doctrine')->getManager();

        // Make a request to get all the readers
        $req = $entityManager->createQueryBuilder()
            ->select('reader.id')
            ->from('\App\Entity\Reader', 'reader');

        // Get the response
        $reader = $req->getQuery()->getResult();
        $nbr_reader = count($reader);

        // Check if we have the correct number of readers (51)
        $this->assertEquals(51, $nbr_reader);
    }

    /**
     * Test the number of writes
     */
    public function testCountWrite_(): void
    {
        // Create a client to make requests
        $client = static::createClient();
        // Take the entity manager
        $entityManager = $client->getContainer()->get('doctrine')->getManager();

        // Make a request to get all the writes
        $req = $entityManager->createQueryBuilder()
            ->select('write.id')
            ->from('\App\Entity\Write', 'write');

        // Get the response
        $write = $req->getQuery()->getResult();
        $nbr_write = count($write);

        // Check if we have the correct number of writes (220)
        $this->assertEquals(220, $nbr_write);
    }
}