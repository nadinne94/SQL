/* 1º PASSO: CRIAR BANCO DE DADOS */

CREATE DATABASE LIVRARIA;

/* 2º PASSO: CONECTAR-SE AO BANCO DE DADOS */

USE LIVRARIA;

/* 3º PASSO: CRIAR UMA TABELA DE LIVROS */

CREATE TABLE LIVROS (
	LIVRO VARCHAR(100),
	AUTOR VARCHAR(100),
	SEXO CHAR (01),
	PAGINAS INT(5),
	EDITORA VARCHAR(50),
	VALOR FLOAT (10,2),
	UF CHAR(2),
	ANO INT(4)
);

/* 4º PASSO: INSERIR OS DADOS */

INSERT INTO LIVROS (LIVRO, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, ANO)
VALUES ('CAVALEIRO REAL', 'ANA CLAUDIA', 'F', 465, 'ATLAS', 49.9, 'RJ', 2009);

INSERT INTO LIVROS (LIVRO, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, ANO)
VALUES ('SQL para leigos','João Nunes','M',450,'Addison',98,'SP',2018);

INSERT INTO LIVROS VALUES('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ',2008);

INSERT INTO LIVROS VALUES('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78,'RJ',2018);

INSERT INTO LIVROS VALUES('Habitos Saudáveis','Eduardo Santos','M',630,'Beta',150,'RJ',2019);

INSERT INTO LIVROS VALUES('A Casa Marrom','Hermes Macedo','M',250,'Bubba',60,'MG',2016);

INSERT INTO LIVROS VALUES('Estacio Querido','Geraldo Francisco','M',310,'Insignia',100,'ES',2015);

INSERT INTO LIVROS VALUES('Pra sempre amigas','Leda Silva','F',510,'Insignia',78,'ES',2011);

INSERT INTO LIVROS VALUES('Copas Inesqueciveis','Marco Alcantara','M',200,'Larson',130,'RS',2018);

INSERT INTO LIVROS VALUES('O poder da mente','Clara Mafra','F',120,'Continental',56,'SP',2017);

/* 5º PASSO: TRAZER OS DADOS */

SELECT * FROM LIVROS;

SELECT LIVRO, EDITORA FROM LIVROS;

SELECT LIVRO, UF FROM LIVROS
WHERE SEXO = 'M';

SELECT LIVRO, PAGINAS FROM LIVROS
WHERE SEXO = 'F';

SELECT VALOR FROM LIVROS
WHERE UF = 'SP'

/* SELECT LIVRO, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, ANO FROM LIVROS
WHERE SEXO = 'M' AND 
WHERE UF = 'RJ' OR 
WHERE UF = 'SP'; */

SELECT AUTOR, SEXO, UF
FROM LIVROS
WHERE 
SEXO = 'M' AND (UF = 'SP' OR UF = 'RJ');

SELECT AUTOR, SEXO, UF
FROM LIVROS
WHERE SEXO = 'M'
AND UF = 'RJ'
AND paginas > 100;

/* exercicio */

/* Considerando o que vc aprendeu sobre performance, 
resolva os exercicios abaixo 

	ITEM 1 - Traga os funcionarios que trabalhem no departamento de filmes 
			OU no departamento de roupas

	ITEM 2-O gestor de marketing pediu a lista das funcionarias (AS) = FEMININO que trabalhem no 
			departamento de filmes ou no departamento lar. Ele necessita enviar um email para 
			as colaboradoras

	ITEM 3 - traga os funcionarios do sexo masculino ou os funcionarios que trabalhem no setor Jardim
*/

	DATABASE EXERCICIO;
	
	TABLE FUNCIONARIOS; 
	
	ID FUNCIONARIO;
	NOME;
	EMAIL;
	SEXO;
	DEPARTAMENTO;
	ADMISSAO;
	SALARIO;
	CARGO
	REGIAO;

/* ITEM 1 */	
SELECT DEPARTAMENTO, COUNT(*) 
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO
ORDER BY 2; /* COMANDO PARA ORDENAR COLUNA */

/* FILMES = 21; ROUPAS = 53; LAR = 52*/

SELECT IDFUNCIONARIO, NOME, DEPARTAMENTO
FROM FUNCIONARIOS
WHERE (DEPARTAMENTO = 'ROUPAS' 
OR DEPARTAMENTO = 'FILMES');

/* ITEM 2 */	

SELECT SEXO, COUNT(*)
FROM FUNCIONARIOS
WHERE DEPARTAMENTO = 'FILMES'
GROUP BY SEXO;

SELECT SEXO, COUNT(*)
FROM FUNCIONARIOS
WHERE DEPARTAMENTO = 'LAR'
GROUP BY SEXO;

/* FILMES = 9F - 12M; LAR = 32F - 20M */

SELECT NOME, EMAIL, SEXO, DEPARTAMENTO 
FROM FUNCIONARIOS
WHERE (DEPARTAMENTO = 'LAR' AND SEXO = 'FEMININO')
OR (DEPARTAMENTO = 'FILMES' AND SEXO = 'FEMININO');

/* ITEM 3 */	

SELECT SEXO, COUNT(*)
FROM FUNCIONARIOS
GROUP BY SEXO;

SELECT DEPARTAMENTO, COUNT(*)
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO;

/* MASCULINO = 484 ; JARDIM = 47 */

SELECT NOME, SEXO, EMAIL, DEPARTAMENTO
FROM FUNCIONARIOS
WHERE (SEXO = 'MASCULINO' OR DEPARTAMENTO = 'JARDIM');