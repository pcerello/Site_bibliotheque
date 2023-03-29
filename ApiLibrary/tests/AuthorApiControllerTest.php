<?php

namespace App\Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class AuthorApiControllerTest extends WebTestCase
{
    /**
     * Test the route /api/authors
     */
    public function testfindAuthor(): void
    {
        // Create a client to make requests
        $client = static::createClient();
        // Make a GET request to /api/authors
        $client->request('GET', '/api/authors');

        // Get the response
        $authors = json_decode($client->getResponse()->getContent(), true);

        // Check that the response is successful 200
        $this->assertResponseIsSuccessful("List of authors is available");

        // Check if we have 206 authors
        $this->assertEquals(223, count($authors), "The number of authors is 206");

        $name = [];

        // Check that each book has an id, a title, a language, a number of pages and a year
        foreach ($authors as $a) {
            $this->assertArrayHasKey('id', $a, "The author has an id");
            $this->assertArrayHasKey('name', $a, "The author has a name");
            $name[] = $a['name'];
        }

        // Check that the authors have the correct name
        $this->assertContains('Ma Zuo', $name, "The author has the name 'Ma Zuo'");
        $this->assertContains('Adam SILVERA', $name, "The author has the name 'Adam SILVERA'");
        $this->assertContains('', $name, "The author has the name ''");

        // Test List Books with filter name and max

        // Test the route /api/authors?name=b&max=1
        $client->request('GET', '/api/authors?name=b&max=1');

        // Get the response
        $authors = json_decode($client->getResponse()->getContent(), true);

        // Check that the response is successful 200
        $this->assertResponseIsSuccessful("List of authors is available");

        // Check if we have 1 author
        $this->assertEquals(1, count($authors), "The number of authors is 1");

        $name = [];
        foreach ($authors as $a) {
            $name[] = $a['name'];
        }

        // Check that the author has the correct name
        $this->assertContains('Beatrix Potter', $name, "The author has the name 'Beatrix Potter'");
    }
}