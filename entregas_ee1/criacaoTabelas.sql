ALTER SESSION SET current_schema = G212IF685_EQ07;

DROP TABLE telefone_entrega;
DROP TABLE endereco_entrega;
DROP TABLE entrega;
DROP TABLE avaliacao_produto;
DROP TABLE categoria;
DROP TABLE estoque;
DROP TABLE detalhe_pedido;
DROP TABLE produto;
DROP TABLE pagamento;
DROP TABLE pedido;
DROP TABLE telefone_cliente;
DROP TABLE endereco_cliente;
DROP TABLE cliente_pf;
DROP TABLE cliente_pj;
DROP TABLE cliente;

DROP SEQUENCE avaliacao_produto_seq;
DROP SEQUENCE pedido_seq;
DROP SEQUENCE entrega_seq;
DROP SEQUENCE pagamento_seq;
   
CREATE TABLE cliente (
    id_cliente NUMBER,
    email VARCHAR2(255) NOT NULL,
    ultimo_login TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT cliente_pk PRIMARY KEY (id_cliente)
);

CREATE TABLE cliente_pj (
    CNPJ NUMBER,
    razao_social VARCHAR2(255) NOT NULL,
    nome_fantasia VARCHAR2(255) NOT NULL,
    porte VARCHAR2(8) NOT NULL,
    capital_social NUMBER NOT NULL,
    status_cnpj VARCHAR2(50),
    CONSTRAINT cliente_pj_status_cnpj CHECK (status_cnpj IN ('ATIVO', 'SUSPENSO')),
    CONSTRAINT cliente_pj_porte CHECK (porte IN ('MICRO', 'PEQUENA', 'MEDIA', 'GRANDE')),
    CONSTRAINT cliente_pj_pk PRIMARY KEY (CNPJ),
    CONSTRAINT cliente_pj_fk FOREIGN KEY (CNPJ) REFERENCES cliente (id_cliente)
);

CREATE TABLE cliente_pf (
    CPF NUMBER,
    nome VARCHAR2(255),
    sobrenome VARCHAR2(255),
    data_de_nascimento DATE,
    CONSTRAINT cliente_pf_pk PRIMARY KEY (CPF),
    CONSTRAINT cliente_pf_fk FOREIGN KEY (CPF) REFERENCES cliente (id_cliente)
);

CREATE TABLE endereco_cliente (
    id_cliente NUMBER,    
    CEP NUMBER,
    logradouro VARCHAR2(255),
    bairro VARCHAR2(255),
    cidade VARCHAR2(255),
    UF CHAR(2),
    numero NUMBER,
    CONSTRAINT endereco_cliente_pk PRIMARY KEY (CEP, id_cliente),
    CONSTRAINT endereco_cliente_fk FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT cep_cliente_ck CHECK (REGEXP_LIKE(CEP, '^[0-9]{8}$'))
);

CREATE TABLE telefone_cliente (
    id_cliente NUMBER,
    telefone CHAR(11),
    CONSTRAINT telefone_cliente_pk PRIMARY KEY (id_cliente, telefone),
    CONSTRAINT telefone_cliente_fk FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT telefone_cliente_ck CHECK (REGEXP_LIKE(telefone, '^[1-9]{2}(?:[2-8]|9[1-9])[0-9]{7}$'))
);

CREATE TABLE pedido (
    id_pedido NUMBER UNIQUE,
    id_cliente NUMBER,
    valor_total NUMBER,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR2(20),
    CONSTRAINT pedido_pk PRIMARY KEY (id_pedido, id_cliente),
    CONSTRAINT pedido_cliente_fk FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT status_pedido_ck CHECK (status in ('AGUARDANDO PAGAMENTO', 'EM ENTREGA', 'FINALIZADO'))
);

CREATE TABLE pagamento (
    id_pagamento NUMBER,
    id_cliente NUMBER,
    id_pedido NUMBER,
    status_pagamento VARCHAR(20),
    data_pagamento TIMESTAMP,
    valor_pagamento NUMBER,
    CONSTRAINT pagamento_pk PRIMARY KEY (id_pagamento, id_cliente, id_pedido),
    CONSTRAINT pagamento_cliente_pedido_fk FOREIGN KEY (id_cliente, id_pedido) REFERENCES pedido (id_cliente, id_pedido),
    CONSTRAINT status_pagamento_ck CHECK (status_pagamento in ('AGUARDANDO PAGAMENTO', 'PAGO'))
);

