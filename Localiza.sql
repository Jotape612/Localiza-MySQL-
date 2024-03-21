create database localiza;
use localiza;

create table cliente (
cli_id INT AUTO_INCREMENT PRIMARY KEY,
cli_nome varchar(100),
cli_cpf varchar(15),
cli_endereço varchar (100),
cli_telefone varchar(20),
cli_nasc date,
cli_compras int
);

create table automovel (
auto_id int auto_increment primary key,
auto_fk_marca int,
auto_fk_categoria int,
auto_placa varchar(100),
auto_estado varchar (50),
auto_preco float
);



create table funcionario (
func_id int auto_increment primary key,
func_nome varchar(100),
func_cpf varchar(20),
func_nasc date,
func_vendas int
);


create table marca (
marca_id int auto_increment primary key,
marca_nome varchar (50),
marca_total int
);



create table modelo (
modelo_id int primary key auto_increment,
modelo_nome varchar(100),
modelo_ano varchar(100),
modelo_cor varchar(100),
modelo_fk_automovel int,
modelo_fk_cambio int
);



create table cambio (
cambio_id int auto_increment primary key,
cambio_tipo varchar (100)
);


-- ordem e serviço
create table aluguel (
alu_id INT AUTO_INCREMENT PRIMARY KEY,
alu_fk_cli int,
alu_fk_vendedor int,
alu_data_retirada date,
alu_data_entrega date,
alu_total float,
alu_fpag int
);


create table aluguel_veiculo (
alu_veic_id int auto_increment primary key,
alu_veic_fk_aluguel int,
alu_veic_fk_automovel int,
alu_veic_km varchar(50)
);



create table venda (
ven_id INT AUTO_INCREMENT PRIMARY KEY,
ven_fk_cli int,
ven_fk_vendedor int,
ven_data_retirada date,
ven_total float,
ven_fpag int
);


-- itens ordem e serviço
create table venda_veiculo (
ven_veic_id int auto_increment primary key,
ven_veic_fk_venda int,
ven_veic_fk_automovel int,
ven_veic_km varchar (50)
);


create table forma_pagamento 
(
fpag_id INT AUTO_INCREMENT PRIMARY KEY,
fpag_nome varchar(50)
);

create table categoria
(
cat_id int auto_increment primary key,
cat_tipo varchar (50)
);

-- fk e pk

alter table automovel add foreign key (auto_fk_categoria) references categoria(cat_id);
alter table  automovel  add foreign key (auto_fk_marca) references marca(marca_id);

alter table  modelo  add foreign key (modelo_fk_automovel) references automovel (auto_id);
alter table modelo add foreign key (modelo_fk_cambio) references cambio (cambio_id);

alter table  aluguel  add foreign key (alu_fk_cli) references cliente (cli_id);
alter table  aluguel  add foreign key (alu_fk_vendedor) references funcionario (func_id);

alter table  aluguel_veiculo  add foreign key (alu_veic_fk_aluguel) references aluguel (alu_id);
alter table  aluguel_veiculo  add foreign key (alu_veic_fk_automovel) references automovel (auto_id);

alter table  venda  add foreign key (ven_fk_cli) references cliente (cli_id);
alter table  venda  add foreign key (ven_fk_vendedor) references funcionario (func_id);

alter table  venda_veiculo  add foreign key (ven_veic_fk_venda) references venda (ven_id);
alter table  venda_veiculo  add foreign key (ven_veic_fk_automovel) references automovel (auto_id);


-- insert


insert cliente (cli_nome, cli_cpf,cli_endereço,cli_telefone,cli_nasc)
values ('Neimay', '078.615.314-00', 'Rua Venus, 727', '98765-4321', '1990-11-20');
insert cliente (cli_nome, cli_cpf,cli_endereço,cli_telefone,cli_nasc)
values ('Madona', '312.714.935-44', 'Caseb, 1555', '98810-3301', '1995-09-17');
insert cliente (cli_nome, cli_cpf,cli_endereço,cli_telefone,cli_nasc)
values ('Pacato', '777.666.935-44', 'Gabriela, 04A', '99110-1010', '2000-07-12');

insert into marca (marca_nome, marca_total)values ('Volkswagen', '0');
insert into marca (marca_nome, marca_total)values ('Mitsubishi', '0');
insert into marca (marca_nome, marca_total)values ('Hyundai', '0');
insert into marca (marca_nome, marca_total)values ('Ford', '0');
insert into marca (marca_nome, marca_total)values ('Peugeot', '0');
insert into marca (marca_nome, marca_total)values ('Chevrolet', '0');
insert into marca (marca_nome, marca_total)values ('Honda', '0');
insert into marca (marca_nome, marca_total)values ('Fiat', '0');

insert into cambio (cambio_tipo)
values ('Manual');
insert into cambio (cambio_tipo)
values ('Automatico');
insert into cambio (cambio_tipo)
values ('Automatizado');
insert into cambio (cambio_tipo)
values ('CVT');

insert into funcionario (func_nome, func_cpf, func_nasc)
values ('Alberto', '12345678900', '1990-04-27');
insert into funcionario (func_nome, func_cpf, func_nasc)
values ('Umberto', '34578912300', '2000-08-23');
insert into funcionario (func_nome, func_cpf, func_nasc)
values ('Doisberto', '78912345611', '2010-12-17');

