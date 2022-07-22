<?php


$usuario = $_POST['usuario'];
$senha = $_POST['senha'];
$entrar = $_POST['go'];




  if (isset($entrar)) {
    include_once('config.php');
    session_start();
    $query = "SELECT * FROM usuarios WHERE nome = '$usuario' AND senha = '$senha'";
    $verifica = mysqli_query($conexao, $query);
      if (mysqli_num_rows($verifica)<=0){
        echo"<script language='javascript' type='text/javascript'>
        alert('Credenciais Incorretas');window.location
        .href='index.php';</script>";
        die();
      }
      else
      {
        $_SESSION['userSession'] = $usuario;
        header("Location:dash.php");
      }

  }
  else
  {
    echo"<script language='javascript' type='text/javascript'>
    alert('Preencha o campo para prosseguir');window.location
    .href='index.php';</script>";
    die();

  }
