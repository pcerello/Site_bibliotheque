<?php

namespace App\Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class BookApiControllerTest extends WebTestCase
{
    /**
     * Test the route /api/books
     */
    public function testListBook(): void
    {
        // Create a client to make requests
        $client = static::createClient();
        // Make a GET request to /api/books
        $client->request('GET', '/api/books');

        // Get the response
        $books = json_decode($client->getResponse()->getContent(), true);

        // Check that the response is successful 200
        $this->assertResponseIsSuccessful("List of books is available");

        // Check if we have 206 books
        $this->assertEquals(206, count($books), "The number of books is 206");

        $titles = [];
        $languages = [];
        $nbr_pages = [];
        $years = [];

        // Check that each book has an id, a title, a language, a number of pages and a year
        foreach ($books as $b) {
            $this->assertArrayHasKey('id', $b[0], "The book has an id");
            $this->assertArrayHasKey('title', $b[0], "The book has a title");
            $this->assertArrayHasKey('language', $b[0], "The book has a language");
            $this->assertArrayHasKey('nbrPages', $b[0], "The book has a number of pages");
            $this->assertArrayHasKey('year', $b[0], "The book has a year");

            $titles[] = $b[0]['title'];
            $languages[] = $b[0]['language'];
            $nbr_pages[] = $b[0]['nbrPages'];
            $years[] = $b[0]['year'];
            ;
        }

        // Check that the books have the correct title, language, number of pages and year
        $this->assertContains('De l\'art de dire des conneries', $titles, "The book has the title 'De l'art de dire des conneries'");
        $this->assertContains('fr', $languages, "The book has the language 'fr'");
        $this->assertContains(80, $nbr_pages, "The book has 80 pages");
        $this->assertContains(2017, $years, "The book has the year 2017");

        $this->assertContains('IKIGAI', $titles, "The book has the title 'IKIGAI'");
        $this->assertContains('fr', $languages, "The book has the language 'fr'");
        $this->assertContains(120, $nbr_pages, "The book has 120 pages");
        $this->assertContains(2017, $years, "The book has the year 2017");


        $this->assertContains('Je n\'ai pas fait mes devoirs parce que...', $titles, "The book has the title 'Je n'ai pas fait mes devoirs parce que...'");
        $this->assertContains('fr', $languages, "The book has the language 'fr'");
        $this->assertContains(32, $nbr_pages, "The book has 32 pages");
        $this->assertContains(2014, $years, "The book has the year 2014");


        // Test List Books with filter author and max

        // Test the route /api/books?author=b&max=1
        $client->request('GET', '/api/books?author=b&max=1');

        // Get the response
        $books = json_decode($client->getResponse()->getContent(), true);

        // Check that the response is successful 200
        $this->assertResponseIsSuccessful("List of books is available");

        // Check if we have 1 book
        $this->assertEquals(1, count($books), "The number of books is 1");

        // Test List Books with filter title

        // Test the route /api/books?title=art
        $client->request('GET', '/api/books?title=art');

        // Get the response
        $books = json_decode($client->getResponse()->getContent(), true);

        // Check that the response is successful 200
        $this->assertResponseIsSuccessful("List of books is available");

        // Check if we have 9 books
        $this->assertEquals(9, count($books), "The number of books is 9");
    }

    /**
     * Test for route api/books/{id}
     */
    public function testBookShow(): void
    {
        // Create a client to make requests
        $client = static::createClient();

        // Make a GET request to /api/books/3
        $client->request('GET', '/api/books/3');

        // Get the response
        $book = json_decode($client->getResponse()->getContent(), true);

        // Check that the response is successful 200
        $this->assertResponseIsSuccessful("The book is available");

        $this->assertResponseIsSuccessful("The book is available");
        $this->assertArrayHasKey('id', $book['book'], "The book has an id");
        $this->assertArrayHasKey('title', $book['book'], "The book has a title");
        $this->assertArrayHasKey('language', $book['book'], "The book has a language");
        $this->assertArrayHasKey('nbrPages', $book['book'], "The book has a number of pages");
        $this->assertArrayHasKey('year', $book['book'], "The book has a year");


        $this->assertEquals(3, $book['book']['id'], "The book has the id 3");
        $this->assertEquals('De l\'art de dire des conneries', $book['book']['title'], "The book has the title 'De l'art de dire des conneries'");
        $this->assertEquals('fr', $book['book']['language'], "The book has the language 'fr'");
        $this->assertEquals(80, $book['book']['nbrPages'], "The book has 80 pages");
        $this->assertEquals(2017, $book['book']['year'], "The book has the year 2017");
        $this->assertEquals('Social Science', $book['book']['category'], "The book has the category 'Social Science'");
        $this->assertEquals('Fayard/Mazarine', $book['book']['editor'], "The book has the editor 'Fayard/Mazarine'");
    }

    /**
     * Test for route api/books/{id}/authors
     */
    public function testBookAuthors(): void
    {
        // Create a client to make requests
        $client = static::createClient();

        // Make a GET request to /api/books/2/authors
        $client->request('GET', '/api/books/2/authors');

        // Get the response
        $authors = json_decode($client->getResponse()->getContent(), true);

        // Check that the response is successful 200
        $this->assertResponseIsSuccessful("The authors of the book are available");

        // Check if we have 3 authors
        $this->assertEquals(3, count($authors), "The number of authors is 3");

        $names = [];
        // Check that each author has an id, a firstname and a lastname
        foreach ($authors as $a) {
            $this->assertArrayHasKey('id', $a, "The author has an id");
            $this->assertArrayHasKey('name', $a, "The author has a name");

            $names[] = $a['name'];
        }

        // Check that the authors have the correct name
        $this->assertContains('Alfred Aho', $names, "The author has the name 'Alfred Aho'");
        $this->assertContains('Jeffrey David Ullman', $names, "The author has the name 'Jeffrey David Ullman'");
        $this->assertContains('Ravi Sethi', $names, "The author has the name 'Ravi Sethi'");
    }
}