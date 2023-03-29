<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Editor
 *
 * @ORM\Table(name="Editor", uniqueConstraints={@ORM\UniqueConstraint(name="UQ_Editor_name", columns={"name"})})
 * @ORM\Entity
 */
class Editor
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
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=100, nullable=false)
     */
    private $name;

    /**
     * Get the value of id
     *
     * @return int
     */
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * Set the id
     *
     * @param int $id
     *
     * @return self
     */
    public function getName(): ?string
    {
        return $this->name;
    }
}
