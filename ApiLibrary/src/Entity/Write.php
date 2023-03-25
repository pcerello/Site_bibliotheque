<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Write
 *
 * @ORM\Table(name="Write_", uniqueConstraints={@ORM\UniqueConstraint(name="UQ_Write_id_author_id_book", columns={"id_author", "id_book"})}, indexes={@ORM\Index(name="id_book", columns={"id_book"}), @ORM\Index(name="id_reader", columns={"id_author"})})
 * @ORM\Entity
 */
class Write
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
     * @var \Book
     *
     * @ORM\ManyToOne(targetEntity="Book")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_book", referencedColumnName="id")
     * })
     */
    private $idBook;

    /**
     * @var \Author
     *
     * @ORM\ManyToOne(targetEntity="Author")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_author", referencedColumnName="id")
     * })
     */
    private $idAuthor;
}
