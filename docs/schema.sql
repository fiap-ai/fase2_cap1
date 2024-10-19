-- Criação da tabela Sensor
CREATE TABLE Sensor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('S1', 'S2', 'S3'),
    localizacao VARCHAR(100)
);

-- Criação da tabela Leitura
CREATE TABLE Leitura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sensor_id INT,
    data_hora DATETIME,
    valor_umidade DOUBLE,
    valor_ph DOUBLE,
    valor_fosforo DOUBLE,
    valor_potassio DOUBLE,
    FOREIGN KEY (sensor_id) REFERENCES Sensor(id)
);

-- Criação da tabela Cultura
CREATE TABLE Cultura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    tipo VARCHAR(30)
);

-- Criação da tabela Plantacao
CREATE TABLE Plantacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cultura_id INT,
    area DOUBLE,
    data_plantio DATE,
    FOREIGN KEY (cultura_id) REFERENCES Cultura(id)
);

-- Criação da tabela Aplicacao
CREATE TABLE Aplicacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    plantacao_id INT,
    data_hora DATETIME,
    tipo ENUM('Água', 'Fósforo', 'Potássio'),
    quantidade DOUBLE,
    FOREIGN KEY (plantacao_id) REFERENCES Plantacao(id)
);

-- Criação da tabela Sugestao_Ajuste
CREATE TABLE Sugestao_Ajuste (
    id INT AUTO_INCREMENT PRIMARY KEY,
    plantacao_id INT,
    data_hora DATETIME,
    tipo_ajuste ENUM('Irrigação', 'Fósforo', 'Potássio'),
    quantidade_sugerida DOUBLE,
    FOREIGN KEY (plantacao_id) REFERENCES Plantacao(id)
);

-- Criação da tabela Previsao
CREATE TABLE Previsao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    plantacao_id INT,
    data_previsao DATE,
    tipo_recurso ENUM('Água', 'Fósforo', 'Potássio'),
    quantidade_prevista DOUBLE,
    FOREIGN KEY (plantacao_id) REFERENCES Plantacao(id)
);
