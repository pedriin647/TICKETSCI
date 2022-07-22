<?php 

session_start();
include_once('..\config.php');

$userLogado = $_SESSION['userSession'];


if(isset($_GET['logout']))
{
  session_destroy();
  header('location: index.php');
}

?>


<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/11004765ed.js" crossorigin="anonymous"></script>
    <title>DASHBOARD SCI</title>
</head>

<body class="bg-dark">
    
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">DASHBOARD | SCI</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link active" href="admdash.php">Home <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link" href="">Controle de Usuários</a>
      <a class="nav-item nav-link" href="">Histórico de Tickets</a>
      <a class="nav-item nav-link" href=""></a>
     
    </div>  
  </div>

 


  <?php echo "Bem vindo, " .$userLogado. "!" ?> 
  <div class="navbar-nav"> 
  <a class="navega nav-item nav-link  fa-solid fa-circle-user" href="#"></a>
  <a class=" nav-item nav-link  fa-solid fa-circle-xmark" onclick="Logout()" href="#" ></a>

</div>
</nav> 


<div class="container-fluid">
<br><br>


<div class="row">
          <div class="col-lg-12 p-2">
            <div class="jumbotron rounded-0">
              <h1 class="display-4">Olá, <?php echo $userLogado; ?></h1>
              <p class="lead">Seja bem vindo ao painel administrativo.
              </p>
              <hr class="my-4">
 
              <div class="container row">
                <div class="mr-lg-5">
              <a href="" class="btn btn-primary btn-lg rounded-0">Controle Usuários</a>
                </div>

                <div class="mr-lg-5">
              <a href="" class="btn btn-warning btn-lg rounded-0">Fila de Tickets</a>
                </div>

                <div>
                <a href="" class="btn btn-secondary btn-lg rounded-0">Configurações</a>
                </div>
              

              </div>
            </div>
          </div>
          
        </div>



</div>









</body>

<script> 

function Logout () 
{
  window.location = 'dash.php?logout';
}

</script>

</html>