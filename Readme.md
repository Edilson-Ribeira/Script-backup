## Script para realizar backup e restauração de dados de um usuario

Este script foi criado com intuito de ajudar os profissionais de suporte a realizar backup e resturação de dados de um usuario que tem grandes quantitidade de dados.

* [1] - BACKUP
   * Opção 1 solicita que seja digitado a unidade que esta os dados do colaborador, em seguida ele entra na pasta Users e mostra na tela os usuários e solicita que seja digitado o usuário que sera feito o backup e depois solicita que seja colocado o diretório que sera feito o backup, apos incluir o diretório a copia dos dados ira começar a copia dos dados, ira ocorrer erro se a pasta onde sera salvo os dados estiver com espaço.
   
  
* [2] - RESTAURAR BACKUP
   * Opção 2 solicita também que seja digitado a unidade onde esta o sistema operacional e em seguida entra na pasta Users e mostra todos os usuário criado no micro e solicita que seja digitado o usuário que você quer restaurar os dados, apos digitar o usuário e apertar a tecla ENTER sera solicitado que seja digitado o diretório que esta os backup do usuário, apos digitar o diretório e apertar ENTER a restauração sera iniciada.

   
   
* [3] - Sair
   * Opção que fecha o programa

## Comando e Paramêtros utilizado no script

* -> xcopy: Copia arquivos e diretórios, incluindo subdiretórios.
* -> /c: Ignora erros.
* -> /e: Copia todos os subdiretórios, mesmo que estejam vazios. 
* -> /y: Suprime a solicitação para confirmar que você deseja substituir um arquivo de destino existente.(Utilizado somente na restauração dos dados)
