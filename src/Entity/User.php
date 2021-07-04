<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity; 
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ORM\Entity(repositoryClass=UserRepository::class)
 * @UniqueEntity("email", message="Ya existe un usuario registrado con ese E-mail")
 */
class User
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=128)
     * 
     * @Assert\Email(
     *     message = "El email '{{ value }}' no tiene un formato válido."
     * )
     * @Assert\NotBlank(message="Debes indicar un email")
     */
    private $email;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank(message="Debes indicar una contraseña")
     */
    private $password;

    /**
     * @ORM\Column(type="string", length=128)
     * @Assert\NotBlank(message="Debes indicar un nombre")
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=128)     
     * @Assert\NotBlank(message="Debes indicar un apellido")
     */
    private $lastname;

    /**
     * @ORM\Column(type="string", length=32)     
     * @Assert\NotBlank(message="Debes indicar un teléfono")
     */
    private $phone;

    /**
     * @ORM\Column(type="string", length=5)
     */
    private $role;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $imgpath;

    /**
     * @ORM\Column(type="text")
     */
    private $description;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $shortDesc;

    /**
     * @ORM\Column(type="datetime_immutable")
     */
    private $since;

    public function getId(): ?int
    {
        return $this->id;
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

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getLastname(): ?string
    {
        return $this->lastname;
    }

    public function setLastname(string $lastname): self
    {
        $this->lastname = $lastname;

        return $this;
    }

    public function getPhone(): ?string
    {
        return $this->phone;
    }

    public function setPhone(string $phone): self
    {
        $this->phone = $phone;

        return $this;
    }

    public function getRole(): ?string
    {
        return $this->role;
    }

    public function setRole(string $role): self
    {
        $this->role = $role;

        return $this;
    }

    public function getImgpath(): ?string
    {
        return $this->imgpath;
    }

    public function setImgpath(?string $imgpath): self
    {
        $this->imgpath = $imgpath;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getShortDesc(): ?string
    {
        return $this->shortDesc;
    }

    public function setShortDesc(string $shortDesc): self
    {
        $this->shortDesc = $shortDesc;

        return $this;
    }

    public function getSince(): ?\DateTimeImmutable
    {
        return $this->since;
    }

    public function setSince(\DateTimeImmutable $since): self
    {
        $this->since = $since;

        return $this;
    }
}
