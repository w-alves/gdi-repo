ALTER SESSION SET current_schema = G212IF685_EQ07;

DROP SEQUENCE PEDIDO_SEQUENCE;
DROP SEQUENCE ENTREGA_SEQUENCE;
DROP SEQUENCE PAGAMENTO_SEQUENCE;

CREATE SEQUENCE PEDIDO_SEQUENCE;
CREATE SEQUENCE ENTREGA_SEQUENCE;
CREATE SEQUENCE PAGAMENTO_SEQUENCE;

/* CHECKLIST

18. SELECT REF ✅
17. INSERT INTO ✅
19. VALUE ⌛ https://bit.ly/39tqmId

*/

ALTER SESSION SET current_schema = G212IF685_EQ07;


INSERT INTO tb_endereco  VALUES (tp_endereco ('91927550', 'Rua dos Bêbados', 'Nova Recife', 'Recife', 'PE', 13, -1)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('30457550', 'Avenida Capibaribe', 'Cohab', 'Belo Horizonte', 'RS', 113, 8)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('38904191', 'Rua Tancredo Neves', 'Michel Teló', 'Palmas', 'TO', 47, 888));
INSERT INTO tb_endereco  VALUES (tp_endereco ('34972973', 'Rua Ulysses Guimarães', 'Marilia Mendonça', 'Belém', 'PA', 62, 107)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('10298310', 'Rua Getúlio Vargas', 'Nova Silmaria', 'Fortaleza', 'CE', 98, 103)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('65161521', 'Rua JK', 'Piranhas', 'Niterói', 'RJ', 101, -1)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('14929445', 'Rua Dom João VI', 'Pousada Nova', 'Jaboatão', 'PE', 43, -1)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('19515624', 'Rua da Moeda', 'Vila Aparecida', 'Maceió', 'AL', 12, 580)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('13464792', 'Rua Alfonso Olindense', 'Arara', 'Belo Horizonte', 'MG', 54, 489)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('18927319', 'Rua Marechal Deodoro da Fonseca', 'São Mineiro', 'Porto Alegre', 'RS', 88, -1)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('18927391', 'Rua Lampião', 'Santos', 'Camaragibe', 'PE', 96, 93)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('36982173', 'Rua do Lula', 'Libertadores da América', 'Cuiabá', 'MT', 49, 482)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('21129711', 'Rua do Leblon', 'America Mineiro', 'Campo Grande', 'MS', 213, -1)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('39847921', 'Rua do Futebol', 'Nova Hamburgo', 'Goiânia', 'GO', 158, -1)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('18271829', 'Avenida Amarildo ', 'São José', 'Brasília', 'DF', 145, 777)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('18273123', 'Avenida José Sarney', 'Sentimentos', 'Brasília', 'DF', 247, 884)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('18927112', 'Avenida José Bonifacio', 'Boa Viagem', 'Curitiba', 'PR', 124, 223)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('17923691', 'Rua Américo Miranda', 'Jampa', 'Caruaru', 'PE', 24, 48)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('12891731', 'Rua dos Imigrantes', 'Moiseis', 'Salvador', 'BA', 324, -1)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('19038102', 'Rua Cristiano Ronaldo', 'Fluminense', 'Itabaiana', 'PB', 425, 842)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('10928312', 'Rua Messi', 'São Pedro', 'Vitória', 'ES', 114, 111)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('29017312', 'Rua Neymar Jr', 'Cohab II', 'Ouro Preto', 'MG', 98, 98)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('18723182', 'Rua Centímetro Quadrado', 'Mundial do Palmeiras', 'São Paulo', 'SP', 896, 21)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('21893611', 'Rua Gigante', 'Foz do Iguaçu', 'Rio de Janeiro', 'RJ', 78, 152)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('21092331', 'Avenida Caxangá', 'Guanabara', 'Rio de Janeiro', 'SP', 354, 1805));
INSERT INTO tb_endereco  VALUES (tp_endereco ('23961267', 'Avenida Coxinha', 'Nova São Paulo', 'João Pessoa', 'PB', 554, 48));
INSERT INTO tb_endereco  VALUES (tp_endereco ('12837192', 'Rua dos Gatos', 'Várzea', 'Rondonópolis', 'MT', 668, -1)); 
INSERT INTO tb_endereco  VALUES (tp_endereco ('47582303', 'Rua dos Apaixonados', 'Cohab', 'Formosa', 'GO', 784, 8));




