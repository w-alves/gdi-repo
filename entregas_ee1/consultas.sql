ALTER SESSION SET current_schema = G212IF685_EQ07;

-------------------------------------------------------
--                      SQL                          --
-------------------------------------------------------

-- 1 ALTER TABLE
ALTER TABLE CLIENTE
ADD IDADE INT;

ALTER TABLE CLIENTE
DROP COLUMN IDADE;

-- 2 CREATE INDEX 
CREATE INDEX idx_email 
ON CLIENTE (EMAIL);

-- 3 INSERT INTO 
INSERT INTO cliente (id_cliente, email, ultimo_login) VALUES (3424421421, 'rfrsh@gmail.com', CURRENT_TIMESTAMP);


-- 4 UPDATE 
UPDATE cliente
SET email = 'refresh@gmail.com'
WHERE id_cliente = 3424421421;

-- 5 DELETE 
DELETE FROM cliente WHERE id_cliente=3424421421;

-- 6 SELECT FROM WHERE 
SELECT *
FROM CLIENTE_PJ 
WHERE STATUS_CNPJ = 'SUSPENSO';

-- 7 BETWEEN
SELECT *
FROM CLIENTE_PJ 
WHERE capital_social BETWEEN 0 AND 525000; 

-- 8 IN 
SELECT *
FROM CLIENTE_PJ 
WHERE PORTE IN ('MICRO', 'PEQUENA');

-- 9 LIKE 
SELECT *
FROM ENDERECO_CLIENTE  
WHERE logradouro LIKE 'Avenida%';

-- 10 IS NULL ou IS NOT NULL 
SELECT *
FROM ENDERECO_CLIENTE  
WHERE logradouro IS NOT NULL;

-- 11 INNER JOIN 
SELECT A.*, B.*
FROM CLIENTE A
INNER JOIN ENDERECO_CLIENTE B
ON A.ID_CLIENTE = B.ID_CLIENTE;

-- 12 MAX 
SELECT NOME, MAX(PRECO)
FROM PRODUTO
GROUP BY NOME;

-- 13 MIN 
SELECT NOME, MIN(PRECO)
FROM PRODUTO
GROUP BY NOME;

-- 14 MIN 
SELECT NOME, AVG(PRECO)
FROM PRODUTO
GROUP BY NOME;

-- 15 COUNT  
SELECT COUNT(*)
FROM PRODUTO;

-- 16 LEFT JOIN 
SELECT A.*, B.*
FROM CLIENTE A
LEFT JOIN ENDERECO_CLIENTE B
ON A.ID_CLIENTE = B.ID_CLIENTE;

-- 17 SUBCONSULTA COM OPERADOR RELACIONAL

SELECT *
FROM CLIENTE_PJ 
WHERE CAPITAL_SOCIAL > (SELECT AVG(CAPITAL_SOCIAL) 
                       FROM CLIENTE_PJ);

-- 18 SUBCONSULTA COM IN                    
SELECT *
FROM CLIENTE_PJ 
WHERE RAZAO_SOCIAL  IN (SELECT RAZAO_SOCIAL  
             FROM CLIENTE_PJ
             WHERE STATUS_CNPJ = 'ATIVO');
             
-- 19 SUBCONSULTA COM ANY 
SELECT *
FROM ENTREGA 
WHERE ID_ENTREGA = ANY(SELECT ID_ENTREGA  
             FROM ENDERECO_ENTREGA
             WHERE UF = 'SP');
             
-- 20 SUBCONSULTA COM ALL 
SELECT B.CATEGORIA, AVG(A.PRECO)
  FROM PRODUTO A
  LEFT JOIN CATEGORIA B ON A.SKU = B.SKU
  GROUP BY B.CATEGORIA
  HAVING AVG(A.PRECO) >= ALL
        (SELECT AVG(C.PRECO)
         FROM PRODUTO C
         LEFT JOIN CATEGORIA D ON C.SKU = D.SKU
         GROUP BY D.CATEGORIA);
         
-- 21 ORDER BY 
SELECT * FROM PRODUTO 
ORDER BY PRECO DESC;

