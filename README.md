# DataPlus para iPhone
Projeto preparado para compilar no GitHub Actions. Ainda não compilado nem testado num iPhone.
Abre https://oficinaplus.pt/software/data_plus_mobile/login.php sem alterações no servidor.

Depois de colocar estes ficheiros na raiz de um repositório GitHub, abrir Actions > Build DataPlus IPA > Run workflow.
Descarregar DataPlus-unsigned-IPA nos artefactos após a execução terminar com sucesso.
O IPA não está assinado. A instalação pessoal requer assinatura, por exemplo com Sideloadly e uma conta Apple gratuita, com renovação de 7 em 7 dias.

Apenas o código deste wrapper é necessário no repositório. Não incluir código PHP, bases de dados ou credenciais.
Compilação gratuita sujeita às quotas e regras do GitHub. Não executar em runners pagos.
