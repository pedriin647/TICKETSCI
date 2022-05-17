<?php


//valida o insert
if(isset($_POST['go'])){

   
   session_start();
   include_once('config.php');

   $userLogado = $_SESSION['userSession'];

   $assunto = $_POST['assunto'];
   $mensagem = $_POST['mensagem'];
   $situacao = "ativo";

   $result = mysqli_query($conexao, "INSERT INTO tickets(assunto,mensagem,situacao, nomeuser) 
                                     VALUES ('$assunto', '$mensagem', '$situacao', '$userLogado' )");

echo"<script language='javascript' type='text/javascript'>
     alert('Seu ticket foi aberto! Você pode o acompanhar em Meus Tickets ');window.location
     .href='dash.php';</script>";
   

}
else
{
    header('location: openticket.php');
}
