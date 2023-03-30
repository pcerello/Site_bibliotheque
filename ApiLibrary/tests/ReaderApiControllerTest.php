<?php

namespace App\Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

/**
 * Test of the ReaderApiController
 */
class ReaderApiControllerTest extends WebTestCase
{
    /**
     * Test the list of readers
     */
    public function testListReaders(): void
    {
        // Create a client to make requests
        $client = static::createClient();
        // Make a GET request to /api/readers
        $client->request('GET', '/api/readers');

        // Get the response
        $readers = json_decode($client->getResponse()->getContent(), true);

        // Check that the response is successful
        $this->assertResponseIsSuccessful("List of readers is available");

        // Check if we have 101 readers
        $this->assertEquals(101, count($readers), "The number of readers is 101");

        $firstnames = [];
        $lastnames = [];
        $emails = [];
        $picture = [];

        foreach ($readers as $r) {
            // Check that each reader has an id, a firstname, a lastname and an email
            $this->assertArrayHasKey('id', $r, "The reader has an id");
            $this->assertArrayHasKey('firstName', $r, "The reader has a firstname");
            $this->assertArrayHasKey('lastName', $r, "The reader has a lastname");
            $this->assertArrayHasKey('email', $r, "The reader has an email");

            $firstnames[] = $r['firstName'];
            $lastnames[] = $r['lastName'];
            $emails[] = $r['email'];
            $picture[] = $r['picture'];
        }

        // Check that the readers have the correct firstname, lastname and email
        $this->assertContains('admin', $firstnames, "The reader has the firstname 'admin'");
        $this->assertContains('admin', $lastnames, "The reader has the lastname 'admin'");
        $this->assertContains('admin@admin', $emails, "The reader has the email 'admin@admin'");

        $this->assertContains('Alfred', $firstnames, "The reader has the firstname 'Alfred'");
        $this->assertContains('Wagner', $lastnames, "The reader has the lastname 'Wagner'");
        $this->assertContains('Alfred@Wagner', $emails, "The reader has the email 'Alfred@Wagner'");

        $this->assertContains('Maryse', $firstnames, "The reader has the firstname 'Maryse'");
        $this->assertContains('Bonneau', $lastnames, "The reader has the lastname 'Bonneau'");
        $this->assertContains('Maryse@Bonneau', $emails, "The reader has the email 'Maryse@Bonneau'");

        $this->assertContains(null, $picture, "The reader has the image 'null'");
    }

    /**
     * Test the route /api/readers/{id}
     */
    public function testReaderShow(): void
    {
        // Create a client to make requests
        $client = static::createClient();
        // Make a GET request to /api/readers/1
        $client->request('GET', '/api/readers/1');

        // Get the response
        $reader = json_decode($client->getResponse()->getContent(), true);

        // Check that the response is successful 200
        $this->assertResponseIsSuccessful("The reader is available");

        // Check that the reader has an id, a firstname, a lastname and an email
        $this->assertArrayHasKey('id', $reader, "The reader has an id");
        $this->assertArrayHasKey('firstName', $reader, "The reader has a firstname");
        $this->assertArrayHasKey('lastName', $reader, "The reader has a lastname");
        $this->assertArrayHasKey('email', $reader, "The reader has an email");
        $this->assertArrayHasKey('picture', $reader, "The reader has a picture");

        // Check that the reader has the correct id, firstname, lastname and email
        $this->assertEquals(1, $reader['id'], "The reader has the id '1'");
        $this->assertEquals('Capucine', $reader['firstName'], "The reader has the firstname 'Capucine'");
        $this->assertEquals('Gautier-Hebert', $reader['lastName'], "The reader has the lastname 'Gautier-Hebert'");
        $this->assertEquals('Capucine@Gautier-Hebert', $reader['email'], "The reader has the email 'Capucine@Gautier-Hebert'");
    }

    /**
     * Test the route /api/readers/{id}/books
     */
    public function testBooksReadByReader(): void
    {
        // Create a client to make requests
        $client = static::createClient();
        // Make a GET request to /api/readers/3/books
        $client->request('GET', '/api/readers/3/books');

        // Get the response
        $books = json_decode($client->getResponse()->getContent(), true);

        // Check that the response is successful 200
        $this->assertResponseIsSuccessful("The books are available");

        // Check if we have 5 books
        $this->assertEquals(5, count($books), "The number of books is 5");

        $idBooks = [];

        // Check that each book has an id, a title, an author, a dateBorrow and a dateReturn
        foreach ($books as $b) {
            $this->assertArrayHasKey('dateBorrow', $b, "The book has an id");
            $idBooks[] = $b['0']['id'];
        }

        // Check that the books have the correct id
        $this->assertContains(57, $idBooks, "The reader read the book '57'");
        $this->assertContains(1, $idBooks, "The reader read the book '1'");
        $this->assertContains(60, $idBooks, "The reader read the book '60'");
        $this->assertContains(105, $idBooks, "The reader read the book '105'");
        $this->assertContains(52, $idBooks, "The reader read the book '52'");

        // Check with a limit of 4 books ( route /api/readers/{id}/books?max=4 )
        $client->request('GET', '/api/readers/3/books?max=4');

        // Get the response
        $books = json_decode($client->getResponse()->getContent(), true);

        // Check that the response is successful 200
        $this->assertResponseIsSuccessful("The books are available");

        // Check if we have 4 books
        $this->assertEquals(4, count($books), "The number of books is 4");
    }

