<?php 

include_once('config.php');
session_start();

//Parametros importantes
$userLogado = $_SESSION['userSession'];


if(isset($_GET['id']))
{
  $id = $_GET['id'];
  $view = "SELECT * FROM tickets WHERE id='$id'";
}
else
{
  $view = "SELECT * FROM tickets WHERE nomeuser='$userLogado' ORDER BY id";
}



//Coletando data onde foi gerado o relatório
date_default_timezone_set('America/Sao_Paulo');
$Data = date('d-m-Y h:i:s a', time());  


//Armazenando query em uma variável
$result = $conexao->query($view);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="IE=edge" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Suporte SCI</title>
</head>
<body>
                    <?php 
                        echo "<h2>Relatório De Tickets Emitidos | Informática </h2>";
                        echo "<strong>Relatório Gerado Em:</strong> " .$Data. "";
                        echo "<br><br>";
                        echo "<strong>Relatório Emitido Por: </strong>" .$userLogado. "";
                        echo "<br><br>";
                        echo "<hr>";

                      while($user_data = mysqli_fetch_assoc($result)){
                        echo "<strong>Id:</strong> ".$user_data['id']."";
                        echo "<br><br>";
                       
                        echo "<strong>Solicitante:</strong> ".$user_data['nomeuser']."";
                        echo "<br><br>";
                      
                        echo "<strong>Assunto:</strong> ".$user_data['assunto']."";
                        echo "<br><br>";
                       
                        echo "<strong>Descrição:</strong> ".$user_data['mensagem']."";
                        echo "<br><br>";
                       
                        echo "<strong>Situação:</strong> ".$user_data['situacao']."";
                        echo "<br><br>";
                        echo "<hr>";

                        
                      }
                    ?>
</body>
</html>


