USE AULAS_NOITE_2019;

CREATE TABLE TABELA_A(
	NOME VARCHAR(50) NULL
	);

CREATE TABLE TABELA_B(
	NOME VARCHAR(50) NULL
	);

INSERT INTO TABELA_A VALUES('FERNANDA'), ('JOSEFA'), ('LUIZ'), ('FERNANDO');
INSERT INTO TABELA_B VALUES('CARLOS'), ('MANUEL'), ('LUIZ'), ('FERNANDO');

# inner join (intersecao de duas tabelas)
# 1a forma:
SELECT A.NOME, B.NOME FROM TABELA_A AS A, TABELA_B AS B WHERE A.NOME=B.NOME;
#2a forma:
SELECT A.NOME, B.NOME FROM TABELA_A AS A INNER JOIN TABELA_B AS B ON A.NOME=B.NOME;

# left join (intersecao de duas tabelas,
# incluindo os regstros pertencentes a TABELA_A, mas nao a TABELA_B)
SELECT A.NOME, B.NOME FROM TABELA_A AS A LEFT JOIN TABELA_B AS B ON A.NOME=B.NOME;

# right join (intersecao de duas tabelas,
# incluindo os registros pertencentes a TABELA_B, mas nao a TABELA_A)
SELECT A.NOME, B.NOME FROM TABELA_A AS A RIGHT JOIN TABELA_B AS B ON A.NOME=B.NOME;

# outer join/ full join (uniao de duas tabelas)
SELECT * FROM TABELA_A AS A LEFT JOIN TABELA_B AS B ON (A.NOME=B.NOME)
UNION
SELECT * FROM TABELA_A AS A RIGHT JOIN TABELA_B AS B ON (A.NOME=B.NOME);

# left excluding join (tudo de TABELA_A, excluindo intersecao)
SELECT * FROM TABELA_A AS A LEFT JOIN TABELA_B AS B ON (A.NOME=B.NOME) WHERE (B.NOME IS NULL);

# right excluding join (tudo de TABELA_B, excluindo intersecao)
SELECT * FROM TABELA_A AS A RIGHT JOIN TABELA_B AS B ON (A.NOME=B.NOME) WHERE (A.NOME IS NULL);

# outer excluding join UNION do LEFT com RIGHT EXCLUDING
SELECT * FROM TABELA_A AS A LEFT JOIN TABELA_B AS B ON (A.NOME=B.NOME) WHERE (B.NOME IS NULL)
UNION
SELECT * FROM TABELA_A AS A RIGHT JOIN TABELA_B AS B ON (A.NOME=B.NOME) WHERE (A.NOME IS NULL);