insert into forma_pagamento (fpag_nome)
values ('Credito');
insert into forma_pagamento (fpag_nome)
values ('Debito');
insert into forma_pagamento (fpag_nome)
values ('Pix');
insert into forma_pagamento (fpag_nome)
values ('Cheque');
insert into forma_pagamento (fpag_nome)
values ('Outros');

insert into categoria (cat_tipo)
values ('SUV');
insert into categoria (cat_tipo)
values ('4x4');
insert into categoria (cat_tipo)
values ('Sedan');

insert automovel(auto_fk_marca, auto_placa, auto_fk_categoria, auto_estado, auto_preco)
values (3, 'OKS-7742', 1, 'Disponivel', '60000' );
insert automovel(auto_fk_marca, auto_placa, auto_fk_categoria, auto_estado, auto_preco)
values (3, 'ABS-4747', 1,  'Disponivel', '95000');
insert automovel(auto_fk_marca, auto_placa, auto_fk_categoria, auto_estado, auto_preco)
values (4, 'CH4-D314', 2, 'Disponivel', '144000');
insert automovel(auto_fk_marca, auto_placa, auto_fk_categoria, auto_estado, auto_preco)
values (6, 'B4C-A3B4', 3, 'Nao_Disponivel', '90000' );



insert into modelo (modelo_nome, modelo_ano, modelo_cor, modelo_fk_automovel, modelo_fk_cambio)
values ('Creta', '2016', 'Branco', 1, 2);
insert into modelo (modelo_nome, modelo_ano, modelo_cor, modelo_fk_automovel, modelo_fk_cambio)
values ('Creta', '2018', 'Preto', 2, 2);
insert into modelo (modelo_nome, modelo_ano, modelo_cor, modelo_fk_automovel, modelo_fk_cambio)
values ('Ranger', '2017', 'Preto', 3, 1);
insert into modelo (modelo_nome, modelo_ano, modelo_cor, modelo_fk_automovel, modelo_fk_cambio)
values ('Onix Plus', '2021', 'Prata', 4, 1);




insert into venda (ven_fk_cli,ven_fk_vendedor,ven_data_retirada,ven_fpag)
values (1, 1, '2024-03-27', 1);

insert into venda_veiculo (ven_veic_fk_venda, ven_veic_fk_automovel, ven_veic_km)
values (1, 4, '50km');


insert into aluguel(alu_fk_cli, alu_fk_vendedor, alu_data_retirada, alu_data_entrega , alu_fpag)
values (2, 2, '2024-04-01', '2024-06-01', 2);
insert into aluguel(alu_fk_cli, alu_fk_vendedor, alu_data_retirada, alu_data_entrega, alu_fpag)
values (2, 2, '2024-03-14', '2024-04-14', 3);
insert into aluguel(alu_fk_cli, alu_fk_vendedor, alu_data_retirada, alu_data_entrega, alu_fpag)
values (2, 2, '2024-03-14', '2024-06-24', 3);


insert into aluguel_veiculo (alu_veic_fk_aluguel,alu_veic_fk_automovel,alu_veic_km)
values (1, 1, '25');
insert into aluguel_veiculo (alu_veic_fk_aluguel,alu_veic_fk_automovel,alu_veic_km)
values (2, 2, '15' );
insert into aluguel_veiculo (alu_veic_fk_aluguel,alu_veic_fk_automovel,alu_veic_km)
values (3, 3, '05');

-- FUNÇÕES --


DELIMITER //
CREATE function fn_get_estado (cod_parametro int)  returns varchar(100)

BEGIN
declare var_status varchar(100);

select auto_estado into var_status from automovel
where auto_id = cod_parametro;
return var_status;
END//

DELIMITER ;

select fn_get_estado (1) as Estato; 


-- DESAFIO 1

select auto_estado
from automovel;

-- DESAFIO 2
update marca
set marca_total = '2'
where marca_id = 3;

update marca
set marca_total = '1'
where marca_id = 4;

update marca
set marca_total = '1'
where marca_id = 6;


select count(marca_nome)  
from marca
group by marca_total;


-- DESAFIO 3
select avg(alu_veic_valor)  
from aluguel_veiculo;

-- DESAFIO 4
select max(alu_veic_valor) 
from aluguel_veiculo;

-- DESAFIO 5	
select ven_id, sum(ven_veic_valor) as ven_total
from venda
where ven_data_retirada between '2024-01-01' and '2024-07-25';

 -- DESAFIO 6
 
select sum(ven_total) from venda
inner join venda_veiculo on (ven_veic_fk_venda = ven_id)
inner join automovel on (auto_id = ven_veic_fk_automovel)
where ven_total  and ven_data_retirada between '2024-01-01' and '2024-07-25';
 
 -- DESAFIO 7
 
SELECT func_id, func_nome, COUNT(*) AS alu_veic_valor
FROM aluguel_veiculo
JOIN funcionario ON func_id = func_id
WHERE MONTH(alu_data_retirada) = MONTH(CURRENT_DATE()) AND YEAR(alu_data_retirada) = YEAR(CURRENT_DATE())
GROUP BY func_id, func_nome;
 
 -- DESAFIO 8
 
SELECT cli_id, cli_nome, COUNT(*) AS alu_fk_cli
FROM aluguel_veiculo
JOIN cliente ON cli_id = cli_id
GROUP BY func_id, func_nome;
 
 -- DESAFIO 9
 
select sum(alu_total and ven_total)  from venda, aluguel
inner join venda_veiculo on (ven_veic_fk_venda = ven_id)
inner join automovel on (auto_id = ven_veic_fk_automovel)
where auto_fk_categoria = 1;