-- 22 GROUP BY 
SELECT UF, COUNT(*) FROM ENDERECO_CLIENTE 
GROUP BY UF;

-- 23 HAVING 
SELECT UF, COUNT(*) FROM ENDERECO_CLIENTE 
GROUP BY UF 
HAVING UF IN ('SP', 'RJ');

-- 24 UNION 
SELECT * FROM ENDERECO_CLIENTE 
WHERE UF = 'PE' 

UNION 

SELECT * FROM ENDERECO_CLIENTE 
WHERE UF = 'SP';

-- 25 CREATE VIEW 
CREATE OR REPLACE VIEW PRODUTOS_MOUSE_2 AS
SELECT A.*
FROM PRODUTO A 
LEFT JOIN CATEGORIA B ON A.SKU = B.SKU
WHERE B.CATEGORIA ='MOUSE';

-- 26 GRANT / REVOKE

GRANT ALL ON PRODUTO TO public;
REVOKE ALL ON PRODUTO FROM public;

-------------------------------------------------------
--                      PL                           --
-------------------------------------------------------

-- 1 USO DE RECORD 

DECLARE
    TYPE ProdutoRecPreco IS RECORD (
        skuProduto produto.sku%type,
        precoProduto produto.preco%TYPE);
    produto_rec ProdutoRecPreco;
BEGIN
    produto_rec.skuProduto := '0004258792';
    produto_rec.precoProduto := 42.8;
END;

-- 2 USO DE ESTRUTURA DE DADOS DO TIPO TABLE


-- 3 BLOCO ANONIMO 
DECLARE	
	cpf_cliente NUMBER := 23502281422;
    nome_cliente VARCHAR2(255);
   	sobrenome_cliente VARCHAR2(255);
BEGIN
    SELECT nome, sobrenome 
    INTO nome_cliente, sobrenome_cliente 
   	FROM CLIENTE_PF cp
   	WHERE cp.CPF = cpf_cliente;
	DBMS_OUTPUT.PUT_LINE('Nome do cliente PF: ' || nome_cliente || ' ' || sobrenome_cliente);
END; 

-- 4 CREATE PROCEDURE 
CREATE OR REPLACE PROCEDURE get_createddate(id_c NUMBER) 
	IS creation_date TIMESTAMP; 
    BEGIN
    	SELECT c.CREATED_AT 
        INTO creation_date
        FROM CLIENTE c
        WHERE c.ID_CLIENTE = id_c;
        DBMS_OUTPUT.PUT_LINE(creation_date); 
    END;

BEGIN
	get_createddate(23502281422);
END;

-- 5 CREATE FUNCTION
CREATE OR REPLACE FUNCTION get_preco(sku_u IN VARCHAR2) 
	RETURN NUMBER 
	IS preco_produto NUMBER; 
    BEGIN 
    	SELECT DISTINCT A.PRECO
        INTO preco_produto
        FROM  PRODUTO A
        WHERE A.SKU = sku_u;
        RETURN preco_produto; 
    END;

DECLARE precin NUMBER;
BEGIN
    precin := get_preco('0000000007');
    DBMS_OUTPUT.PUT_LINE('Preco: ' || precin);
END;

-- 6 %TYPE 
DECLARE 
    cat CATEGORIA.categoria%TYPE;
BEGIN
        SELECT categoria INTO cat FROM CATEGORIA WHERE sku = '0000000007';
    dbms_output.put_line(cat);
END;

-- 7 %ROWTYPE
DECLARE
    produto_rec produto%ROWTYPE;
BEGIN
    SELECT * INTO produto_rec FROM PRODUTO WHERE PRODUTO.sku = '0000000007';
END;

-- 8 IF ELSIF
DECLARE 
	total1 number;
	total2 number;
BEGIN
	SELECT COUNT(*) INTO total1 FROM produto;
	SELECT COUNT(*) INTO total2 FROM categoria;
	IF(total1 > total2) THEN
    	dbms_output.put_line('Existem produtos sem cateogria');
	ELSIF(total1 < total2) THEN
    	dbms_output.put_line('Existem produtos categorizados nao existentes');
	ELSE
    	dbms_output.put_line('Tudo ok');
	END IF;
