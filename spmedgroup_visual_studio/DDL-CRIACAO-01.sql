CREATE DATABASE SPMEDGROUP;

USE SPMEDGROUP;


CREATE TABLE TIPOS_USUARIO(
	ID INT IDENTITY PRIMARY KEY,
	NOME VARCHAR(255) NOT NULL
);

CREATE TABLE USUARIOS(
	ID INT IDENTITY PRIMARY KEY,
	EMAIL VARCHAR(100) NOT NULL UNIQUE,
	SENHA VARCHAR(100) NOT NULL,
	ID_TIPO_USARIO INT FOREIGN KEY REFERENCES TIPOS_USUARIO(ID) NOT NULL
);

CREATE TABLE ESPECIALIDADES(
	ID INT IDENTITY PRIMARY KEY,
	NOME VARCHAR(100)
);

CREATE TABLE CLINICAS(
	ID INT IDENTITY PRIMARY KEY,
	NOME VARCHAR(100) NOT NULL,
	CNPJ VARCHAR(100) NOT NULL UNIQUE,
	RAZAO_SOCIAL VARCHAR(100) NOT NULL UNIQUE,
	ENDERECO VARCHAR(255) NOT NULL
);

CREATE TABLE MEDICOS(
	ID INT IDENTITY PRIMARY KEY,
	NOME VARCHAR(255) NOT NULL,
	CRM VARCHAR(255) NOT NULL UNIQUE,
	ENDERECO VARCHAR(255) NOT NULL,
	TELEFONE VARCHAR(100),
	ID_USUARIO INT FOREIGN KEY REFERENCES USUARIOS(ID) NOT NULL,
	ID_ESPECIALIDADE INT FOREIGN KEY REFERENCES ESPECIALIDADES(ID) NOT NULL,
	ID_CLINICA INT FOREIGN KEY REFERENCES CLINICAS(ID) NOT NULL
);

CREATE TABLE PRONTUARIOS_PACIENTES(
	ID INT IDENTITY PRIMARY KEY,
	NOME VARCHAR(255) NOT NULL,
	ENDERECO VARCHAR(255) NOT NULL,
	TELEFONE VARCHAR(100),
	RG VARCHAR(255) NOT NULL UNIQUE,
	CPF VARCHAR(255) NOT NULL UNIQUE,
	DATA_NASCIMENTO DATE NOT NULL,
	ID_USUARIO INT FOREIGN KEY REFERENCES USUARIOS(ID) NOT NULL
);

CREATE TABLE CONSULTAS(
	ID INT IDENTITY PRIMARY KEY,
	DATA_CONSULTA DATETIME NOT NULL,
	SITUACAO VARCHAR(30) NOT NULL,
	DESCRICAO VARCHAR(255),
	ID_MEDICO INT FOREIGN KEY REFERENCES MEDICOS(ID) NOT NULL,
	ID_PRONTUARIO_PACIENTE INT FOREIGN KEY REFERENCES PRONTUARIOS_PACIENTES(ID) NOT NULL
);

