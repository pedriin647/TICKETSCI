<?php 
include_once('config.php');

$id = $_GET['id'];

$view = $conexao->query("SELECT * FROM tickets WHERE id= '$id' ");


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
      <a class="nav-item nav-link " href="openticket.php">Abrir Ticket </a>
      <a class="nav-item nav-link active" href="viewticket.php">Meus Tickets</a>
     
    </div>  
  </div>
  <a>Bem vindo, Pedro!</a>  
  <a class="nav-item nav-link  fa-solid fa-circle-user" href="#"></a>
  <a class="nav-item nav-link  fa-solid fa-circle-xmark" href="#"></a>

</nav> 


<div class="container-fluid">
<br><br>
<div class="row">
          <div class="col-lg-12 p-2">
            <div class="jumbotron rounded-0">
              <h1 class="display-4">Detalhes do Ticket</h1>
              <hr class="my-4">


              <?php 
                      while($user_ticket = mysqli_fetch_assoc($view)){
                        
                        echo "<strong><p>Código: </strong> <br>".$user_ticket['id']."</p><br>";
                        echo "<strong><p>Status: </strong> <br>".$user_ticket['situacao']."</p><br>";
                        echo "<strong><p>Solicitante: </strong> <br>".$user_ticket['nomeuser']."</p><br>";
                        echo "<strong><p>Assunto: </strong> <br>".$user_ticket['assunto']."</p><br>";
                        echo "<strong><p>Descrição: </strong> <br>".$user_ticket['mensagem']."</p><br>";

                      }
                    ?>

              <a href="viewticket.php" class="btn btn-danger btn-lg rounded-0">Voltar</a>
              <?php echo "
                        <a class='btn btn-dark btn-lg rounded-0' href='geral.php?id=$id'> 
                        <svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-file-earmark-pdf-fill' viewBox='0 0 16 16'>
                          <path d='M5.523 12.424c.14-.082.293-.162.459-.238a7.878 7.878 0 0 1-.45.606c-.28.337-.498.516-.635.572a.266.266 0 0 1-.035.012.282.282 0 0 1-.026-.044c-.056-.11-.054-.216.04-.36.106-.165.319-.354.647-.548zm2.455-1.647c-.119.025-.237.05-.356.078a21.148 21.148 0 0 0 .5-1.05 12.045 12.045 0 0 0 .51.858c-.217.032-.436.07-.654.114zm2.525.939a3.881 3.881 0 0 1-.435-.41c.228.005.434.022.612.054.317.057.466.147.518.209a.095.095 0 0 1 .026.064.436.436 0 0 1-.06.2.307.307 0 0 1-.094.124.107.107 0 0 1-.069.015c-.09-.003-.258-.066-.498-.256zM8.278 6.97c-.04.244-.108.524-.2.829a4.86 4.86 0 0 1-.089-.346c-.076-.353-.087-.63-.046-.822.038-.177.11-.248.196-.283a.517.517 0 0 1 .145-.04c.013.03.028.092.032.198.005.122-.007.277-.038.465z'/>
                          <path fill-rule='evenodd' d='M4 0h5.293A1 1 0 0 1 10 .293L13.707 4a1 1 0 0 1 .293.707V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2zm5.5 1.5v2a1 1 0 0 0 1 1h2l-3-3zM4.165 13.668c.09.18.23.343.438.419.207.075.412.04.58-.03.318-.13.635-.436.926-.786.333-.401.683-.927 1.021-1.51a11.651 11.651 0 0 1 1.997-.406c.3.383.61.713.91.95.28.22.603.403.934.417a.856.856 0 0 0 .51-.138c.155-.101.27-.247.354-.416.09-.181.145-.37.138-.563a.844.844 0 0 0-.2-.518c-.226-.27-.596-.4-.96-.465a5.76 5.76 0 0 0-1.335-.05 10.954 10.954 0 0 1-.98-1.686c.25-.66.437-1.284.52-1.794.036-.218.055-.426.048-.614a1.238 1.238 0 0 0-.127-.538.7.7 0 0 0-.477-.365c-.202-.043-.41 0-.601.077-.377.15-.576.47-.651.823-.073.34-.04.736.046 1.136.088.406.238.848.43 1.295a19.697 19.697 0 0 1-1.062 2.227 7.662 7.662 0 0 0-1.482.645c-.37.22-.699.48-.897.787-.21.326-.275.714-.08 1.103z'/>
                          </svg>
                          Gerar relatório individual
                        </a>";        
              ?>

            </div>
          </div>
          
        </div>

</div>

</div>




</body>
</html>