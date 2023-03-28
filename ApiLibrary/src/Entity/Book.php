<?php

namespace App\Entity;

use App\Repository\AuthorRepository;
use Doctrine\Common\Collections\Collection;
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
    #[ORM\Column]
    #[Groups("book_infos")]
    #[OA\Property(example: "https://www.google.com/picture", description: "Picture of the book")]
    private $picture;

    /**
     * @var string
     *
     * @ORM\Column(name="language", type="string", length=255, nullable=false)
     */
    #[ORM\Column]
    #[Groups("book_infos")]
    #[OA\Property(example: "fr", description: "Language of the book")]
    private $language;

    /**
     * @var int
     *
     * @ORM\Column(name="nbr_pages", type="integer", nullable=false)
     */
    #[ORM\Column]
    #[Groups("book_infos")]
    #[OA\Property(example: 100, description: "Number of pages of the book")]
    private $nbrPages;

    /**
     * @var string
     *
     * @ORM\Column(name="resume", type="text", length=65535, nullable=false)
     */
    #[ORM\Column]
    #[Groups("book_infos")]
    #[OA\Property(example: "Harry Potter is a series of fantasy novels written by British author J. K. Rowling.", description: "Resume of the book")]
    private $resume;

    /**
     * @var int
     *
     * @ORM\Column(name="year", type="integer", nullable=false)
     */
    #[ORM\Column]
    #[Groups("book_infos")]
    #[OA\Property(example: 2000, description: "Year of the book")]
    private $year;

    /**
     * @var \Editor
     *
     * @ORM\ManyToOne(targetEntity="Editor")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="editor", referencedColumnName="id")
     * })
     */
    #[ORM\ManyToOne(targetEntity: Editor::class)]
    #[ORM\JoinColumn(name: "editor", referencedColumnName: "id")]
    #[Groups("book_infos")]
    #[OA\Property(example: 1, description: "Id of the editor")]
    private $editor;

    /**
     * @var \Category
     *
     * @ORM\ManyToOne(targetEntity="Category")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="category", referencedColumnName="id")
     * })
     */
    #[ORM\ManyToOne(targetEntity: Category::class)]
    #[ORM\JoinColumn(name: "category", referencedColumnName: "id")]
    #[Groups("book_infos")]
    #[OA\Property(example: 1, description: "Id of the category")]
    private $category;

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

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

    public function getLanguage(): ?string
    {
        return $this->language;
    }

    public function setLanguage(string $language): self
    {
        $this->language = $language;

        return $this;
    }

    public function getNbrPages(): ?int
    {
        return $this->nbrPages;
    }

    public function setNbrPages(int $nbrPages): self
    {
        $this->nbrPages = $nbrPages;

        return $this;
    }

    public function getResume(): ?string
    {
        return $this->resume;
    }

    public function setResume(string $resume): self
    {
        $this->resume = $resume;

        return $this;
    }

    public function getYear(): ?int
    {
        return $this->year;
    }

    public function setYear(int $year): self
    {
        $this->year = $year;

        return $this;
    }

    public function getEditor(): ?string
    {
        return $this->editor->getName();
    }

    public function setEditor(?Editor $editor): self
    {
        $this->editor = $editor;

        return $this;
    }

    public function getCategory(): ?string
    {
        return $this->category->getName();
    }

    public function setCategory(?Category $category): self
    {
        $this->category = $category;

        return $this;
    }

    public function __toString()
    {
        return $this->getTitle();
    }
}
