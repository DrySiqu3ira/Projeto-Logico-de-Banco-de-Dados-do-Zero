-- Inserindo Clientes
INSERT INTO Cliente (Nome, Endereço, Telefone, email) VALUES
('João Silva', 'Rua A, 123', '11987654321', 'joao.silva@email.com'),
('Maria Oliveira', 'Rua B, 456', '21987654321', 'maria.oliveira@email.com');

-- Inserindo Veículos
INSERT INTO Veiculo (Placa, Modelo, Ano_Fabricacao) VALUES
('ABC1234', 'Ford Fiesta', 2015),
('XYZ5678', 'Chevrolet Onix', 2018);

-- Inserindo Mecânicos
INSERT INTO Mecânico (Nome, Endereço, Especialidade) VALUES
('Carlos Souza', 'Rua C, 789', 'Motor'),
('Ana Paula', 'Rua D, 101', 'Suspensão');

-- Inserindo Serviços
INSERT INTO Serviço (Descrição, Valor) VALUES
('Troca de Óleo', 100.00),
('Alinhamento e Balanceamento', 150.00);

-- Inserindo Peças
INSERT INTO Peça (Descrição, Valor) VALUES
('Filtro de Óleo', 20.00),
('Pastilha de Freio', 80.00);

-- Inserindo Ordens de Serviço
INSERT INTO Ordem_Serviço (Data_Emissão, Valor_Total, Status, Data_Conclusão, Cliente_idCliente, Veiculo_idVeiculo) VALUES
('2023-10-01', 120.00, 'Concluído', '2023-10-02', 1, 1),
('2023-10-03', 150.00, 'Em andamento', NULL, 2, 2);

-- Inserindo Itens de Ordem de Serviço (Serviços)
INSERT INTO OS_Servico (Ordem_Serviço_idOrdem_Serviço, Ordem_Serviço_Cliente_idCliente, Ordem_Serviço_Veiculo_idVeiculo, serviço_idserviço, Codigo, Valor) VALUES
(1, 1, 1, 1, 'S001', 100.00),
(1, 1, 1, 2, 'S002', 150.00);

-- Inserindo Itens de Ordem de Serviço (Peças)
INSERT INTO OS_Peça (Ordem_Serviço_idOrdem_Serviço, Ordem_Serviço_Cliente_idCliente, Ordem_Serviço_Veiculo_idVeiculo, Peça_idPeça, Codigo, Quantidade, Valor) VALUES
(1, 1, 1, 1, 'P001', 1, 20.00),
(1, 1, 1, 2, 'P002', 1, 80.00);

-- Inserindo Relação Mecânico-Serviço
INSERT INTO Mecanico_Servico (Mecânico_idMecânico, serviço_idserviço) VALUES
(1, 1),
(2, 2);

-- Inserindo Relação Mecânico-Ordem de Serviço
INSERT INTO Mecânico_OS (Mecânico_idMecânico, Ordem_Serviço_idOrdem_Serviço, Ordem_Serviço_Cliente_idCliente, Ordem_Serviço_Veiculo_idVeiculo) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2);



-- Recuperar o valor total de cada ordem de serviço
SELECT os.idOrdem_Serviço, SUM(os_s.Valor + os_p.Valor) AS ValorTotal
FROM Ordem_Serviço os
LEFT JOIN OS_Servico os_s ON os.idOrdem_Serviço = os_s.Ordem_Serviço_idOrdem_Serviço
LEFT JOIN OS_Peça os_p ON os.idOrdem_Serviço = os_p.Ordem_Serviço_idOrdem_Serviço
GROUP BY os.idOrdem_Serviço;