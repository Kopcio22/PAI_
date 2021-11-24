<?php

/**
 * @see       https://github.com/laminas/laminas-mvc-skeleton for the canonical source repository
 * @copyright https://github.com/laminas/laminas-mvc-skeleton/blob/master/COPYRIGHT.md
 * @license   https://github.com/laminas/laminas-mvc-skeleton/blob/master/LICENSE.md New BSD License
 */

declare(strict_types=1);

namespace Application\Controller;

use Application\Model\Data;
use Laminas\Mvc\Controller\AbstractActionController;

class IndexController extends AbstractActionController
{
    public function indexAction()
    {
        return [
            'naglowek' => 'Testowy nagłówek',
        ];
    }

    public function dataAction()
    {
        $data = new Data();

        return [
            'dzisiaj' => $data->dzisiaj(),
            'dni_tygodnia' => $data->dniTygodnia(),
        ];
    }
}
