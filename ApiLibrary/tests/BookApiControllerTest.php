<?php

namespace App\Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class BookApiControllerTest extends WebTestCase
{
    public function testListBook(): void
    {
        // Test List Books
        $client = static::createClient();
        $client->request('GET', '/api/books');

        $books = json_decode($client->getResponse()->getContent(), true);

        $this->assertResponseIsSuccessful("List of books is available");
        
        $this->assertEquals(3, count($books), "The number of books is 3");

        $titles = [];
        $languages = [];
        $nbr_pages = [];
        $years = [];
        foreach ($books as $b) {
            $this->assertArrayHasKey('id', $b, "The book has an id");
            $this->assertArrayHasKey('title', $b, "The book has a title");
            $this->assertArrayHasKey('language', $b, "The book has a language");
            $this->assertArrayHasKey('nbrPages', $b, "The book has a number of pages");
            $this->assertArrayHasKey('year', $b, "The book has a year");

            $titles[] = $b['title'];
            $languages[] = $b['language'];
            $nbr_pages[] = $b['nbrPages'];
            $years[] = $b['year'];
            $categories[] = $b['category'];
            $editors[] = $b['editor'];
        }

        $this->assertContains('Edgar Poe, sa vie et ses oeuvres', $titles, "The book has the title 'Edgar Poe, sa vie et ses oeuvres'");
        $this->assertContains('fr', $languages, "The book has the language 'fr'");
        $this->assertContains(36, $nbr_pages, "The book has 36 pages");
        $this->assertContains(2022, $years, "The book has the year 2022");

        $this->assertContains('GIGN : confessions d\'un OPS', $titles, "The book has the title 'GIGN : confessions d'un OPS'");
        $this->assertContains('fr', $languages, "The book has the language 'fr'");
        $this->assertContains(42, $nbr_pages, "The book has 42 pages");
        $this->assertContains(2010, $years, "The book has the year 2010");
        

        $this->assertContains('Les fleurs du mal', $titles, "The book has the title 'Les fleurs du mal'");
        $this->assertContains('fr', $languages, "The book has the language 'fr'");
        $this->assertContains(200, $nbr_pages, "The book has 200 pages");
        $this->assertContains(2004, $years, "The book has the year 2004");
       

        // Test List Books with filter author and max

        $client->request('GET', '/api/books?author=Baudelaire&max=1');

        $books = json_decode($client->getResponse()->getContent(), true);

        $this->assertResponseIsSuccessful("List of books is available");

        $this->assertEquals(1, count($books), "The number of books is 1");

        // Test List Books with filter title

        $client->request('GET', '/api/books?title=Edgar Poe');

        $books = json_decode($client->getResponse()->getContent(), true);

        $this->assertResponseIsSuccessful("List of books is available");

        $this->assertEquals(1, count($books), "The number of books is 1");

        // Test Show Book

        $client->request('GET', '/api/books/1');

        $book = json_decode($client->getResponse()->getContent(), true);

        $this->assertResponseIsSuccessful("The book is available");

        $this->assertResponseIsSuccessful("The book is available");
        $this->assertArrayHasKey('id', $book, "The book has an id");
        $this->assertArrayHasKey('title', $book, "The book has a title");
        $this->assertArrayHasKey('language', $book, "The book has a language");
        $this->assertArrayHasKey('nbrPages', $book, "The book has a number of pages");
        $this->assertArrayHasKey('year', $book, "The book has a year");
 

        $this->assertEquals(1, $book['id'], "The book has the id 1");
        $this->assertEquals('Edgar Poe, sa vie et ses oeuvres', $book['title'], "The book has the title 'Edgar Poe, sa vie et ses oeuvres'");
        $this->assertEquals('fr', $book['language'], "The book has the language 'fr'");
        $this->assertEquals(36, $book['nbrPages'], "The book has 36 pages");
        $this->assertEquals(2022, $book['year'], "The book has the year 2022");
        $this->assertEquals('Biography & Autobiography', $book['category'], "The book has the category 'Biography & Autobiography'");
        $this->assertEquals('BoD - Books on Demand', $book['editor'], "The book has the editor 'BoD - Books on Demand'");
    }
}
