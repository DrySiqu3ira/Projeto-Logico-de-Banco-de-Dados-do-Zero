-- drop database oficinaMecanica;
create database oficinaMecanica;
use oficinaMecanica;

-- show table status;


-- Tabela Cliente: Armazena informações dos clientes da oficina
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Endereço VARCHAR(255),
    Telefone VARCHAR(15),
    email VARCHAR(100)
);


CREATE TABLE Veiculo (
    idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    Placa VARCHAR(7) UNIQUE,
    Modelo VARCHAR(50) NOT NULL,
    Ano_Fabricacao YEAR
);

ALTER TABLE Veiculo
ADD COLUMN Ordem_Serviço_idOrdem_Serviço INT,
ADD COLUMN Ordem_Serviço_Cliente_idCliente INT,
ADD COLUMN Ordem_Serviço_Veiculo_idVeiculo INT,
ADD FOREIGN KEY (Ordem_Serviço_idOrdem_Serviço) REFERENCES Ordem_Serviço(idOrdem_Serviço),
ADD FOREIGN KEY (Ordem_Serviço_Cliente_idCliente) REFERENCES Cliente(idCliente),
ADD FOREIGN KEY (Ordem_Serviço_Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo);


CREATE TABLE Mecânico (
    idMecânico INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Endereço VARCHAR(255),
    Especialidade VARCHAR(50)
);

CREATE TABLE Ordem_Serviço (
    idOrdem_Serviço INT PRIMARY KEY AUTO_INCREMENT,
    Data_Emissão DATE NOT NULL,
    Valor_Total DECIMAL(10, 2),
    Status ENUM('Em andamento', 'Concluído', 'Cancelado'),
    Data_Conclusão DATE,
    Cliente_idCliente INT,
    Veiculo_idVeiculo INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo)
);

CREATE TABLE Serviço (
    idserviço INT PRIMARY KEY AUTO_INCREMENT,
    Descrição VARCHAR(255) NOT NULL,
    Valor DECIMAL(10, 2)
);

CREATE TABLE Peça (
    idPeça INT PRIMARY KEY AUTO_INCREMENT,
    Descrição VARCHAR(255) NOT NULL,
    Valor DECIMAL(10, 2)
);

CREATE TABLE OS_Servico (
    Ordem_Serviço_idOrdem_Serviço INT,
    Ordem_Serviço_Cliente_idCliente INT,
    Ordem_Serviço_Veiculo_idVeiculo INT,
    serviço_idserviço INT,
    Codigo VARCHAR(45),
    Valor DECIMAL(10, 2),
    FOREIGN KEY (Ordem_Serviço_idOrdem_Serviço) REFERENCES Ordem_Serviço(idOrdem_Serviço),
    FOREIGN KEY (Ordem_Serviço_Cliente_idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (Ordem_Serviço_Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo),
    FOREIGN KEY (serviço_idserviço) REFERENCES Serviço(idserviço)
);

CREATE TABLE OS_Peça (
    Ordem_Serviço_idOrdem_Serviço INT,
    Ordem_Serviço_Cliente_idCliente INT,
    Ordem_Serviço_Veiculo_idVeiculo INT,
    Peça_idPeça INT,
    Codigo INT,
    Quantidade INT,
    Valor DECIMAL(10, 2),
    FOREIGN KEY (Ordem_Serviço_idOrdem_Serviço) REFERENCES Ordem_Serviço(idOrdem_Serviço),
    FOREIGN KEY (Ordem_Serviço_Cliente_idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (Ordem_Serviço_Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo),
    FOREIGN KEY (Peça_idPeça) REFERENCES Peça(idPeça)
);

ALTER TABLE OS_Peça
MODIFY COLUMN Codigo VARCHAR(45);



CREATE TABLE Mecanico_Servico (
    Mecânico_idMecânico INT,
    serviço_idserviço INT,
    FOREIGN KEY (Mecânico_idMecânico) REFERENCES Mecânico(idMecânico),
    FOREIGN KEY (serviço_idserviço) REFERENCES Serviço(idserviço)
);

CREATE TABLE Mecânico_OS (
    Mecânico_idMecânico INT,
    Ordem_Serviço_idOrdem_Serviço INT,
    Ordem_Serviço_Cliente_idCliente INT,
    Ordem_Serviço_Veiculo_idVeiculo INT,
    FOREIGN KEY (Mecânico_idMecânico) REFERENCES Mecânico(idMecânico),
    FOREIGN KEY (Ordem_Serviço_idOrdem_Serviço) REFERENCES Ordem_Serviço(idOrdem_Serviço),
    FOREIGN KEY (Ordem_Serviço_Cliente_idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (Ordem_Serviço_Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo)
);