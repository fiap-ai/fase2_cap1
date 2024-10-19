# FarmTech Solutions - Sistema de Monitoramento Agrícola

## Objetivo
Criar um sistema de armazenamento (banco de dados) para coletar e analisar dados de sensores em uma plantação, visando otimizar a aplicação de água e nutrientes em diferentes culturas.

## Informações Relevantes e Dados Necessários

1. Monitoramento de umidade do solo (S1):
   - Data e hora das leituras do sensor de umidade
   - Valores de umidade registrados

2. Monitoramento do pH do solo (S2):
   - Data e hora das leituras do sensor de pH
   - Valores de pH registrados

3. Monitoramento de nutrientes NPK (S3):
   - Data e hora das leituras do sensor de nutrientes
   - Valores de fósforo (P) e potássio (K) registrados

4. Aplicação de água e nutrientes:
   - Data e hora da aplicação
   - Tipo de aplicação (água ou nutriente específico)
   - Quantidade aplicada

5. Informações sobre as culturas:
   - Tipo de cultura
   - Data de plantio
   - Área plantada

6. Sugestões de ajustes:
   - Data e hora da sugestão
   - Tipo de ajuste (irrigação ou nutriente)
   - Quantidade sugerida

7. Previsões futuras:
   - Data da previsão
   - Tipo de recurso (água ou nutriente)
   - Quantidade prevista

## Modelo Entidade-Relacionamento (MER)

### Entidades e Atributos

#### Sensor
- ID (PK)
- Tipo (S1: umidade, S2: pH, S3: nutrientes)
- Localização

#### Leitura
- ID (PK)
- Sensor_ID (FK)
- Data_Hora
- Valor_Umidade
- Valor_pH
- Valor_Fosforo
- Valor_Potassio

#### Cultura
- ID (PK)
- Nome
- Tipo

#### Plantação
- ID (PK)
- Cultura_ID (FK)
- Area
- Data_Plantio

#### Aplicação
- ID (PK)
- Plantação_ID (FK)
- Data_Hora
- Tipo (Água, Fósforo, Potássio)
- Quantidade

#### Sugestão_Ajuste
- ID (PK)
- Plantação_ID (FK)
- Data_Hora
- Tipo_Ajuste (Irrigação, Fósforo, Potássio)
- Quantidade_Sugerida

#### Previsão
- ID (PK)
- Plantação_ID (FK)
- Data_Previsão
- Tipo_Recurso (Água, Fósforo, Potássio)
- Quantidade_Prevista

### Relacionamentos e Cardinalidades

1. Sensor - Leitura: 1:N (Um sensor pode ter múltiplas leituras)
2. Cultura - Plantação: 1:N (Uma cultura pode ter múltiplas plantações)
3. Plantação - Aplicação: 1:N (Uma plantação pode ter múltiplas aplicações)
4. Plantação - Sugestão_Ajuste: 1:N (Uma plantação pode ter múltiplas sugestões de ajuste)
5. Plantação - Previsão: 1:N (Uma plantação pode ter múltiplas previsões)

### Tipos de Dados

#### Sensor
- ID: INT (AUTO_INCREMENT)
- Tipo: ENUM('S1', 'S2', 'S3')
- Localização: VARCHAR(100)

#### Leitura
- ID: INT (AUTO_INCREMENT)
- Sensor_ID: INT
- Data_Hora: DATETIME
- Valor_Umidade: DOUBLE
- Valor_pH: DOUBLE
- Valor_Fosforo: DOUBLE
- Valor_Potassio: DOUBLE

#### Cultura
- ID: INT (AUTO_INCREMENT)
- Nome: VARCHAR(50)
- Tipo: VARCHAR(30)

#### Plantação
- ID: INT (AUTO_INCREMENT)
- Cultura_ID: INT
- Area: DOUBLE
- Data_Plantio: DATE

#### Aplicação
- ID: INT (AUTO_INCREMENT)
- Plantação_ID: INT
- Data_Hora: DATETIME
- Tipo: ENUM('Água', 'Fósforo', 'Potássio')
- Quantidade: DOUBLE

#### Sugestão_Ajuste
- ID: INT (AUTO_INCREMENT)
- Plantação_ID: INT
- Data_Hora: DATETIME
- Tipo_Ajuste: ENUM('Irrigação', 'Fósforo', 'Potássio')
- Quantidade_Sugerida: DOUBLE

#### Previsão
- ID: INT (AUTO_INCREMENT)
- Plantação_ID: INT
- Data_Previsão: DATE
- Tipo_Recurso: ENUM('Água', 'Fósforo', 'Potássio')
- Quantidade_Prevista: DOUBLE

## Diagrama Entidade-Relacionamento (DER)

O DER foi criado utilizando o SQLDesigner e está disponível como imagem neste repositório: `docs/schema.png`

Para visualizar ou editar o DER:
1. Acesse o [SQLDesigner online](https://ondras.zarovi.cz/sql/demo/)
2. Carregue o arquivo XML (`docs/schema.xml`) disponível neste repositório

## Arquivos do Projeto

- `README.md`: Este arquivo, contendo a documentação explicativa do MER
- `docs/schema.xml`: Arquivo XML do modelo para importação no SQLDesigner
- `docs/schema.sql`: Script SQL para criação das tabelas do banco de dados
- `docs/schema.png`: Imagem do Diagrama Entidade-Relacionamento (DER)
- `docs/consultas_exemplo.sql`: Exemplos de consultas SQL para análise de dados

Este modelo de banco de dados relacional aplica os princípios de relacionamento 1:N (um para muitos) e as conexões entre chaves primárias e estrangeiras, respeitando as regras de negócio definidas para atender à solução de monitoramento agrícola da FarmTech Solutions.

## Consultas SQL de Exemplo

O arquivo `docs/consultas_exemplo.sql` contém várias consultas SQL que demonstram como extrair informações úteis do banco de dados. Estas consultas incluem:

1. Cálculo da quantidade total de água aplicada em cada mês
2. Análise da variação do nível de pH do solo ao longo do ano
3. Cálculo da média de umidade por cultura
4. Soma da quantidade total de nutrientes aplicados por plantação
5. Listagem das últimas sugestões de ajuste para cada plantação

Estas consultas servem como ponto de partida para análises mais complexas e podem ser adaptadas conforme as necessidades específicas do projeto.