CREATE TABLE produto (
    SKU VARCHAR2(10),
    nome VARCHAR2(255) NOT NULL,
    descricao VARCHAR2(1000),
    preco NUMBER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT produtos_pk PRIMARY KEY (SKU)
);

CREATE TABLE detalhe_pedido (
	id_pedido NUMBER,
	SKU VARCHAR2(10),
	quantidade NUMBER,
	CONSTRAINT detalhe_pedido_pk PRIMARY KEY (id_pedido, SKU),
    CONSTRAINT detalhe_pedido_pedido_fk FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    CONSTRAINT detalhe_pedido_sku_fk FOREIGN KEY (SKU) REFERENCES produto (SKU)
);

CREATE TABLE estoque (
	SKU VARCHAR2(10),
	quantidade NUMBER,
	CONSTRAINT estoque_pk PRIMARY KEY (SKU),
	CONSTRAINT estoque_produto_fk FOREIGN KEY (SKU) REFERENCES produto (SKU)
);

CREATE TABLE categoria (
	SKU VARCHAR2(10),
	categoria VARCHAR2(255),
	CONSTRAINT categoria_pk PRIMARY KEY (SKU, categoria),
	CONSTRAINT categoria_produto_fk FOREIGN KEY (SKU) REFERENCES produto (SKU)
);

CREATE TABLE avaliacao_produto (
	id_avaliacao NUMBER,
	SKU varchar2(10),
	nota NUMBER,
	CONSTRAINT avaliacao_produto_pk PRIMARY KEY (id_avaliacao, SKU),
	CONSTRAINT avaliacao_produto_produto_fk FOREIGN KEY (sku) REFERENCES produto (SKU),
	CONSTRAINT nota_ck CHECK (nota in (0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0))
);

CREATE TABLE entrega (
	id_entrega NUMBER UNIQUE,
    id_pedido NUMBER,
    nome_destinatario VARCHAR2(255) NOT NULL,
    data_postagem TIMESTAMP,
    data_estimada_entrega TIMESTAMP,
    data_entrega TIMESTAMP,
    status_entrega VARCHAR2(17),
    CONSTRAINT entrega_pk PRIMARY KEY (id_entrega, id_pedido),
    CONSTRAINT entrega_pedido_fk FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    CONSTRAINT status_entrega_ck CHECK (status_entrega in ('EM PROCESSAMENTO', 'AGUARDANDO COLETA', 'EM TRANSITO', 'ENTREGUE'))
);

CREATE TABLE telefone_entrega (
	id_entrega NUMBER,
	telefone CHAR(11),
	CONSTRAINT telefone_entrega_pk PRIMARY KEY (id_entrega, telefone),
	CONSTRAINT telefone_entrega_pedido_fk FOREIGN KEY (id_entrega) REFERENCES entrega (id_entrega),
	CONSTRAINT telefone_entrega_ck CHECK (REGEXP_LIKE(telefone, '^[1-9]{2}(?:[2-8]|9[1-9])[0-9]{7}$'))
);

CREATE TABLE endereco_entrega (
    id_entrega NUMBER,
    CEP NUMBER,
    logradouro VARCHAR2(1000),
    bairro VARCHAR2(255),
    cidade VARCHAR2(255),
    UF CHAR(2),
    numero NUMBER,
    CONSTRAINT endereco_entrega_pk PRIMARY KEY (CEP, id_entrega),
    CONSTRAINT endereco_entrega_fk FOREIGN KEY (id_entrega) REFERENCES entrega (id_entrega),
    CONSTRAINT cep_entrega_ck CHECK (REGEXP_LIKE(CEP, '^[0-9]{8}$'))
);

CREATE SEQUENCE avaliacao_produto_seq 
    MINVALUE 1 
    INCREMENT BY 1;

CREATE SEQUENCE pedido_seq 
    MINVALUE 1 
    INCREMENT BY 1;

CREATE SEQUENCE entrega_seq 
    MINVALUE 1 
    INCREMENT BY 1;

CREATE SEQUENCE pagamento_seq 
    MINVALUE 1 
    INCREMENT BY 1;