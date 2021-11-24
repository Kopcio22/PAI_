<?php

namespace Nieruchomosci\Controller;

use Mpdf\Mpdf;
use Nieruchomosci\Form;
use Nieruchomosci\Model\Oferta;
use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\View\Model\ViewModel;
use Laminas\View\Renderer\PhpRenderer;

class OfertyController extends AbstractActionController
{
    /**
     * @var Oferta
     */
    private $oferta;

    /**
     * @var PhpRenderer
     */
    private $phpRenderer;

    /**
     * OfertyController constructor.
     * @param Oferta $oferta
     */
    public function __construct(Oferta $oferta, PhpRenderer $phpRenderer)
    {
        $this->oferta = $oferta;
        $this->phpRenderer = $phpRenderer;
    }

    public function listaAction()
    {
        $parametry = $this->params()->fromQuery();
        $strona = $parametry['strona'] ?? 1;

        // pobierz dane ofert
        $paginator = $this->oferta->pobierzWszystko($parametry);
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

    public function szczegolyAction()
    {
        $daneOferty = $this->oferta->pobierz($this->params()->fromRoute('id'));

        return ['oferta' => $daneOferty];
    }
}
