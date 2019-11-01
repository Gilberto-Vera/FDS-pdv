/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  gilberto
 * Created: 01/11/2019
 */

CREATE TABLE produto_pdv (
	id SERIAL NOT NULL,
	codigoBarra VARCHAR (13) NOT NULL,
	descricao VARCHAR (50) NOT NULL,
	preco FLOAT NOT NULL,
	
	PRIMARY KEY (id)
);

CREATE TABLE venda_pdv (
	id SERIAL NOT NULL,
	data_venda TIMESTAMP WITHOUT TIME ZONE NOT NULL,
	valor_total FLOAT NOT NULL,
	forma_pagmto VARCHAR (20) NOT NULL,
	
	PRIMARY KEY (id)
);

CREATE TABLE secao_pdv (
	id SERIAL NOT NULL,
	nome VARCHAR (100) NOT NULL,
	senha VARCHAR (20) NOT NULL,
	id_venda_pdv INT,
	
	PRIMARY KEY (id),
	FOREIGN KEY (id_venda_pdv) REFERENCES venda_pdv (id)
);

CREATE TABLE produto_venda_pdv (
	id_produto_pdv INT NOT NULL,
	id_venda_pdv INT NOT NULL,
	quant_produto INT NOT NULL,
	
	FOREIGN KEY (id_produto_pdv) REFERENCES produto_pdv (id),
	FOREIGN KEY (id_venda_pdv) REFERENCES venda_pdv (id)
);

INSERT INTO secao_pdv (nome, senha) 
	VALUES ('Master', 123);