INSERT INTO tb_cliente_pf VALUES (
    tp_cliente_pf((SELECT REF (E) FROM tb_endereco E WHERE CEP = '91927550'), 
                v_telefone(tp_telefone ('901930039', '81'), tp_telefone ('945596601', '81')),  
                'was4@cin.ufpe.br', '14437929418', 'Wes', TIMESTAMP '2022-03-29 14:32:14', 'M'));
INSERT INTO tb_cliente_pf VALUES (
    tp_cliente_pf((SELECT REF (E) FROM tb_endereco E WHERE CEP = '30457550'), 
                v_telefone(tp_telefone ('904830039', '81'), tp_telefone ('945336601', '81')),  
                'ewqewqe@cin.ufpe.br', '1355929418', 'Otavio', TIMESTAMP '1990-08-29 14:32:14', 'M'));
INSERT INTO tb_cliente_pf VALUES (
    tp_cliente_pf((SELECT REF (E) FROM tb_endereco E WHERE CEP = '38904191'), 
                v_telefone(tp_telefone ('994530039', '81'), tp_telefone ('945596128', '81')),  
                'weqes@cin.ufpe.br', '02237929418', 'Yudi', TIMESTAMP '1995-05-06 14:32:14', 'M'));
INSERT INTO tb_cliente_pf VALUES (
    tp_cliente_pf((SELECT REF (E) FROM tb_endereco E WHERE CEP = '34972973'), 
                v_telefone(tp_telefone ('901932229', '81'), tp_telefone ('948946601', '81')),  
                'ewqef@cin.ufpe.br', '14437929444', 'Thyere', TIMESTAMP '1992-05-01 14:32:14', 'M'));
INSERT INTO tb_cliente_pf VALUES (
    tp_cliente_pf((SELECT REF (E) FROM tb_endereco E WHERE CEP = '14929445'), 
                v_telefone(tp_telefone ('982972579', '81'), tp_telefone ('912345601', '81')),  
                'frewr@cin.ufpe.br', '00033344499', 'Dal Pozzo', TIMESTAMP '1998-08-23 14:32:14', 'M'));
INSERT INTO tb_cliente_pf VALUES (
    tp_cliente_pf((SELECT REF (E) FROM tb_endereco E WHERE CEP = '23961267'), 
                v_telefone(tp_telefone ('482849829', '81'), tp_telefone ('400024822', '81')),  
                'tretre@cin.ufpe.br', '87878787784', 'Joana', TIMESTAMP '2002-03-29 14:32:14', 'F'));
                
INSERT INTO tb_cliente_pj  VALUES (
        tp_cliente_pj((SELECT REF (E) FROM tb_endereco E WHERE CEP = '47582303'), 
                v_telefone(tp_telefone ('901930039', '81'), tp_telefone ('945596601', '81')),  
                'rfrsh@cin.ufpe.br', '00037929418123', 'Refresh LTDA', 'Refresh Design', 'ATIVO', 50092.2,'GRANDE'));
INSERT INTO tb_cliente_pj  VALUES (
        tp_cliente_pj((SELECT REF (E) FROM tb_endereco E WHERE CEP = '18927112'), 
                v_telefone(tp_telefone ('901930039', '81'), tp_telefone ('945596601', '81')),  
                'scfc@cin.ufpe.br', '00027924448999', 'Santa Cruz LTDA', 'Santa Cruz', 'ATIVO', 4892.2,'PEQUENA'));
