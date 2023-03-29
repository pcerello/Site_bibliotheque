<?php

namespace App\Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class BookApiControllerTest extends WebTestCase
{
   /* public function testListBook(): void
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
            $this->assertArrayHasKey('id', $b[0], "The book has an id");
            $this->assertArrayHasKey('title', $b[0], "The book has a title");
            $this->assertArrayHasKey('language', $b[0], "The book has a language");
            $this->assertArrayHasKey('nbrPages', $b[0], "The book has a number of pages");
            $this->assertArrayHasKey('year', $b[0], "The book has a year");

            $titles[] = $b[0]['title'];
            $languages[] = $b[0]['language'];
            $nbr_pages[] = $b[0]['nbrPages'];
            $years[] = $b[0]['year'];;
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
        $this->assertArrayHasKey('id', $book[0], "The book has an id");
        $this->assertArrayHasKey('title', $book[0], "The book has a title");
        $this->assertArrayHasKey('language', $book[0], "The book has a language");
        $this->assertArrayHasKey('nbrPages', $book[0], "The book has a number of pages");
        $this->assertArrayHasKey('year', $book[0], "The book has a year");
 

        $this->assertEquals(1, $book[0]['id'], "The book has the id 1");
        $this->assertEquals('Edgar Poe, sa vie et ses oeuvres', $book[0]['title'], "The book has the title 'Edgar Poe, sa vie et ses oeuvres'");
        $this->assertEquals('fr', $book[0]['language'], "The book has the language 'fr'");
        $this->assertEquals(36, $book[0]['nbrPages'], "The book has 36 pages");
        $this->assertEquals(2022, $book[0]['year'], "The book has the year 2022");
        $this->assertEquals('Biography & Autobiography', $book[0]['category'], "The book has the category 'Biography & Autobiography'");
        $this->assertEquals('BoD - Books on Demand', $book[0]['editor'], "The book has the editor 'BoD - Books on Demand'");
    }*/
}
