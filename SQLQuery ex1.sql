--------------------------------------------------------------------------
CREATE DATABASE ex1
GO
USE ex1
--------------------------------------------------------------------------

CREATE TABLE paciente (
num_beneficiario		INT					NOT NULL,
nome					VARCHAR(100)		NOT NULL,
logradouro				VARCHAR(200)		NOT NULL,
numero					INT					NOT NULL,
cep						CHAR(8)				not null,
complemento				varchar(255)		not null,
telefone				varchar(11)			not null

primary key (num_beneficiario)
)

CREATE TABLE medico (
codigo					int					not null,
nome					varchar(100)		not null,
logradouro				varchar(200)		not null,
numero					int					not null,
cep						char(8)				not null,
complemento				varchar(255)		not null,
contato					varchar(11)			not null,
especialidadeId			int					not null

primary key (codigo)
foreign key (especialidadeId) references especialidade(id)
)

CREATE TABLE especialidade (
id						int					not null,
descricao			varchar(100)		not null

primary key (id)
)

create table consulta (
pacienteNum_beneficiario			int				not null,
medicoCodigo						int				not null,
data_hora							datetime		not null,
observacao							varchar(255)	not null

primary key (pacienteNum_beneficiario, medicoCodigo, data_hora)
foreign key (pacienteNum_beneficiario) references paciente(num_beneficiario),
foreign key (medicoCodigo) references medico(codigo)
)
----------------------------------------------
INSERT INTO paciente VALUES
(99901, 'Washington Silva', 'R. Anhaia', 150, 02345000, 'Casa', '922229999'),
(99902, 'Luis Ricardo', 'R. Voluntários da Pátria', 2251, 03254010, 'Bloco B. Apto 25', '923450987'),
(99903, 'Maria Elisa', 'Av. Aguia de Haia', 1188, 06987020, 'Apto 1208', '912348765'),
(99904, 'José Araujo', 'R. XV de Novembro', 18, 03678000, 'Casa', '945674312'),
(99905, 'Joaoa Paula', 'R. 7 de Abril', 97, 01214000, 'Conjunto 3 - Apto 801', '912095674')

insert into especialidade values
(1, 'Otorrinolaringologista'),
(2, 'Urologista'),
(3, 'Geriatra'),
(4, 'Pediatra')

insert into medico values
(100001, 'Ana Paula', 'R. 7 de Setembro', 256, 03698000, 'Casa', '915689456', 1),
(100002, 'Maria Aparecida', 'Av. Brasil', 32, 02145070, 'Casa', '923235454', 1),
(100003, 'Lucas Borges', 'Av. do Estado', 3210, 05241000, 'Apto 205', '963698585', 2),
(100004, 'Gabriel Oliveira', 'Av. Dom Helder Camara', 350, 03145000, 'Apto 602', '932458745', 3)

insert into consulta values
(99901, 100002, '2021/09/04 13:20', 'Infecção Urina'),
(99902, 100003, '2021/09/04 13:15', 'Gripe'),
(99901, 100001, '2021/09/04 12:30', 'Infecção Garganta')

alter table medico
add dia_atendimento		varchar(15)		null

update medico
set dia_atendimento = 'segunda-feira'
where codigo = 100001
update medico
set dia_atendimento = 'quarta-feira'
where codigo = 100002
update medico
set dia_atendimento = 'segunda-feira'
where codigo = 100003
update medico
set dia_atendimento = 'quinta-feira'
where codigo = 100004

delete especialidade
where id = 4

EXEC sp_rename 'dbo.medico.dia_atendimento' , 'dia_semana_atendimento', 'COLUMN'

update medico
set logradouro = 'Av. Bras Leme'
where codigo = 100003
update medico
set numero = 876
where codigo = 100003
update medico
set cep = 02122000
where codigo = 100003
update medico
set complemento = 'Apto 504'
where codigo = 100003

alter table consulta
alter column observacao varchar(200) not null
-----------------------------------------------
select * from paciente
select * from medico
select * from consulta
select * from especialidade


