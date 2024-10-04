INSERT INTO tfinal.cidade 
    (nmcidade, uf)
VALUES
    ('Nova Friburgo', 'RJ'),
    ('Petrópolis', 'RJ'),
    ('Teresópolis', 'RJ'),
    ('Rio de Janeiro', 'RJ'),
    ('São Paulo', 'SP');
select * from tfinal.cidade;

INSERT INTO tfinal.bairro 
    (nmbairro)
VALUES
    ('Centro'),
    ('Quitandinha'),
    ('Alto'),
    ('Barra da Tijuca'),
    ('Morumbi');
select * from tfinal.bairro;

INSERT INTO tfinal.endereco
    (idbairro, idcidade, cep)
VALUES
    (1, 1, '28611-070'),
    (2, 2, '25651-030'),
    (3, 3, '25963-370'),
    (4, 4, '22775-003'),
    (5, 5, '05658-000');
select * from tfinal.endereco;	

INSERT INTO tfinal.clientes_endereco
    (idendereco, idcliente, complemento, numero)
VALUES
    (1, 6, 'Casa 2', '196'),
    (2, 7, 'Casa 3 - Bloco 2', '141'),
    (3, 8, 'sem complemento', '330'),
    (4, 9, 'bloco 3 - apartamento 505', '227'),
    (5, 10, 'sem complemento', '22');
select * from tfinal.endereco;	
select * from tfinal.cliente;

INSERT INTO tfinal.categoria 
    (nome, descricao)
VALUES
    ('Eletrônicos', 'Produtos eletrônicos em geral'),
    ('Roupas', 'Vestuário e acessórios'),
    ('Móveis', 'Móveis e acessórios para casa'),
    ('Livros', 'Livros e materiais de leitura'),
    ('Alimentos', 'Alimentos e bebidas');
select * from tfinal.categoria;
	

INSERT INTO tfinal.produto 
    (idcategoria, qtestoque, dt_fabricacao, descricao, valor_unitario)
VALUES
    (1, 100, '2023-08-01', 'Smartphone com tela de 6.5 polegadas, 128GB de armazenamento e câmera de 12MP', 1500.00),
    (2, 200, '2024-01-15', 'Camisa Polo de algodão', 80.00),
    (3, 50, '2023-05-20', 'Cadeira ergonômica para gamers', 750.00),
    (4, 300, '2022-10-10', 'Manual completo de SQL', 120.00),
    (5, 500, '2023-07-07', 'Barra de chocolate ao leite', 5.00);
select * from tfinal.produto;


INSERT INTO tfinal.usuario_funcionario
    (nome, senha)
VALUES
    ('Carla','0000'),
    ('Luiza','1111'),
    ('Mariana','2222'),
    ('Noah','3333'),
    ('Victor','4444');
--ALTER TABLE tfinal.usuario_funcionario ADD nome VARCHAR(255) NOT NULL;
select * from tfinal.usuario_funcionario;

INSERT INTO tfinal.funcionario 
    (idusuario_funcionario, nome, cpf)
VALUES
    (1, 'Carla Alana Brenda de Paula', '31667375105'),
    (2, 'Luiza Elisa Fogaça', '00107857286'),
    (3, 'Mariana Lara Dias', '20641278608'),
    (4, 'Noah José Diogo Sales', '87097561408'),
    (5, 'Victor Mário Miguel Rodrigues', '85697115814');
select * from tfinal.funcionario;


INSERT INTO tfinal.usuario_cliente	
    (nome, senha)
VALUES
    ('Larissa','5555'),
    ('Nelson','6666'),
    ('Antonio','7777'),
    ('Mariana','8888'),
    ('Emilly','9999');
--ALTER TABLE tfinal.usuario_cliente ADD nome VARCHAR(255) NOT NULL;
select * from tfinal.usuario_cliente;	

INSERT INTO tfinal.cliente;
    (idusuario_cliente, nome, cpf, email, dt_nascimento, sexo)
VALUES
    (1, 'Larissa Sabrina Galvão', '05091143262', 'larissa_galvao@br.flextronics.com', '1996-02-10', 'F'),
    (2, 'Nelson Gustavo Isaac Moura', '85389113500', 'nelsongustavomoura@atrix.com.br', '1998-02-06', 'M'),
    (3, 'Antonio Lucca Carvalho', '49420751309', 'antonio_carvalho@patrilarm.com.br', '1999-02-19', 'M'),
    (4, 'Mariana Fabiana Souza', '80390725650', 'marianafabianasouza@6am.com.br', '1995-07-17', 'F'),
    (5, 'Emilly Valentina Martins', '68630486554', 'emillyvalentina@gmail.com.br', '2001-07-16', 'F');
select * from tfinal.cliente;


INSERT INTO tfinal.pedido 
    (numero, valor_total, idcliente, data_pedido)
VALUES
    ('001', 1580.00, 6, '2024-08-10'),
    ('002', 240.00, 7, '2024-08-15'),
    ('003', 870.00, 8, '2024-08-20');
select * from tfinal.pedido;
select * from tfinal.cliente;

INSERT INTO tfinal.pedido_itens 
    (idpedido, idproduto, quantidade)
VALUES
    (4, 1, 1),
    (4, 5, 10),
    (5, 2, 3),
    (6, 3, 1),
    (6, 4, 1);
select * from tfinal.pedido_itens;


INSERT INTO tfinal.nota_fiscal 
    (idpedido, obs, valor_total, data_nota)
VALUES
    (4, 'Nota Fiscal referente ao pedido 001', 1580.00, '2024-08-11'),
    (5, 'Nota Fiscal referente ao pedido 002', 240.00, '2024-08-16'),
    (6, 'Nota Fiscal referente ao pedido 003', 870.00, '2024-08-21');
select * from tfinal.nota_fiscal;


SELECT c.nome nome_cliente, cid.nmcidade cidade_residencia
FROM tfinal.cliente c
JOIN tfinal.clientes_endereco ce ON c.idcliente = ce.idcliente
JOIN tfinal.endereco e ON e.idendereco = ce.idendereco
JOIN tfinal.cidade cid ON cid.idcidade = e.idcidade;


select 
c.nome nome_dos_clientes, cid.nmcidade
from tfinal.cliente c
join tfinal.clientes_endereco ce on c.idcliente = ce.idcliente
join tfinal.endereco e on ce.idendereco = e.idendereco
join tfinal.cidade cid on e.idcidade = cid.idcidade;





SELECT cid.nmcidade, COUNT(c.idcliente) numero_de_clientes
FROM tfinal.cliente c
JOIN tfinal.clientes_endereco ce ON c.idcliente = ce.idcliente
JOIN tfinal.endereco e ON ce.idendereco = e.idendereco
JOIN tfinal.cidade cid ON e.idcidade = cid.idcidade
GROUP BY cid.nmcidade;