INSERT INTO tb_cliente_pj  VALUES (
        tp_cliente_pj((SELECT REF (E) FROM tb_endereco E WHERE CEP = '21092331'), 
                v_telefone(tp_telefone ('901930039', '81'), tp_telefone ('945596601', '81')),  
                'maltda@cin.ufpe.br', '00089922433123', 'Maracatu Atomico LTDA', 'Maracatu Atomico', 'ATIVO', 2092.2,'PEQUENA'));
INSERT INTO tb_cliente_pj  VALUES (
        tp_cliente_pj((SELECT REF (E) FROM tb_endereco E WHERE CEP = '10298310'), 
                v_telefone(tp_telefone ('901930039', '81'), tp_telefone ('945596601', '81')),  
                'barca@cin.ufpe.br', '00058929418123', 'Barcelona LTDA', 'Barca', 'ATIVO', 20000,'MEDIA'));
INSERT INTO tb_cliente_pj  VALUES (
        tp_cliente_pj((SELECT REF (E) FROM tb_endereco E WHERE CEP = '65161521'), 
                v_telefone(tp_telefone ('901930039', '81'), tp_telefone ('945596601', '81')),  
                'scr@cin.ufpe.br', '00044229433777', 'Sport Club do Recife', 'Sport', 'SUSPENSO', 182000,'GRANDE'));
                


INSERT INTO tb_pedido VALUES (
    tp_pedido(PEDIDO_SEQUENCE.NEXTVAL, 'FINALIZADO', tp_nt_detalhe_pedido(tp_detalhe_pedido('0000000001', 1)))
);
INSERT INTO tb_pedido VALUES (
    tp_pedido(PEDIDO_SEQUENCE.NEXTVAL, 'FINALIZADO', tp_nt_detalhe_pedido(tp_detalhe_pedido('0000000001', 1), tp_detalhe_pedido('0000000002', 3)))
);
INSERT INTO tb_pedido VALUES (
    tp_pedido(PEDIDO_SEQUENCE.NEXTVAL, 'EM ENTREGA', tp_nt_detalhe_pedido(tp_detalhe_pedido('0000000002', 5), tp_detalhe_pedido('0000000004', 1)))
);
INSERT INTO tb_pedido VALUES (
    tp_pedido(PEDIDO_SEQUENCE.NEXTVAL, 'AGUARDANDO PAGAMENTO', tp_nt_detalhe_pedido(tp_detalhe_pedido('0000000002', 5), tp_detalhe_pedido('0000000008', 8), tp_detalhe_pedido('0000000003', 10), tp_detalhe_pedido('0000000003', 1)))
);
INSERT INTO tb_pedido VALUES (
    tp_pedido(PEDIDO_SEQUENCE.NEXTVAL, 'AGUARDANDO PAGAMENTO', tp_nt_detalhe_pedido(tp_detalhe_pedido('0000000004', 5), tp_detalhe_pedido('0000000001', 1)))
);
INSERT INTO tb_pedido VALUES (
    tp_pedido(PEDIDO_SEQUENCE.NEXTVAL, 'FINALIZADO', tp_nt_detalhe_pedido(tp_detalhe_pedido('0000000006', 5), tp_detalhe_pedido('0000000009', 5), tp_detalhe_pedido('0000000007', 1)))
);



