<?php


namespace Application\Model;


class Data
{
    /**
     * Dzisiejsza data.
     *
     * @return string
     */
    public function dzisiaj(): string
    {
        return date('Y-m-d H:i:s');
    }

    /**
     * Lista dni tygodnia.
     *
     * @return string[]
     */
    public function dniTygodnia(): array
    {
        return ['Poniedziałek', 'Wtorek', 'Środa', 'Czwartek', 'Piątek', 'Sobota', 'Niedziela'];
    }
}