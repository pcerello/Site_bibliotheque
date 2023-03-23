<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use OpenApi\Attributes as OA;

/**
 * Book
 *
 * @ORM\Table(name="Book", uniqueConstraints={@ORM\UniqueConstraint(name="UQ_maTable_titlepictureyear", columns={"title", "picture", "year"})}, indexes={@ORM\Index(name="category", columns={"category"}), @ORM\Index(name="editor", columns={"editor"})})
 * @ORM\Entity
 */
#[ORM\Entity(repositoryClass: BookRepository::class)]
class Book
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    #[ORM\Column]
    #[Groups("book_infos")]
    #[OA\Property(example: 1, description: "Id of the book")]
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=100, nullable=false)
     */
    #[ORM\Column]
    #[Groups("book_infos")]
    #[OA\Property(example: "Harry Potter", description: "Title of the book")]
    private $title;

    /**
     * @var string|null
     *
     * @ORM\Column(name="picture", type="string", length=255, nullable=true)
     */
    private $picture;

    /**
     * @var string
     *
     * @ORM\Column(name="language", type="string", length=255, nullable=false)
     */
    private $language;

    /**
     * @var int
     *
     * @ORM\Column(name="nbr_pages", type="integer", nullable=false)
     */
    private $nbrPages;

    /**
     * @var string
     *
     * @ORM\Column(name="resume", type="text", length=65535, nullable=false)
     */
    private $resume;

    /**
     * @var int
     *
     * @ORM\Column(name="year", type="integer", nullable=false)
     */
    private $year;

    /**
     * @var \Editor
     *
     * @ORM\ManyToOne(targetEntity="Editor")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="editor", referencedColumnName="id")
     * })
     */
    private $editor;

    /**
     * @var \Category
     *
     * @ORM\ManyToOne(targetEntity="Category")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="category", referencedColumnName="id")
     * })
     */
    private $category;
}
