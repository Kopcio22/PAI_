<?php

namespace Nieruchomosci\Model;

use Laminas\Db\Adapter as DbAdapter;
use Laminas\Db\Sql\Sql;
use Laminas\Paginator\Adapter\DbSelect;
use Laminas\Paginator\Paginator;
use Laminas\Session\Container;
use Laminas\Session\SessionManager;

class Koszyk implements DbAdapter\AdapterAwareInterface
{
	use DbAdapter\AdapterAwareTrait;
	
	protected Container $sesja;
	
	public function __construct()
	{
		$this->sesja = new Container('koszyk');
		$this->sesja->liczba_ofert = $this->sesja->liczba_ofert ? $this->sesja->liczba_ofert : 0;
	}
	
	public function dodaj($idOferty)
	{
		$dbAdapter = $this->adapter;
		$session = new SessionManager();
		$sql = new Sql($dbAdapter);
		$select = $sql->select('koszyk');
		$insert = $sql->insert('koszyk');
		$insert->values([
			'id_oferty' => $idOferty,
			'id_sesji' => $session->getId()
        ]);
		$select->where(['id_oferty' => $idOferty]);
        $select->where(['id_sesji' => $session->getId()]);
        //Ten if poniżej nie działa tak jak powinien więc jest ustawiony żeby zawsze zwracał true
        if(!empty($select)){
            $selectString = $sql->buildSqlString($insert);
            $wynik = $dbAdapter->query($selectString, $dbAdapter::QUERY_MODE_EXECUTE);

            $this->sesja->liczba_ofert++;
        }/*
        $selectString = $sql->buildSqlString($insert);
        $wynik = $dbAdapter->query($selectString, $dbAdapter::QUERY_MODE_EXECUTE);

        $this->sesja->liczba_ofert++;
        */
		try {
			return $wynik->getGeneratedValue();
		} catch(\Exception $e) {
			return false;
		}
	}
    public function usun($idOferty)
    {
        $dbAdapter = $this->adapter;
        $sql = new Sql($dbAdapter);
        $delete = $sql->delete('koszyk')->where(['id_oferty' => $idOferty]);
        $selectString = $sql->buildSqlString($delete);
        $wynik = $dbAdapter->query($selectString, $dbAdapter::QUERY_MODE_EXECUTE);

        $this->sesja->liczba_ofert--;
        try {
            return $wynik->getGeneratedValue();
        } catch(\Exception $e) {
            return false;
        }
    }

	public function liczbaOfert()
	{
		return $this->sesja->liczba_ofert;
	}
	public function pobierzOferty(){
        $dbAdapter = $this->adapter;
        $session = new SessionManager();
        $sql = new Sql($dbAdapter);
        $select = $sql->select('koszyk');
        $select->where(['id_sesji' =>$session->getId()]);
        $select2 = $sql->select('oferty');
        $select2->where->in('id', $select->columns(['id_oferty']));
        $paginatorAdapter = new DbSelect($select2, $dbAdapter);
        $paginator = new Paginator($paginatorAdapter);

        return $paginator;
    }
}