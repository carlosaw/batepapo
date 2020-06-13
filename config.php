<?php
require 'environment.php';

$config = array();

if(ENVIRONMENT == 'development') {
	define("BASE_URL", "http://localhost/chat/");
	$config['dbname'] = 'batepapo1';
	$config['host'] = 'localhost';
	$config['dbuser'] = 'root';
	$config['dbpass'] = '';
} else {
	define("BASE_URL", "http://awregulagens.com.br/");
	$config['dbname'] = 'awregula_estrutura_mvc';
	$config['host'] = '162.241.2.197';
	$config['dbuser'] = 'awregula';
	$config['dbpass'] = 'H121tRa6lx';
}

global $db;
try {
	$db = new PDO("mysql:dbname=".$config['dbname'].";host=".$config['host'],$config['dbuser'],$config['dbpass']);
} catch(PDOException $e) {
	echo "ERRO: ".$e->getMessage();
	exit;
}

