<?php

/**
 * @see       https://github.com/laminas/laminas-mvc-skeleton for the canonical source repository
 * @copyright https://github.com/laminas/laminas-mvc-skeleton/blob/master/COPYRIGHT.md
 * @license   https://github.com/laminas/laminas-mvc-skeleton/blob/master/LICENSE.md New BSD License
 */

declare(strict_types=1);

namespace Application;

use Application\Form\KsiazkaForm;
use Application\Model\Autor;
use Interop\Container\ContainerInterface;
use Laminas\Db\Adapter\AdapterAwareInterface;
use Laminas\Db\Adapter\AdapterInterface;

class Module
{
    public function getConfig(): array
    {
        return include __DIR__ . '/../config/module.config.php';
    }

    public function getServiceConfig()
    {
        return [
            'initializers' => [
                'db' => function (ContainerInterface $container, $instance) {
                    if ($instance instanceof AdapterAwareInterface) {
                        $instance->setDbAdapter($container->get(AdapterInterface::class));
                    }
                },
            ],
        ];
    }
}