END;

-- 9 CASE WHEN
DECLARE
	produto_nome produto.nome%TYPE;
BEGIN
  	SELECT nome INTO produto_nome FROM produto WHERE produto.sku = '0000000007';
  	CASE
    	WHEN produto_nome LIKE 'Teclado%' THEN dbms_output.put_line('Tecladin hein pai');
    	WHEN produto_nome LIKE 'Monitor%' THEN dbms_output.put_line('Monitorzin hein pai');
    	ELSE dbms_output.put_line('...');
 	END CASE;
END;

-- 10 LOOP EXIT WHEN
DECLARE
	i NUMBER := 0;
BEGIN
	FOR cpj 
	IN (SELECT nome_fantasia, capital_social 
		FROM CLIENTE_PJ 
		ORDER BY capital_social DESC)
	LOOP
		EXIT WHEN i > 9;
	    DBMS_OUTPUT.PUT_LINE('Capital social de ' || cpj.nome_fantasia || ': ' || cpj.capital_social);
	   	i := i + 1;
	END LOOP;
END;

-- 11 WHILE LOOP
DECLARE
	counter NUMBER := 0;
	sku_start NUMBER := 1;
	nome_produto VARCHAR2(255);
	preco_produto NUMBER;
BEGIN
	WHILE counter < 10
	LOOP
		SELECT nome, preco
		INTO nome_produto, preco_produto
		FROM PRODUTO p
		WHERE p.SKU = LPAD(to_char(sku_start+counter), 10, '0');
	    DBMS_OUTPUT.PUT_LINE('O produto "' || nome_produto || '" custa ' || preco_produto);
	   	counter := counter + 1;
	END LOOP;
END;

-- 12 FOR LOOP 
DECLARE
	sku_start NUMBER := 1;
	nome_produto VARCHAR2(255);
	preco_produto NUMBER;
BEGIN
	FOR i IN 1..10 LOOP
		SELECT nome, preco
		INTO nome_produto, preco_produto
		FROM PRODUTO p
		WHERE p.SKU = LPAD(to_char(sku_start+i), 10, '0');
	    DBMS_OUTPUT.PUT_LINE('O produto "' || nome_produto || '" custa ' || preco_produto);
	END LOOP;
END;

-- 13 SELECT INTO
DECLARE
	nome_produto VARCHAR2(255);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Produto 000000009:');
	SELECT nome
	INTO nome_produto
	FROM PRODUTO
	WHERE sku = LPAD(to_char(9), 10, '0');
    DBMS_OUTPUT.PUT_LINE(nome_produto);
END;

-- 14 CURSOR (OPEN, FETCH e CLOSE)
Declare
      Cursor Cur_Prod Is
      Select nome, preco
      From PRODUTO;
      Reg_Prod Cur_Prod%Rowtype;
Begin
      Open Cur_Prod;
      Loop
            Fetch Cur_Prod
            Into Reg_Prod;
            Exit When
                      Cur_Prod%NotFound;
            Dbms_Output.Put_Line
                      (Reg_Prod.nome);
      End Loop;
      Close Cur_Prod;
End;

-- 15 EXCEPTION WHEN
CREATE OR REPLACE FUNCTION get_estoque2(sku_u IN VARCHAR2) 
	RETURN NUMBER 
	IS estoque_produto NUMBER; 
    BEGIN 
    	SELECT DISTINCT e.QUANTIDADE 
        INTO estoque_produto
        FROM  ESTOQUE e
        WHERE e.SKU = sku_u;
        RETURN estoque_produto; 
       	
        EXCEPTION
       		WHEN NO_DATA_FOUND THEN
       			RETURN 0;
    END;

DECLARE estoque NUMBER;
BEGIN
    estoque := get_estoque2('0000000001');
    DBMS_OUTPUT.PUT_LINE('Unidades em estoque: ' || estoque);
END;

