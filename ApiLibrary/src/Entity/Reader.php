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
     * @ORM\Column(name="email", type="string", length=255, nullable=false, unique=true)
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

    /**
     * @var string|null
     *
     * @ORM\Column(name="token", type="string", length=255, nullable=true)
     */
    private $token;

    /**
     * Get the value of id
     *
     * @return  int
     */
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * Get the firstName
     *
     * @return  string
     */
    public function getFirstName(): ?string
    {
        return $this->firstName;
    }

    /**
     * Get the lastName
     *
     * @return  string
     */
    public function getLastName(): ?string
    {
        return $this->lastName;
    }

    /**
     * Get the value of email
     *
     * @return  string
     */
    public function getEmail(): ?string
    {
        return $this->email;
    }

    /**
     * Get the value of picture
     *
     * @return  string|null
     */
    public function getPicture(): ?string
    {
        return $this->picture;
    }

    /**
     * Get the value of password
     *
     * @return  string
     */
    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function getToken(): ?string
    {
        return $this->token;
    }

    public function setToken(?string $token): self
    {
        $this->token = $token;

        return $this;
    }

    /**
     * The public representation of the user (e.g. a username, an email address, etc.)
     *
     * @see UserInterface
     */
    public function getUserIdentifier(): string
    {
        return (string) $this->email;
    }
}
