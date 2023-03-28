<?php

namespace App\Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class ReaderApiControllerTest extends WebTestCase
{
   /* public function testListBook(): void
    {
        $client = static::createClient();
        $client->request('GET', '/api/readers');

        $readers = json_decode($client->getResponse()->getContent(), true);

        $this->assertResponseIsSuccessful("List of readers is available");

        $this->assertEquals(3, count($readers), "The number of readers is 3");

        $firstnames = [];
        $lastnames = [];
        $emails = [];
        $picture = [];

        foreach ($readers as $r) {
            $this->assertArrayHasKey('id', $r, "The reader has an id");
            $this->assertArrayHasKey('firstName', $r, "The reader has a firstname");
            $this->assertArrayHasKey('lastName', $r, "The reader has a lastname");
            $this->assertArrayHasKey('email', $r, "The reader has an email");

            $firstnames[] = $r['firstName'];
            $lastnames[] = $r['lastName'];
            $emails[] = $r['email'];
            $picture[] = $r['picture'];
        }

        $this->assertContains('maud', $firstnames, "The reader has the firstname 'maud'");
        $this->assertContains('genetet', $lastnames, "The reader has the lastname 'genetet'");
        $this->assertContains('maud.genetet@', $emails, "The reader has the email 'maud.genetet@'");
        $this->assertContains('image.png', $picture, "The reader has the image 'image.png'");

        $this->assertContains('pauline', $firstnames, "The reader has the firstname 'pauline'");
        $this->assertContains('cerello', $lastnames, "The reader has the lastname 'cerello'");
        $this->assertContains('pauline.cerello@', $emails, "The reader has the email 'pauline.cerello@'");
        $this->assertContains('image.png', $picture, "The reader has the image 'image.png'");

        $this->assertContains('benjamin', $firstnames, "The reader has the firstname 'benjamin'");
        $this->assertContains('loupiac', $lastnames, "The reader has the lastname 'loupiac'");
        $this->assertContains('benjamin.loupiac@', $emails, "The reader has the email 'benjamin.loupiac@'");
        $this->assertContains(null, $picture, "The reader has the image 'null'");

        // Test show reader

        $client->request('GET', '/api/readers/1');

        $reader = json_decode($client->getResponse()->getContent(), true);

        $this->assertResponseIsSuccessful("The reader is available");

        $this->assertArrayHasKey('id', $reader, "The reader has an id");
        $this->assertArrayHasKey('firstName', $reader, "The reader has a firstname");
        $this->assertArrayHasKey('lastName', $reader, "The reader has a lastname");
        $this->assertArrayHasKey('email', $reader, "The reader has an email");
        $this->assertArrayHasKey('picture', $reader, "The reader has a picture");

        $this->assertEquals(1, $reader['id'], "The reader has the id '1'");
        $this->assertEquals('maud', $reader['firstName'], "The reader has the firstname 'maud'");
        $this->assertEquals('genetet', $reader['lastName'], "The reader has the lastname 'genetet'");
        $this->assertEquals('maud.genetet@', $reader['email'], "The reader has the email 'maud.genetet@'");
        $this->assertEquals('image.png', $reader['picture'], "The reader has the image 'image.png'");
    }*/
}
