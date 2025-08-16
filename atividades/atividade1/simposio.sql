CREATE DATABASE Simposio;
go
USE Simposio;

CREATE TABLE Pessoa (
id_pessoa INT identity PRIMARY KEY,
nm_pessoa VARCHAR(255) NOT NULL,
email VARCHAR(255) UNIQUE NOT NULL,
dt_nacimento DATE NOT NULL,
CPF VARCHAR(14) NOT NULL,
sexo VARCHAR(20) NOT NULL,
telefone INT NOT NULL,
endereco VARCHAR(100)
);
CREATE TABLE Simposio (
id_simposio INT identity PRIMARY KEY,
nm_simposio VARCHAR(255) NOT NULL,
descricao TEXT NOT NULL,
dt_simposio DATE NOT NULL
);
CREATE TABLE Organizacao (
id_pessoa INT,
id_simposio INT,
funcao VARCHAR(30),
FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa),
FOREIGN KEY (id_simposio) REFERENCES Simposio(id_simposio)
);
CREATE TABLE Minicurso (
id_minicurso INT identity PRIMARY KEY,
titulo VARCHAR(255) NOT NULL,
descricao TEXT NOT NULL,
dt_minicurso DATE NOT NULL,
id_ministrante INT,
duracao INT NOT NULL,
vagas INT NOT NULL,
FOREIGN KEY (id_ministrante) REFERENCES Pessoa(id_pessoa)
);
CREATE TABLE Tema (
id_tema INT identity PRIMARY KEY,
nome VARCHAR(255) UNIQUE NOT NULL
);
CREATE TABLE Artigo (
id_artigo INT identity PRIMARY KEY,
titulo VARCHAR(255) NOT NULL,
resumo TEXT NOT NULL,
id_tema INT,
dt_artigo DATE NOT NULL,
FOREIGN KEY (id_tema) REFERENCES Tema(id_tema)
);
CREATE TABLE Autor (
id_pessoa INT,
id_artigo INT,
PRIMARY KEY (id_pessoa, id_artigo),
FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa),
FOREIGN KEY (id_artigo) REFERENCES Artigo(id_artigo)
);
CREATE TABLE Comissao_Cientifica (
id_comissao INT identity PRIMARY KEY,
id_tema INT,
ano INT NOT NULL,
FOREIGN KEY (id_tema) REFERENCES Tema(id_tema)
);
CREATE TABLE Membro_Comissao (
id_pessoa INT,
id_comissao INT,
PRIMARY KEY (id_pessoa, id_comissao),
FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa),
FOREIGN KEY (id_comissao) REFERENCES Comissao_Cientifica(id_comissao)
);
CREATE TABLE Parecer (
id_parecer INT identity PRIMARY KEY,
id_artigo INT,
id_comissao INT,
descricao TEXT NOT NULL,
dt_parecer DATE NOT NULL,
nota INT NOT NULL,
FOREIGN KEY (id_artigo) REFERENCES Artigo(id_artigo),
FOREIGN KEY (id_comissao) REFERENCES Comissao_Cientifica(id_comissao)
);

INSERT INTO Pessoa (nm_pessoa, email, dt_nacimento, CPF, sexo, telefone, endereco)
VALUES
('João Silva', 'joao.silva@example.com', '1985-04-25', '123.456.789-00', 'Masculino', 119876543, 'Rua A, 123'),
('Maria Oliveira', 'maria.oliveira@example.com', '1990-07-12', '987.654.321-00', 'Feminino', 118765432, 'Rua B, 456'),
('Carlos Souza', 'carlos.souza@example.com', '1982-01-30', '345.678.901-00', 'Masculino', 117654321, 'Rua C, 789'),
('Fernanda Costa', 'fernanda.costa@example.com', '1995-03-17', '765.432.109-00', 'Feminino', 116543210, 'Rua D, 101'),
('Lucas Pereira', 'lucas.pereira@example.com', '1987-09-22', '432.109.876-00', 'Masculino', 115432109, 'Rua E, 202');

INSERT INTO Simposio (nm_simposio, descricao, dt_simposio)
VALUES
('Simposio de Tecnologia', 'Evento sobre inovações tecnológicas', '2025-08-15'),
('Simposio de Saúde', 'Discussões sobre avanços na área da saúde', '2025-09-10'),
('Simposio de Educação', 'Fórum sobre o futuro da educação', '2025-10-05'),
('Simposio de Engenharia', 'Tendências e inovações na engenharia', '2025-11-20'),
('Simposio de Economia', 'Debates sobre o impacto da economia global', '2025-12-01');

INSERT INTO Organizacao (id_pessoa, id_simposio, funcao)
VALUES
(1, 1, 'Palestrante'),
(2, 2, 'Participante'),
(3, 3, 'Organizador'),
(4, 4, 'Palestrante'),
(5, 5, 'Participante');

INSERT INTO Minicurso (titulo, descricao, dt_minicurso, id_ministrante, duracao, vagas)
VALUES
('Introdução à IA', 'Minicurso sobre Inteligência Artificial', '2025-08-16', 1, 8, 30),
('Blockchain na Prática', 'Como aplicar blockchain em empresas', '2025-09-12', 2, 6, 25),
('Redes de Computadores', 'Fundamentos das redes de computadores', '2025-09-20', 3, 4, 20),
('Segurança Cibernética', 'Práticas para aumentar a segurança digital', '2025-10-10', 4, 5, 15),
('Desenvolvimento Web', 'Criação de sites com tecnologias atuais', '2025-11-15', 5, 10, 40);

INSERT INTO Tema (nome)
VALUES
('Inteligência Artificial'),
('Blockchain'),
('Redes de Computadores'),
('Segurança Cibernética'),
('Desenvolvimento Web');

INSERT INTO Artigo (titulo, resumo, id_tema, dt_artigo)
VALUES
('O Impacto da IA na Saúde', 'Estudo sobre o impacto da Inteligência Artificial na medicina', 1, '2025-08-01'),
('Blockchain para Iniciantes', 'Uma introdução ao uso do blockchain em empresas', 2, '2025-09-15'),
('Redes de Nova Geração', 'Análise das novas tendências em redes de computadores', 3, '2025-10-05'),
('Segurança em Sistemas de Informação', 'Estudo sobre como proteger sistemas digitais', 4, '2025-11-01'),
('Tecnologias Emergentes no Desenvolvimento Web', 'Análise das novas ferramentas para desenvolvimento de sites', 5, '2025-12-01');

INSERT INTO Autor (id_pessoa, id_artigo)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Comissao_Cientifica (id_tema, ano)
VALUES
(1, 2025),
(2, 2025),
(3, 2025),
(4, 2025),
(5, 2025);

INSERT INTO Membro_Comissao (id_pessoa, id_comissao)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Parecer (id_artigo, id_comissao, descricao, dt_parecer, nota)
VALUES
(1, 1, 'Artigo muito bem estruturado, trazendo boas contribuições para o tema.', '2025-08-10', 9),
(2, 2, 'Ótimo artigo, mas poderia ter mais exemplos práticos.', '2025-09-20', 8),
(3, 3, 'Artigo bem relevante, com foco nas novas tecnologias de redes.', '2025-10-10', 7),
(4, 4, 'Excelente abordagem sobre segurança digital, mas faltou mais profundidade.', '2025-11-05', 9),
(5, 5, 'Ótimo artigo sobre ferramentas de desenvolvimento web, com bons insights.', '2025-12-05', 10);