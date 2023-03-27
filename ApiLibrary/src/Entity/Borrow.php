<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;


/**
 * Borrow
 *
 * @ORM\Table(name="Borrow", indexes={@ORM\Index(name="id_book", columns={"id_book"}), @ORM\Index(name="id_reader", columns={"id_reader"})})
 * @ORM\Entity
 */
class Borrow
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_borrow", type="date", nullable=false)
     */
    private $dateBorrow;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="date_return", type="date", nullable=true)
     */
    private $dateReturn;

    /**
     * @var \Reader
     *
     * @ORM\ManyToOne(targetEntity="Reader")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_reader", referencedColumnName="id")
     * })
     */
    private $idReader;

    /**
     * @var \Book
     *
     * @ORM\ManyToOne(targetEntity="Book")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_book", referencedColumnName="id")
     * })
     */
    private $idBook;

    public function setReader(Reader $reader): self
    {
        $this->idReader = $reader;

        return $this;
    }

    public function setBook(Book $book): self
    {
        $this->idBook = $book;

        return $this;
    }

    public function setDateBorrow(\DateTime $dateBorrow): self
    {
        $this->dateBorrow = $dateBorrow;

        return $this;
    }

    public function setDateReturn(\DateTime $dateReturn): self
    {
        $this->dateReturn = $dateReturn;

        return $this;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDateBorrow(): ?\DateTimeInterface
    {
        return $this->dateBorrow;
    }

    public function getDateReturn(): ?\DateTimeInterface
    {
        return $this->dateReturn;
    }
}
