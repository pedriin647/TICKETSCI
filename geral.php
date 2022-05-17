<?php

	//referenciar o DomPDF com namespace
	use Dompdf\Dompdf;

	// include autoloader
	require_once("dompdf/autoload.inc.php");

	//Criando a Instancia
	$dompdf = new DOMPDF(["enable_remote" => true]);
	
	// Carrega seu HTML
	//$dompdf->load_html('');

		ob_start();
	include('exibetickets.php');
	$dompdf->load_html(ob_get_clean());
	

    // (Optional) Setup the paper size and orientation
    $dompdf->setPaper('A4');

	//Renderizar o html
	$dompdf->render();

	//Exibir a página
	$dompdf->stream( "Relatório de Atividades", ["Attachment" => false]);