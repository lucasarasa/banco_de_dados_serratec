insert into aula1.bairro
	(nmbairro)
values
	('Centro'),
	('Várzea'),
	('Jardim Europa'),
	('Quintandinha'),
	('Barra'),
	('Alto');
--select nmbairro from aula1.bairro;
insert into aula1.cidade
	(nmcidade)
values
	('Teresópolis'),
	('Petrópolis'),
	('Nova Friburgo'),
	('Rio de Janeiro');
select * from aula1.cidade order by idcidade;
--delete from aula1.cidade where idcidade > 4;
--update aula1.cidade set uf = 'RJ';
insert into aula1.cidade
	(nmcidade, uf)
values
	('São Paulo', 'SP'),
	('Ilhéus', 'BA');
--update aula1.cidade set uf = 'BA' where nmcidade = 'Ilhéus';
--update aula1.cidade set uf = 'SP' where nmcidade = 'São Paulo';
-------------------------------------------------------------------------
insert into aula1.cliente
	(nome, cpf, email, dt_nascimento, sexo)
values
	('Ricardo Oliveira', '08369535763', 'ricardodsn@hotmail.com', '1976-01-23', 'M'),
	('Renato Oliveira', '12345678901', 'renato12@hotmail.com', '1977-03-06', 'M'),
	('Rita de Cassia', '52147895143', 'rita@email.com', '1965-05-06', 'F');
select * from aula1.cliente;

insert into aula1.empresa
	(razao_social, nm_fantasia, cnpj, email) 
values
	('Empresa Leva-leva', 'Levou Pagou', '12345678000195', 'levaleva@email.com.br');
select * from aula1.empresa;
-------------------------------------------------------------------------
insert into aula1.clientes_endereco
	(idcliente, numero_endereco, complemento_end)
values
	(1, '300', 'Apto 105');
select * from aula1.endereco
select * from aula1.clientes_endereco;
insert into aula1.endereco
	(cep, endereco, idbairro, idcidade)
values
	('25963370', 'Rua Pr.José Virgílio de Miranda', 3, 1),
	('12345789', 'Rua Delfim Moreira', 1, 1),
	('15963574', 'Rua Alecrim', 4, 2),
	('78945612', 'Avenida Almirante', 2, 4);
select * from aula1.endereco;
-------------------------------------------------------------------------
insert into aula1.marca
	(nome)
values
	('Adidas'), ('Nike'), ('Olimpikus'), ('Redley'), ('Company'), ('Rip Curl')
select * from aula1.marca;
-------------------------------------------------------------------------
select * from aula1.bairro where nmbairro = 'Jardim Europa'
update aula1.clientes_endereco set idendereco = 
	(select idendereco from aula1.endereco where endereco like 'Rua Pr.%')
	where idcliente = 1;
	
insert into aula1.clientes_endereco
	(idendereco, idcliente, numero_endereco, complemento_end)
values
	(2, 2, '100', ''),
	(3, 3, '423', 'Viela 510');
insert into aula1.produto
	(descricao, custo, preco, qtestoque, idmarca, imposto)
values
	('Calça', 50.99, 269.9, 20, 1, 20),
	('Camisa', 19.70, 89.9, 40, 2, 20),
	('Meia', 5.89, 24.89, 100, 3, 15),
	('Casaco', 120, 359.75, 9, 4, 17);
-------------------------------------------------------------------------
insert into aula1.pedido
	(numero, idendereco, idcliente, idempresa)
values
	('00001', 
	(select idendereco from aula1.clientes_endereco where idcliente = 1),
	1, 1);
select * from aula1.pedido;
-------------------------------------------------------------------------
insert into aula1.pedido_itens
	(idpedido, idproduto, quantidade, valor_unitario, desconto, valor_total)
values
	((select idpedido from aula1.pedido where numero = '00001'),
	1, 3,
	(select preco from aula1.produto where idproduto = 1),
	10,
	((select preco from aula1.produto where idproduto = 1) * 0.9) * 3),
	-------------------------------------------------------------------
	((select idpedido from aula1.pedido where numero = '00001'),
	2, 5,
	(select preco from aula1.produto where idproduto = 2),
	10,
	((select preco from aula1.produto where idproduto = 2) * 0.9) * 5),
	-------------------------------------------------------------------
	((select idpedido from aula1.pedido where numero = '00001'),
	3, 2,
	(select preco from aula1.produto where idproduto = 3),
	10,
	((select preco from aula1.produto where idproduto = 3) * 0.9) * 2);
select * from aula1.pedido_itens;