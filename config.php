<?php
header('Content-Type: text/html; charset=utf-8');
$dbHost = 'localhost';
$dbUser = 'root';
$dbPass = '';
$dbName = 'ticketsci';

$conexao = new mysqli($dbHost,$dbUser,$dbPass,$dbName);

$set1 = $conexao->query("SET NAMES 'utf8'");
$set2 = $conexao->query('SET character_set_connection=utf8');
$set3 = $conexao->query('SET character_set_client=utf8'); 
$set4 = $conexao->query('SET character_set_results=utf8');

?>