INSERT INTO tb_entrega VALUES (
    tp_entrega(ENTREGA_SEQUENCE.NEXTVAL, 'EM PROCESSAMENTO', NULL, NULL, (SELECT REF (E) FROM tb_endereco E WHERE CEP = '91927550'))
);
INSERT INTO tb_entrega VALUES (
    tp_entrega(ENTREGA_SEQUENCE.NEXTVAL, 'ENTREGUE', TIMESTAMP '2022-01-03 14:32:14', TIMESTAMP '2022-02-08 14:32:14', (SELECT REF (E) FROM tb_endereco E WHERE CEP = '30457550'))
);
INSERT INTO tb_entrega VALUES (
    tp_entrega(ENTREGA_SEQUENCE.NEXTVAL, 'ENTREGUE', TIMESTAMP '2021-10-15 14:32:14', TIMESTAMP '2021-10-30 14:32:14', (SELECT REF (E) FROM tb_endereco E WHERE CEP = '38904191'))
);
INSERT INTO tb_entrega VALUES (
    tp_entrega(ENTREGA_SEQUENCE.NEXTVAL, 'ENTREGUE', TIMESTAMP '2021-12-25 14:32:14', TIMESTAMP '2021-12-28 14:32:14', (SELECT REF (E) FROM tb_endereco E WHERE CEP = '38904191'))
);
INSERT INTO tb_entrega VALUES (
    tp_entrega(ENTREGA_SEQUENCE.NEXTVAL, 'ENTREGUE', TIMESTAMP '2022-01-03 14:32:14', TIMESTAMP '2022-01-05 14:32:14', (SELECT REF (E) FROM tb_endereco E WHERE CEP = '14929445'))
);
INSERT INTO tb_entrega VALUES (
    tp_entrega(ENTREGA_SEQUENCE.NEXTVAL, 'AGUARDANDO COLETA', NULL, NULL, (SELECT REF (E) FROM tb_endereco E WHERE CEP = '10298310'))
);




INSERT INTO tb_produto  VALUES (tp_produto('0000000001', 'Multilaser MO251', 'Mouse com um design anatômico, com um alcance de 10 metros com plug & play e com um super dpi de 1200.', 29.90));
INSERT INTO tb_produto  VALUES (tp_produto('0000000002', 'Multilaser MO300', 'MOUSE OPTICO FULL BLACK, 1200 DPI.', 9.90));
INSERT INTO tb_produto  VALUES (tp_produto('0000000003', 'Mouse Gamer Redragon Cobra', 'Mouse com design inteligente com até 2400DPI e 8 botões programaveis', 114.90));
INSERT INTO tb_produto  VALUES (tp_produto('0000000004', 'Teclado Multilaser Slim com Fio USB Teclas Silenciosas Preto - TC213', 'Teclado preto silencioso e eficiente', 49.90));
INSERT INTO tb_produto  VALUES (tp_produto('0000000005', 'TC195', 'Kit teclado e mouse gamers com teclas hotkeys', 115.90));
INSERT INTO tb_produto  VALUES (tp_produto('0000000006', 'Monitor LG Ultrawide', 'Monitor com tela curva e Full HD.', 1299.99));
INSERT INTO tb_produto  VALUES (tp_produto('0000000007', 'Monitor Hp infinity', 'Monitor com tela antirreflexo e FullHD', 899.90));
INSERT INTO tb_produto  VALUES (tp_produto('0000000008', 'Razer Dracula', 'Mousepad bem espaçado com led', 120.19));
INSERT INTO tb_produto  VALUES (tp_produto('0000000009', 'Teclado gamer infernal viserion', 'Teclado Ótimo para gamers e silencioso', 349.90));
INSERT INTO tb_produto  VALUES (tp_produto('0000000010', 'The Batmouse', 'Mouse do Batman equipado com o cinto de utilidades', 179.90));
INSERT INTO tb_produto  VALUES (tp_produto('0000000011', 'GAMEMAX Gabinete ATX Gamer Infinit TR', 'Gabinete Grande e bem ventilado para seu PC', 500.00));
INSERT INTO tb_produto  VALUES (tp_produto('0000000012', 'Gabinete Mini - ATX/Micro - ATX, Fortrek', 'Gabinete Simples e bonito Para seu PC', 90.50));
INSERT INTO tb_produto  VALUES (tp_produto('0000000013', 'PLACA DE VIDEO ASUS GEFORCE RTX 3080 TI 12GB GDDR6X 384 BITS', 'Placa de video para turbinar o seu PC', 2229.90));
INSERT INTO tb_produto  VALUES (tp_produto('0000000014', 'Placa de Vídeo GALAX - GeForce RTX 3070', 'Placa de video 8GB GDDR6', 29.90));
INSERT INTO tb_produto  VALUES (tp_produto('0000000015', 'Computador Desktop Business', 'Intel Core i3 3.0Ghz / 4Gb DDR3 / HD 500GB / Monitor LED 19 Kit ', 1259.00));



