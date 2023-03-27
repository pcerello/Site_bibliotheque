<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use OpenApi\Attributes as OA;

/**
 * Reader
 *
 * @ORM\Table(name="Reader", uniqueConstraints={@ORM\UniqueConstraint(name="UQ_Reader_email", columns={"email"})})
 * @ORM\Entity
 */
#[ORM\Entity(repositoryClass: ReaderRepository::class)]
class Reader
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    #[ORM\Column]
    #[Groups("reader_infos")]
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="first_name", type="string", length=100, nullable=false)
     */
    #[ORM\Column]
    #[Groups("reader_infos")]
    #[OA\Property(example: "Toto", description: "First name of the reader")]
    private $firstName;

    /**
     * @var string
     *
     * @ORM\Column(name="last_name", type="string", length=100, nullable=false)
     */
    #[ORM\Column]
    #[OA\Property(example: "Tata", description: "Last name of the reader")]
    #[Groups("reader_infos")]
    private $lastName;

    /**
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=255, nullable=false)
     */
    #[ORM\Column]
    #[Groups("reader_infos")]
    #[OA\Property(example: "toto@mail.com", description: "Email of the reader")]
    private $email;

    /**
     * @var string|null
     *
     * @ORM\Column(name="picture", type="string", length=255, nullable=true)
     */
    #[ORM\Column]
    #[Groups("reader_infos")]
    #[OA\Property(example: "https://www.google.com/images.png", description: "Picture of the reader")]
    private $picture;

    /**
     * @var string
     *
     * @ORM\Column(name="password", type="string", length=255, nullable=false)
     */
    private $password;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFirstName(): ?string
    {
        return $this->firstName;
    }

    public function setFirstName(string $firstName): self
    {
        $this->firstName = $firstName;

        return $this;
    }

    public function getLastName(): ?string
    {
        return $this->lastName;
    }

    public function setLastName(string $lastName): self
    {
        $this->lastName = $lastName;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getPicture(): ?string
    {
        return $this->picture;
    }

    public function setPicture(?string $picture): self
    {
        $this->picture = $picture;

        return $this;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }
}