-- 16 USO DE PARAMETROS (IN, OUT ou IN OUT)
CREATE OR REPLACE PROCEDURE get_lastlogin(id_c NUMBER, last_login OUT TIMESTAMP) IS 
    BEGIN
    	SELECT CREATED_AT 
        INTO last_login
        FROM CLIENTE c
        WHERE c.ID_CLIENTE = id_c; 
    END;

DECLARE 
	lastlogin TIMESTAMP;
BEGIN
	get_lastlogin(23502281422, lastlogin);
	dbms_output.put_line(lastlogin);
END;

-- 17 CREATE OR REPLACE PACKAGE 
CREATE OR REPLACE PACKAGE cliente_pkg AS
	FUNCTION get_enderecoCompleto (id_cli NUMBER)
	RETURN VARCHAR2;

END cliente_pkg;

CREATE OR REPLACE PACKAGE BODY cliente_pkg AS
	FUNCTION get_enderecoCompleto (id_cli NUMBER)
	RETURN VARCHAR2 IS
	endereco_completo VARCHAR2(1000);
  	BEGIN
	  	SELECT logradouro|| ', ' || numero || ', ' || bairro || ', ' || cidade || ', ' || UF
	  	INTO endereco_completo
	  	FROM ENDERECO_CLIENTE
	  	WHERE ID_CLIENTE = id_cli;
		
	  	RETURN endereco_completo;
	END; 
END cliente_pkg;
 
DECLARE 
    cpf_cliente NUMBER := 18679930858;
	endereco VARCHAR2(1000);
BEGIN 
	endereco := cliente_pkg.get_enderecoCompleto(cpf_cliente);
	DBMS_OUTPUT.PUT_LINE(endereco);
END;
 
-- 18 CREATE OR REPLACE PACKAGE BODY 
CREATE OR REPLACE PACKAGE produto_pkg AS
	PROCEDURE preco_do_produto(c_sku produto.sku%TYPE);

END produto_pkg;

CREATE OR REPLACE PACKAGE BODY produto_pkg AS
	PROCEDURE preco_do_produto(c_sku produto.sku%TYPE) IS
    c_prodt produto.preco%TYPE; 
    BEGIN 
       SELECT preco INTO c_prodt 
       FROM produto 
       WHERE sku = c_sku; 
       dbms_output.put_line('Preço do produto: '|| c_prodt); 
    END; 
END produto_pkg;
 
DECLARE 
    code produto.sku%type := '0000000009'; 
BEGIN 
    produto_pkg.preco_do_produto(code); 
END; 

-- 19 TRIGGER (COMANDO)
CREATE OR REPLACE TRIGGER estimaEntrega
    BEFORE INSERT OR UPDATE ON entrega
    BEGIN
        IF (TO_CHAR(SYSDATE, 'DY') in ('WED')) THEN
            RAISE_APPLICATION_ERROR (-20202,'Entregas não sao feitas na quarta, feriado mundial de adoração a Wesley');
        END IF;
    END estimaEntrega;
    
INSERT INTO entrega (id_entrega, id_pedido, nome_destinatario, data_postagem, data_estimada_entrega, data_entrega, status_entrega) VALUES (entrega_seq.nextval, 3, 'Gabriel Felipo', TIMESTAMP '2022-04-02 08:00:00', TIMESTAMP '2022-04-04 12:00:00',TIMESTAMP '2022-04-03 16:00:00', 'ENTREGUE');


INSERT ON entrega     

-- 20 TRIGGER (LINHA) 
CREATE OR REPLACE TRIGGER altera_ultimo_login
    BEFORE INSERT OR UPDATE ON CLIENTE
    FOR EACH ROW
    BEGIN
        IF (:NEW.ultimo_login <= :OLD.ultimo_login) THEN
            RAISE_APPLICATION_ERROR (-20202,'A data do último login não pode ser mais antiga do que a que consta no banco.');
        END IF;
    END altera_ultimo_login;
    
UPDATE cliente SET ultimo_login = TIMESTAMP '1990-01-01 01:01:01'
WHERE id_cliente = 23502281422;