INSERT INTO  tb_pagamento  VALUES (tp_pagamento(PAGAMENTO_SEQUENCE.nextval, 'PAGO', TIMESTAMP '2022-04-01 12:50:00'));
INSERT INTO  tb_pagamento  VALUES (tp_pagamento(PAGAMENTO_SEQUENCE.nextval, 'PAGO', TIMESTAMP '2022-04-01 02:00:00'));
INSERT INTO  tb_pagamento  VALUES (tp_pagamento(PAGAMENTO_SEQUENCE.nextval, 'AGUARDANDO PAGAMENTO', NULL));
INSERT INTO  tb_pagamento  VALUES (tp_pagamento(PAGAMENTO_SEQUENCE.nextval, 'AGUARDANDO PAGAMENTO', NULL));
INSERT INTO  tb_pagamento  VALUES (tp_pagamento(PAGAMENTO_SEQUENCE.nextval, 'PAGO', TIMESTAMP '2022-04-01 12:02:00'));
INSERT INTO  tb_pagamento  VALUES (tp_pagamento(PAGAMENTO_SEQUENCE.nextval, 'PAGO', TIMESTAMP '2022-03-31 08:04:00'));


INSERT INTO tb_compra VALUES (
    (SELECT REF (C) FROM tb_cliente_pf C WHERE CPF = '14437929418'),
    NULL, 
    (SELECT REF (P) FROM tb_pedido P WHERE ID_PEDIDO = 6),
    (SELECT REF (PAG) FROM tb_pagamento PAG WHERE ID_PAGAMENTO = 1),
     TIMESTAMP '2022-04-01 07:42:00',
     30216
);

INSERT INTO tb_compra VALUES (tp_compra(
    (SELECT REF (C) FROM tb_cliente_pf C WHERE CPF = '87878787784'),
    NULL, 
    (SELECT REF (P) FROM tb_pedido P WHERE ID_PEDIDO = 3),
    (SELECT REF (PAG) FROM tb_pagamento PAG WHERE ID_PAGAMENTO = 2),
    TIMESTAMP '2022-04-01 07:42:00',
	537
));

INSERT INTO tb_compra VALUES (
    (SELECT REF (C) FROM tb_cliente_pf C WHERE CPF = '00033344499'),
    NULL,
    (SELECT REF (P) FROM tb_pedido P WHERE ID_PEDIDO = 5),
    (SELECT REF (PAG) FROM tb_pagamento PAG WHERE ID_PAGAMENTO = 3),
     TIMESTAMP '2022-04-01 07:42:00',
     358.8
);
INSERT INTO tb_compra VALUES (
    (SELECT REF (C) FROM tb_cliente_pf C WHERE CPF = '14437929418'),
    NULL,
    (SELECT REF (P) FROM tb_pedido P WHERE ID_PEDIDO = 4),
    (SELECT REF (PAG) FROM tb_pagamento PAG WHERE ID_PAGAMENTO = 4),
     TIMESTAMP '2022-04-01 07:42:00',
     179.4
);
INSERT INTO tb_compra VALUES (
    NULL,
    (SELECT REF (C) FROM tb_cliente_pj C WHERE CNPJ = '00044229433777'),
    (SELECT REF (P) FROM tb_pedido P WHERE ID_PEDIDO = 2),
    (SELECT REF (PAG) FROM tb_pagamento PAG WHERE ID_PAGAMENTO = 5),
     TIMESTAMP '2022-04-01 07:42:00',
     10798.8
);
INSERT INTO tb_compra VALUES (
    NULL,
    (SELECT REF (C) FROM tb_cliente_pj C WHERE CNPJ = '00058929418123'),
    (SELECT REF (P) FROM tb_pedido P WHERE ID_PEDIDO = 1),
    (SELECT REF (PAG) FROM tb_pagamento PAG WHERE ID_PAGAMENTO = 6),
     TIMESTAMP '2022-04-01 07:42:00',
     10978.2
);