--create database serratec;
--create schema aula1;

create table aula1.cliente (
	idcliente serial primary key,
	nome varchar (100) not null,
	cpf varchar (11) not null,
	email varchar (180),
	dt_nascimento date,
	sexo varchar(1)
);

create table aula1.bairro(
 	idbairro serial primary key,
	nmbairro varchar (120)
);

create table aula1.cidade(
	idcidade serial primary key,
	nmbairro varchar (120),
	uf varchar(2)
);
--alter table aula1.cidade add column uf varchar(2);
--drop table aula1.cidade;
create table aula1.endereco (
	idendereco serial primary key,
	cep varchar (8),
	endereco varchar(200),
	idbairro int references aula1.bairro(idbairro),
	idcidade int references aula1.cidade(idcidade)
);

create table aula1.marca(
	idmarca serial primary key,
	nome varchar (60)
);
create table aula1.empresa (
	idempresa serial primary key,
	razao_social varchar (120),
	nm_fantasia varchar(100),
	cnpj varchar (14),
	idendereco int references aula1.endereco(idendereco),
	email varchar(120)
);

create table aula1.telefone (
	idtelefone serial primary key,
	numero varchar (15),
	tipo_tel varchar(1),
	idcliente int references aula1.cliente(idcliente),
	idempresa int references aula1.empresa(idempresa)
);


create table aula1.clientes_endereco (
	idcli_end serial primary key,
	idendereco int references aula1.endereco(idendereco),
	idcliente int references aula1.cliente(idcliente),
	numero_endereco varchar(10),
	complemento_end varchar(30)
);

create table aula1.produto (
	idproduto serial primary key,
	descricao varchar (200),
	custo double precision,
	preco double precision,
	qtestoque int,
	idmarca int references aula1.marca(idmarca),
	imposto double precision
);
--ALTER TABLE nome_da_tabela RENAME COLUMN nome_antigo TO nome_novo;
create table aula1.pedido (
	idpedido serial primary key,
	numero varchar (10),
	valor_total double precision,
	valor_frete double precision,
	desconto_total double precision,
	acrescimo_total double precision,
	idendereco int references aula1.endereco(idendereco),
	idcliente int references aula1.cliente(idcliente),
	idempresa int references aula1.empresa(idempresa)
);

create table aula1.pedido_itens (
	idpeditem serial primary key,
	idpedido int references aula1.pedido(idpedido),
	idproduto int references aula1.produto(idproduto),
	quantidade int,
	valor_unitario double precision,
	desconto double precision,
	acrescimo double precision,
	valor_total double precision,
	frete double precision
);

--drop schema aula1 cascade;