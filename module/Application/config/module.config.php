<?php

/**
 * @see       https://github.com/laminas/laminas-mvc-skeleton for the canonical source repository
 * @copyright https://github.com/laminas/laminas-mvc-skeleton/blob/master/COPYRIGHT.md
 * @license   https://github.com/laminas/laminas-mvc-skeleton/blob/master/LICENSE.md New BSD License
 */

declare(strict_types=1);

namespace Application;

use Application\Controller\IndexController;
use Application\Controller\KsiazkiController;
use Application\Controller\AutorzyController;
use Application\Controller\KsiazkiControllerFactory;
use Application\Controller\AutorzyControllerFactory;
use Application\Form\KsiazkaForm;
use Application\Form\AutorForm;
use Application\Model\Autor;
use Application\Model\Ksiazka;
use Laminas\Router\Http\Literal;
use Laminas\Router\Http\Segment;
use Laminas\ServiceManager\AbstractFactory\ReflectionBasedAbstractFactory;
use Laminas\ServiceManager\Factory\InvokableFactory;

return [
    'router' => [
        'routes' => [
            'home' => [
                'type' => Literal::class,
                'options' => [
                    'route' => '/',
                    'defaults' => [
                        'controller' => IndexController::class,
                        'action' => 'index',
                    ],
                ],
            ],
            'application' => [
                'type' => Segment::class,
                'options' => [
                    'route' => '/application[/:action]',
                    'defaults' => [
                        'controller' => IndexController::class,
                        'action' => 'index',
                    ],
                ],
            ],
            'ksiazki' => [
                'type' => Segment::class,
                'options' => [
                    'route' => '/ksiazki[/:action][/:id]',
                    'defaults' => [
                        'controller' => KsiazkiController::class,
                        'action' => 'lista',
                    ],
                ],
            ],
            'autorzy' => [
                'type' => Segment::class,
                'options' => [
                    'route' => '/autorzy[/:action][/:id]',
                    'defaults' => [
                        'controller' => AutorzyController::class,
                        'action' => 'lista',
                    ],
                ],
            ],
        ],
    ],
    'controllers' => [
        'factories' => [
            IndexController::class => InvokableFactory::class,
            KsiazkiController::class => KsiazkiControllerFactory::class,
            AutorzyController::class => AutorzyControllerFactory::class,
        ],
    ],
    'service_manager' => [
        'factories' => [
            Ksiazka::class => InvokableFactory::class,
            Autor::class => InvokableFactory::class,
            KsiazkaForm::class => ReflectionBasedAbstractFactory::class,
            AutorForm::class => ReflectionBasedAbstractFactory::class,
        ],
    ],
    'view_manager' => [
        'display_not_found_reason' => true,
        'display_exceptions' => true,
        'doctype' => 'HTML5',
        'not_found_template' => 'error/404',
        'exception_template' => 'error/index',
        'template_map' => [
            'layout/layout' => __DIR__ . '/../view/layout/layout.phtml',
            'application/index/index' => __DIR__ . '/../view/application/index/index.phtml',
            'error/404' => __DIR__ . '/../view/error/404.phtml',
            'error/index' => __DIR__ . '/../view/error/index.phtml',
        ],
        'template_path_stack' => [
            __DIR__ . '/../view',
        ],
    ],
];
