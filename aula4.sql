/* Função com parâmetros */

        /* Ifnull () */

            SELECT  C.NOME,  
                    IFNULL(C.EMAIL,'**********') AS "E-mail", 
                    T.NUMERO, 
                    E.ESTADO
            FROM CLIENTE C 
            INNER JOIN TELEFONE T 
            ON C.IDCLIENTE = T.ID_CLIENTE 
            INNER JOIN ENDERECO E 
            ON C.IDCLIENTE = E.ID_CLIENTE;

                +---------+-------------------+-----------+--------+
                | NOME    | E-MAIL            | NUMERO    | ESTADO |
                +---------+-------------------+-----------+--------+
                | BARBARA | BARBARA@IG.COM    | 987865248 | RJ     |
                | BARBARA | BARBARA@IG.COM    | 48324575  | RJ     |
                | BARBARA | BARBARA@IG.COM    | 987865248 | RJ     |
                | JULIA   | JULIA@IG.COM      | 34532400  | RJ     |
                | JULIA   | JULIA@IG.COM      | 2222464   | RJ     |
                | MARIANE | MARIANE@IG.COM    | 983162465 | SP     |
                | WESLEY  | **********        | 965156643 | SP     |
                | WESLEY  | **********        | 983322464 | SP     |
                | KELVIN  | KELVIN@IG.COM     | 987652464 | SP     |
                | KELVIN  | KELVIN@IG.COM     | 988762464 | SP     |
                | LUCAS   | LUCAS@IG.COM      | 33652554  | RJ     |
                | ANDRE   | ANDRE@GLOBO.COM   | 68976565  | MG     |
                | ANDRE   | ANDRE@GLOBO.COM   | 99656675  | MG     |
                | KARLA   | KARLA@GMAIL.COM   | 33567765  | RJ     |
                | KARLA   | KARLA@GMAIL.COM   | 88668786  | RJ     |
                | KARLA   | KARLA@GMAIL.COM   | 55689654  | RJ     |
                | FLAVIO  | FLAVIO@IG.COM     | 88687979  | RJ     |
                | DANIELE | DANIELE@GMAIL.COM | 88965676  | ES     |
                | EDUARDO | **********        | 89966809  | PR     |
                | ANTONIO | ANTONIO@IG.COM    | 88679978  | SP     |
                | ANTONIO | ANTONIO@UOL.COM   | 99655768  | PR     |
                | ELAINE  | ELAINE@GLOBO.COM  | 89955665  | SP     |
                | CARMEM  | CARMEM@IG.COM     | 77455786  | RJ     |
                | CARMEM  | CARMEM@IG.COM     | 89766554  | RJ     |
                | ADRIANA | ADRIANA@GMAIL.COM | 77755785  | RJ     |
                | ADRIANA | ADRIANA@GMAIL.COM | 44522578  | RJ     |
                +---------+-------------------+-----------+--------+

    /* View */ 

        CREATE View V_Relatorio AS
            SELECT  c.nome,
                    c.sexo,
                    c.email,
                    t.tipo,
                    t.numero,
                    e.bairro,
                    e.cidade,
                    e.estado

            FROM Cliente C
            INNER JOIN endereco E
            ON c.idcliente = e.id_cliente
            INNER JOIN telefone t 
            ON c.idcliente = t.id_cliente;


        /* Apagando uma View */

            DROP View V_Relatorio

        /* Inserindo um Prefixo */

            CREATE View V_Relatorio AS
            SELECT  c.nome,
                    c.sexo,
                    IFNULL (c.email, 'Não possui') AS Email,
                    t.tipo,
                    t.numero,
                    e.bairro,
                    e.cidade,
                    e.estado

            FROM Cliente C
            INNER JOIN endereco E
            ON c.idcliente = e.id_cliente
            INNER JOIN telefone t 
            ON c.idcliente = t.id_cliente;

    /* Using the View */

    SELECT Nome, Email, Numero as Celular
    FROM v_relatorio;

    /* Update, Insert or Delete - DML */

            /* It's not possible to do INSERT or DELETE from VIEWs who contains JOIN */

                INSERT into v_relatorio values ('Adriana', 'F', 'adriana@uol.com.br', 'cel', '876576898', 'Bela Vista','São Paulo', 'SP');

                ERROR 1394 (HY000): Can not insert into join view 'comercio.v_relatorio' without fields list

                DELETE from V_Relatorio where nome = 'Jorge';

                ERROR 1395 (HY000): Can not delete from join view 'comercio.v_relatorio'

            /* It's possible to do UPDATE in VIEWS who contains JOIN */

            UPDATE V_Relatorio 
            set Nome = 'Mateus' /* novo nome */ 
            where Nome = 'Flavio'; /* nome antigo */

            /* Creating a VIEW Without Join */

            CREATE TABLE Pieces (
            IDPIECES INT PRIMARY KEY AUTO_INCREMENT,
            Nameof VARCHAR(15),
            Strength VARCHAR(30),
            Weakness VARCHAR(30),
            SuperPower VARCHAR(30)
            
            );

            INSERT INTO pieces Values (NULL,'Gandalf','16','5','Sword');
            INSERT INTO pieces Values (NULL,'Aragorn','20','8','Sword');
            INSERT INTO pieces Values (NULL,'Legolas','24','6','Sword');
            INSERT INTO pieces Values (NULL,'Bilbo','13','7','Sword');
            INSERT INTO pieces Values (NULL,'Frodo','11','9','Sword');
            INSERT INTO pieces Values (NULL,'Gollum','13','10','Sword');
            INSERT INTO pieces Values (NULL,'Beorn','22','2','Sword');


        CREATE View Lord_Of_Rings AS
        SELECT Nameof, Superpower
        FROM Pieces;

        UPDATE Pieces 
        set SuperPower = 'Sword'
        where idpieces = 2;