    /**
     * Test the route /api/readers/{id}/books/recommendations
     */
    public function testBooksRecommendationForReader(): void
    {
        // Create a client to make requests
        $client = static::createClient();
        // Make a GET request to /api/readers/2/books/recommendations
        $client->request('GET', '/api/readers/2/books/recommendations');

        // Get the response
        $books = json_decode($client->getResponse()->getContent(), true);

        // Check that the response is successful 200
        $this->assertResponseIsSuccessful("The books are available");

        // Check if we have 5 books
        $this->assertEquals(5, count($books), "The number of books is 5");

        $idBooks = [];

        // Check that each book has an id
        foreach ($books as $b) {
            $idBooks[] = $b['0']['id'];
        }

        // Check that the books have the correct id
        $this->assertContains(68, $idBooks, "The reader read the book '68'");
        $this->assertContains(112, $idBooks, "The reader read the book '112'");
        $this->assertContains(116, $idBooks, "The reader read the book '116'");
        $this->assertContains(121, $idBooks, "The reader read the book '121'");
        $this->assertContains(125, $idBooks, "The reader read the book '125'");
    }

    /**
     * Test the route /api/readers/{id}/follow
     */
    public function testListFollow(): void
    {
        // Create a client to make requests
        $client = static::createClient();
        // Make a GET request to /api/readers/2/follow
        $client->request('GET', '/api/readers/2/follow');

        // Get the response
        $readers = json_decode($client->getResponse()->getContent(), true);

        // Check that the response is successful 200
        $this->assertResponseIsSuccessful("The follow are available");

        //  Check if we have 3 follow
        $this->assertEquals(3, count($readers), "The number of follow is 3");

        $firstnames = [];

        // Check that each follow has an id, a firstname, a lastname, an email and a picture
        foreach ($readers as $r) {
            $this->assertArrayHasKey('id', $r, "The reader has an id");
            $this->assertArrayHasKey('firstName', $r, "The reader has a firstname");
            $this->assertArrayHasKey('lastName', $r, "The reader has a lastname");
            $this->assertArrayHasKey('email', $r, "The reader has an email");
            $this->assertArrayHasKey('picture', $r, "The reader has a picture");

            $firstnames[] = $r['firstName'];
        }

        // Check that the follow have the correct firstname
        $this->assertContains('Auguste', $firstnames, "The reader has the firstname 'Auguste'");
        $this->assertContains('Aimé', $firstnames, "The reader has the firstname 'Aimé'");
        $this->assertContains('Andrée', $firstnames, "The reader has the firstname 'Andrée'");
    }

    /**
     * Test the route /api/readers/{id}/follow/recommendations
     */
    public function testListFollowRecommendation(): void
    {
        // Create a client to make requests
        $client = static::createClient();
        // Make a GET request to /api/readers/2/follow/recommendations
        $client->request('GET', '/api/readers/2/follow/recommendations');

        // Get the response
        $readers = json_decode($client->getResponse()->getContent(), true);

        // Check that the response is successful 200
        $this->assertResponseIsSuccessful("The follow are available");

        //  Check if we have 4 follow
        $this->assertEquals(4, count($readers), "The number of follow is 4");

        $firstnames = [];

        // Check that each follow has an id, a firstname, a lastname, an email
        foreach ($readers as $r) {
            $this->assertArrayHasKey('id', $r, "The reader has an id");
            $this->assertArrayHasKey('firstName', $r, "The reader has a firstname");
            $this->assertArrayHasKey('lastName', $r, "The reader has a lastname");
            $this->assertArrayHasKey('email', $r, "The reader has an email");

            $firstnames[] = $r['firstName'];
        }

        // Check that the follow have the correct firstname
        $this->assertContains('Zoé', $firstnames, "The reader has the firstname 'Zoé'");
        $this->assertContains('Claire-Nathalie', $firstnames, "The reader has the firstname 'Claire-Nathalie'");
        $this->assertContains('Stéphanie', $firstnames, "The reader has the firstname 'Stéphanie'");
        $this->assertContains('Danielle', $firstnames, "The reader has the firstname 'Danielle'");
    }
}