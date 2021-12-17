<?php

namespace Nieruchomosci\Controller;

use Laminas\Mvc\Controller\AbstractActionController;
use Nieruchomosci\Model\Koszyk;

class KoszykController extends AbstractActionController
{
    private Koszyk $koszyk;

    /**
     * KoszykController constructor.
     * @param Koszyk $koszyk
     */
    public function __construct(Koszyk $koszyk)
    {
        $this->koszyk = $koszyk;
    }

    public function dodajAction()
    {
        if($this->getRequest()->isPost()) {
            $this->koszyk->dodaj($this->params()->fromRoute('id'));
            $this->getResponse()->setContent('ok');
        }

        return $this->getResponse();
    }
}
