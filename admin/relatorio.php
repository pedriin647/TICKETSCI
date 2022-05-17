<?php

	
	//referenciar o DomPDF com namespace
	use Dompdf\Dompdf;

	// include autoloader
	require_once("dompdf/autoload.inc.php");

	//Criando a Instancia
	$dompdf = new DOMPDF();
	
	// Carrega seu HTML
	$dompdf->load_html('
			<h1 style="text-align: center;">Suporte SCI - Relatório de Chamados</h1>
			<br><hr><br><br>
            <h3>Nome Solicitante:</h3> <p> Thiago Andrade </p>
            <br>
		');

    // (Optional) Setup the paper size and orientation
    $dompdf->setPaper('A4', 'landscape');

	//Renderizar o html
	$dompdf->render();

	//Exibir a página
	$dompdf->stream();