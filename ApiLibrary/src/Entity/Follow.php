<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Follow
 *
 * @ORM\Table(name="Follow", uniqueConstraints={@ORM\UniqueConstraint(name="UQ_Follow_id_follow_id_is_followed", columns={"id_follow", "id_is_followed"})}, indexes={@ORM\Index(name="id_follow", columns={"id_follow"}), @ORM\Index(name="id_is_followed", columns={"id_is_followed"})})
 * @ORM\Entity
 */
class Follow
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
     * @var Reader
     *
     * @ORM\ManyToOne(targetEntity="Reader")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_follow", referencedColumnName="id")
     * })
     */
    private $idFollow;

    /**
     * @var Reader
     *
     * @ORM\ManyToOne(targetEntity="Reader")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_is_followed", referencedColumnName="id")
     * })
     */
    private $idIsFollowed;

    /**
     * Set the reader who follows
     *
     * @param Reader $idFollow
     *
     * @return self
     */
    public function setFollow(Reader $idFollow): self
    {
        $this->idFollow = $idFollow;

        return $this;
    }

    /**
     * Set the reader who is followed
     *
     * @param Reader $idIsFollowed
     *
     * @return self
     */
    public function setFollowed(Reader $idIsFollowed): self
    {
        $this->idIsFollowed = $idIsFollowed;

        return $this;
    }

    /**
     * Get the reader who follows
     *
     * @return int
     */
    public function getIdFollow(): int
    {
        return $this->idFollow->getId();
    }
}
