/* COMMIT E ROLLBACK */

    /* DELETANDO REGISTROS COM A CLAUSULA DELETE */

        DELETE FROM CLIENTE; /* Não usar */

        SELECT COUNT(*) FROM CLIENTE
        WHERE Nome = 'Joao';

        SELECT * FROM Cliente
        WHERE Nome = 'Joao'
        OR email = 'JOAO@GMAIL.COM';


        DELETE FROM Cliente -- OR traz todo mundo com apenas uma das duas condições
        WHERE Nome = 'Joao'
        OR Email = 'JOAO@GMAIL.COM';

        DELETE FROM Cliente -- AND traz apenas o registro que satisfaça as duas condições
        WHERE Nome = 'Joao'
        AND Email = 'JOAO@GMAIL.COM';

/* ENTRANDO COM MAIS TELEFONE */

    UPDATE Cliente
    SET Telefone = '978678756'
    WHERE Nome = 'Joao';

/* MODELAGEM DE DADOS 

/* 1º FORMA NORMAL DE MODELAGEM 

    /* TODO CAMPO VETORIZADO SE TORNARÁ OUTRA TABELA 

        -- Campos que são da mesma família mas com preenchimento diferente são vetores. 
        -- Um vetor é uma sequência de variáveis de mesmo tipo e referenciadas por um nome único. Ex: [Amarelo, Verde, Azul]
        --> Vetor de cores.

    /* TODO CAMPO MULTIVALORADO SE TORNARÁ OUTRA TABELA 

        -- Campos com tipos de dados diferentes. Ex: Rua, bairro, cidade, estado.

    /* TODO CAMPO NECESSITA DE PELO MENOS UM CAMPO QUE IDENTIFIQUE TODO O REGISTRO COMO SENDO ÚNICO - PRIMARY KEY 

        -- Chave única dentro de um banco de dados. 

        -- Chave Natural - é pessoal, intransferível. Uma chave natural é um tipo de chave única em um banco de dados formado 
        -- por atributos que existem e são usados ​​no mundo externo fora do banco de dados.

        -- Chave Artificial - é criada para atender uma necessidade dentro de um banco. Ajuda na escala de uma banco de dados.  


/* CARDINALIDADE 

    /* Quem define a cardinalidade é a regra de negócio 

        /* Primeiro algarismo - Obrigatoriedade 
        0 - Não obrigatório
        1 - Obrigatório

        /* Segundo algarismo - Cardinalidade
        1 - Máximo de um
        N - Mais de um
*/


/* TAREFA */

CREATE DATABASE COMERCIO;

    USE COMERCIO;

        CREATE TABLE CLIENTE (
        IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
        NOME VARCHAR(30) NOT NULL,
        SEXO ENUM('M','F') NOT NULL,
        EMAIL VARCHAR(50) UNIQUE,
        CPF VARCHAR(15) UNIQUE

        );

        CREATE TABLE ENDERECO(
        IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
        RUA VARCHAR(30) NOT NULL,
        BAIRRO VARCHAR(30) NOT NULL,
        CIDADE VARCHAR(30) NOT NULL,
        ESTADO CHAR(2) NOT NULL,
        ID_CLIENTE INT UNIQUE,
        FOREIGN KEY(ID_CLIENTE)
        REFERENCES CLIENTE(IDCLIENTE)
        );

        CREATE TABLE TELEFONE(
        IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
        TIPO ENUM('RES','COM','CEL') NOT NULL,
        NUMERO VARCHAR(10) NOT NULL,
        ID_CLIENTE INT,
        FOREIGN KEY(ID_CLIENTE)
        REFERENCES CLIENTE(IDCLIENTE)

        );




/* REGRA DE NEGÓCIO

    ENDERECO - Obrigatório
    Cadastro de somente um.

    TELEFONE - Não obrigatório
    Cadastro de mais de um (opcional).

*/


/* CHAVE ESTANGEIRA FK (FOREIGN KEY) É A CHAVE PRIMÁRIA DE UMA TABELA 
QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERENCIA DE REGISTROS QUE ESTÃO
CONTIDOS DENTRO DELA. 



    EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA.

    EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICARÁ SEMPRE NA CARDINALIDADE N.
*/

