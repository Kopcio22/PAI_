<?php

namespace Nieruchomosci\Model;

use Laminas\Db\Adapter as DbAdapter;
use Laminas\Db\Sql\Sql;
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
		$insert = $sql->insert('koszyk');
		$insert->values([
			'id_oferty' => $idOferty,
			'id_sesji' => $session->getId()
        ]);
		
		$selectString = $sql->buildSqlString($insert);
		$wynik = $dbAdapter->query($selectString, $dbAdapter::QUERY_MODE_EXECUTE);
		
		$this->sesja->liczba_ofert++;
		
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
}