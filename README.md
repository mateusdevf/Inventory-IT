# Inventory-IT

Projeto simples desenvolvido para a disciplina com o objetivo de criar um sistema web simples para cadastro de laboratórios e equipamentos.

O sistema permite cadastrar laboratórios, listar os laboratórios cadastrados, cadastrar equipamentos e relacionar cada equipamento a um laboratório.

## Tecnologias utilizadas

* Java 17
* Jakarta Servlet
* JSP
* JSTL
* JPA
* Hibernate
* H2 Database
* Bootstrap 5
* Tomcat 11
* Maven

## Estrutura do projeto

O projeto foi organizado utilizando uma arquitetura simples:

```text
JPS -> Servlet -> DAO -> JPA -> H2
```

Os JSP são responsáveis pelas páginas do sistema, os Servlets recebem as requisições, os DAO fazem o acesso aos dados e o Hibernate realiza a persistência no banco H2

## Funcionalidades

* Cadastro de laboratórios
* Listagem de laboratórios
* Cadastro de equipamentos
* Listagem de equipamentos
* Associação de equipamentos com laboratórios
* Dinâmico

## Como executar

Para executar o projeto é necessário ter:

* JDK 17
* Eclipse com suporte para Java Web
* Apache Tomcat 11
* Maven

Importe o projeto no Eclipse como um projeto Maven, configure o Tomcat 11 e execute utilizando:

```text
Run As -> Run on Server
```

Depois acesse:

```text
http://localhost:8082/inventory-it/
```

## Banco de dados

O projeto utiliza o H2 em memória:

```text
jdbc:h2:mem:inventorydb;DB_CLOSE_DELAY=-1
```

Os dados são utilizados durante a execução da aplicação.
