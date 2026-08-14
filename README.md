|*Melhorando a Segurança do CRUD com Prepared Statements*


**O que é SQL injection?** 

É uma forma de atacar ou alterar um banco de dados SQL, funciona inserindo um comando em SQL como se fosse um valor da variável.

**O que é Prepared Estatement?**
    
É um método de segurança, muito útil contra o SQL injection, pois você faz com que o envio do dado para o banco seja revisado e depois alocado na estrutura, isso impede que os comandos sejam validados.


**Exemplo de preparação:**

Código original:
<?php


include "../infra/conexao.php";


$titulo = $_POST["titulo"];
$autor = $_POST["autor"];
$ano = $_POST["ano"];


$sql = "INSERT INTO livros (titulo,autor,ano) VALUES ('$titulo','$autor','$ano')";


mysqli_query($conexao, $sql);


header("Location: ../index.php");
?>



**Código com Prepared Estatement:** 

<?php


include "../infra/conexao.php";


$titulo = $_POST["titulo"];
$autor = $_POST["autor"];
$ano = $_POST["ano"];


$sql = "INSERT INTO livros (titulo, autor, ano) VALUES (?, ?, ?)";
$stmt = mysqli_prepare($conexao, $sql);


if ($stmt) {
    mysqli_stmt_bind_param($stmt, "ssi", $titulo, $autor, $ano);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
}


header("Location: ../index.php");
exit();
?>

**Explicação das mudanças**

Placeholders (?): A query não concatena mais variáveis diretamente, evitando a execução de códigos maliciosos enviados pelo formulário.
mysqli_prepare(): Envia o modelo da query ao banco de dados para ser pré-compilado.
mysqli_stmt_bind_param(): Passa os dados com segurança. O primeiro argumento "ssi" define os tipos de dados enviados na ordem:
s = string ($titulo)
s = string ($autor)
i = integer ($ano)
exit() após o header(): Garante que o script pare de ser executado imediatamente após o redirecionamento.




