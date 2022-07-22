<?php 

session_start();
include_once('config.php');

$userLogado = $_SESSION['userSession'];


if(isset($_GET['logout']))
{
  session_destroy();
  header('location: index.php');
}



$result1 = $conexao->query("select * from tickets where nomeuser='$userLogado'");
$count1=$result1->num_rows;


$result2 = $conexao->query("select * from tickets where situacao='ativo' and nomeuser='$userLogado'");
$count2=$result2->num_rows;

$result3 = $conexao->query("select * from tickets where situacao='encerrado' and nomeuser='$userLogado'");
$count3=$result3->num_rows;

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
    <title>Suporte SCI</title>
</head>

<body class="bg-dark">
    
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Atendimento | SCI</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link active" href="dash.php">Home <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link" href="openticket.php">Abrir Ticket</a>
      <a class="nav-item nav-link" href="viewticket.php">Meus Tickets</a>
     
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



<div class="col-lg-4 col-md-6 p-2">
  <div class="card border-success rounded-0">
    <div class="card-header bg-success rounded-0">
      <h5 class="card-title text-white mb-1">Tickets em Aberto</h5>
    </div>
    <div class="card-body">
      <h1 class="display-4 font-weight-bold text-success text-center"><?php echo "$count2"; ?>  </h1>
    </div>
  </div>
</div>

<div class="col-lg-4 p-2">
  <div class="card border-danger rounded-0">
    <div class="card-header bg-danger rounded-0">
      <h5 class="card-title text-white mb-1">Tickets Encerrados</h5>
    </div>
    <div class="card-body">
      <h1 class="display-4 font-weight-bold text-danger text-center"><?php echo "$count3"; ?></h1>
    </div>
  </div>
</div>

<div class="col-lg-4 col-md-6 p-2">
  <div class="card border-primary rounded-0">
    <div class="card-header bg-primary rounded-0">
      <h5 class="card-title text-white mb-1">Tickets Totais</h5>
    </div>
    <div class="card-body">
      <h1 class="display-4 font-weight-bold text-primary text-center"><?php echo "$count1"; ?></h1>
    </div>
  </div>
</div>

</div>

<div class="row">
          <div class="col-lg-12 p-2">
            <div class="jumbotron rounded-0">
              <h1 class="display-4">Importante | Procedimentos Padrão</h1>
              <p class="lead">Antes de abrir um Ticket, veja os procedimentos elaborados pela Comunicação e Informática que podem solucionar seu problema
              </p>
              <hr class="my-4">
              
                <ul>
              <li>primeiro item</li>
              <li>segundo item</li>
              <li>terceiro item</li>
                </ul>
              
              <a href="openticket.php" class="btn btn-primary btn-lg rounded-0">Abrir Ticket</a>
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