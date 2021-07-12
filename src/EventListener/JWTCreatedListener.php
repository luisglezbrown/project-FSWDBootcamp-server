<?php

namespace App\EventListener;

use App\Service\GuideNormalize;
use Lexik\Bundle\JWTAuthenticationBundle\Event\JWTCreatedEvent;
use Symfony\Component\Security\Core\Authentication\Token\Storage\UsageTrackingTokenStorage;

class JWTCreatedListener 
{
    private $tokenStorage;

    private $userNormalizer;

    public function __construct(
        UsageTrackingTokenStorage $tokenStorage,
        GuideNormalize $userNormalizer
        )
    {
        $this->tokenStorage = $tokenStorage;   
        $this->userNormalizer = $userNormalizer;
    }
    /**
     * @param JWTCreatedEvent $event
     *
     * @return void
     */
    public function onJWTCreated(JWTCreatedEvent $event)
    {
        $payload = $event->getData();
        $user = $this->tokenStorage->getToken()->getUser();

        $payload['user'] = [
            'email' => $user->getEmail(),
            'name' => $user->getName(),
        ];

        $event->setData($payload);
    }
}