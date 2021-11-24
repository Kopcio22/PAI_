<?php

namespace Nieruchomosci\Controller;

use Laminas\View\Model\ViewModel;
use Nieruchomosci\Form;
use Nieruchomosci\Model\Koszyk;
use Laminas\Mvc\Controller\AbstractActionController;

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
    public function usunAction(){
        if($this->getRequest()->isPost()) {
            $this->koszyk->usun($this->params()->fromRoute('id'));
            $this->getResponse()->setContent('ok');
        }

        return $this->getResponse();
    }
    public function listaAction()
    {
        $parametry = $this->params()->fromQuery(); // $_GET
        $strona = $parametry['strona'] ?? 1;

        // pobierz dane ofert
        $paginator = $this->koszyk->pobierzOferty();
        $paginator->setItemCountPerPage(10)->setCurrentPageNumber($strona);

        // zbuduj formularz wyszukiwania
        $form = new Form\OfertaSzukajForm();
        $form->populateValues($parametry);

        return new ViewModel([
            'form' => $form,
            'oferty' => $paginator,
            'parametry' => $parametry
        ]);
    }

}
