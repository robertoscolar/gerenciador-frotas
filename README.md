# Proposta

Este projeto foi realizado como treinamento no desenvolvimento de aplicações desktop utilizando Windows Forms (C#).
<br/>
A ideia é provisionar um software para gestão de frotas que seja confiável, rápido e eficaz.

# Menus

A aplicação conta com 4 menus principais, suas funções serão destacadas abaixo:

![image](https://github.com/user-attachments/assets/db62297b-40fd-49ee-a409-cd23650f4d2a)


## Cadastro

Esse menu é dedicado ao cadastro dos itens que serão utilizados nas regras de negócios da aplicação.
<br/>
Aqui é possível cadastrar todos os detalhes pertinentes aos veículos (marca, modelo e categoria), usuários com acesso ao sistema, oficinas e colaboradores/funcionários.

![image](https://github.com/user-attachments/assets/e4198234-c73b-43c3-a16f-86bc4d304139)


## Controle

Aqui é onde ocorrem as principais regras de negócio.
<br/>
Esse menu é construído para o gerenciamento das saídas/entradas dos funcionários e veículos, mantendo dados como a quilometragem percorrida e o tempo de partida de cada uma das ações. Esses dados poderão ser auditados de acordo com a necessidade do cliente.

![image](https://github.com/user-attachments/assets/0a8fc91d-05a9-4f96-8f27-eb057987066a)


## Manutenção

Os carros que precisam de manutenção poderão ser direcionados ás oficinas cadastradas no sistema, dessa forma mantendo a rastreabilidade e o gerenciamento.
<br/>
Os veículos que estiverem em manutenção não poderão ser utilizados para saída da garagem até que seu retorno seja anunciado. 

![image](https://github.com/user-attachments/assets/4b9244b0-869a-49e6-9e53-4acfd29b4ffd)


## Sair

Esse menu é construído para fechar a aplicação.

![image](https://github.com/user-attachments/assets/24b5e64b-ec02-486f-af94-1debe2c96084)

![image](https://github.com/user-attachments/assets/1953cfd2-8bf7-488e-b356-09a9d508ea22)


<br/>

# Configuração do Projeto

## Softwares necessários:

 - Sistema Operacional Windows (não é .NET Core)
 - SQL Server

## Inicialização do projeto COM Docker

De modo a facilitar o teste da aplicação, foi disponibilizado o executável já compilado dentro do repositório.
Mesmo assim, se faz necessária a configuração dos componentes referentes ao banco de dados SQL Server.
<br/>
<br/>
Segue o passo-a-passo da configuração:
<br/>
<br/>

1. Após clonar o repositório, entre na pasta `app` e execute o arquivo `configuration.bat`;
  
    ![image](https://github.com/user-attachments/assets/e9227b57-d665-4a9d-b6f6-8d1b5bfef31d)
  <br/>
  
3. O CLI terá duas opções: 1 para `INSTALL` e 2 para `CLEAN`, cada uma com sua finalidade:
   <br/>
   - ``INSTALL:`` Subirá o SQL Server via Docker Compose e fará a execução dos scripts de install nas tabelas do banco;
   - ``CLEAN:`` Remove o contâiner criado para aplicação do sistema operacional. A imagem do SQL Server continua ativa para construção de futuros contêineres;

   ![image](https://github.com/user-attachments/assets/0e15a256-6308-4106-b8da-ddaec82e7c3e)
  <br/>

4. Após a finalização do script, já é possível executar o projeto. Execute o arquivo chamado `GerenciadorFrotas.exe`, no mesmo diretório, para iniciar a aplicação;
   <br/>
   
   ![image](https://github.com/user-attachments/assets/5ce755fd-e759-4a33-ba32-d475c62afcb8)

  - Usuário: `admin`
  - Senha: `admin`

  <br/>

4. Tudo pronto para operar.
   <br/>
   
   ![image](https://github.com/user-attachments/assets/d5bd6eba-80ad-41b8-b97d-0911169ad457)


#### OBS: As configurações estarão contidas no arquivo `GerenciadorFrotas.exe.config`, porém, no caso acima, não é necessário configurar.

<br/>

## Inicialização do projeto SEM Docker (configuração manual)

1. Crie um novo banco de dados com o nome `GerenciadorFrotas`;

2. Execute os scripts contidos em `./sql/install/` na seguinte ordem:

   1. 1-ddl.sql
   2. 2-dml.sql
   3. 3-massa-de-dados.sql

3. Verifique se a propriedade `servidor` está correta;

4. Inicialize a aplicação com o executável `GerenciadorFrotas.exe`.

    - Usuário: `admin`
    - Senha: `admin`

  <br/>
