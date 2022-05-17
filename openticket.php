<?php

session_start();
$userLogado = $_SESSION['userSession'];


if(isset($_GET['logout']))
{
  session_destroy();
  header('location: index.php');
}


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="x-ua-compatible" content="IE=edge" >
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
      <a class="nav-item nav-link " href="dash.php">Home </a>
      <a class="nav-item nav-link active" href="openticket.php">Abrir Ticket </a>
      <a class="nav-item nav-link" href="viewticket.php">Meus Tickets</a>
     
    </div>  
  </div>
  
  <?php echo "Bem vindo, " .$userLogado. "!" ?>
  <div class="navbar-nav"> 
  <a class=" nav-item nav-link  fa-solid fa-circle-user" href="#"></a>
  <a class=" nav-item nav-link  fa-solid fa-circle-xmark" onclick="Logout()" href="#"></a>
</div>

</nav> 


<div class="container-fluid">
<br><br>
<div class="row">
          <div class="col-lg-12 p-2">
            <div class="jumbotron rounded-0">
              <h1 class="display-4">Abertura de Ticket</h1>
              <p class="lead">Preencha os campos abaixo para registrar sua solicitação
              </p>
              <hr class="my-4">
            <form action="loadticket.php" method="POST">
                <div class="form-group">
                <label for="exampleFormControlInput1">Assunto:</label>      
                <input type="text" class="form-control" name="assunto" required>
                </div>

                <div class="form-group">
                <label for="exampleFormControlInput1">Mensagem:</label>      
                <textarea class="form-control" name="mensagem" rows="3" required></textarea>
                </div>

               
                <!-- <input type="submit" class="btn btn-primary btn-lg rounded-0" ></input> -->
                <button type="submit" name="go" class="btn btn-primary btn-lg rounded-0">Confirmar</button>
              
                
            </form>
             
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