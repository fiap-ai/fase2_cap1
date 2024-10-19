-- Exemplo 1: Quantidade total de água aplicada em cada mês
SELECT 
    YEAR(data_hora) AS ano,
    MONTH(data_hora) AS mes,
    SUM(quantidade) AS total_agua
FROM 
    Aplicacao
WHERE 
    tipo = 'Água'
GROUP BY 
    YEAR(data_hora), MONTH(data_hora)
ORDER BY 
    ano, mes;

-- Exemplo 2: Variação do nível de pH do solo ao longo do ano
SELECT 
    YEAR(data_hora) AS ano,
    MONTH(data_hora) AS mes,
    AVG(valor_ph) AS media_ph
FROM 
    Leitura
JOIN 
    Sensor ON Leitura.sensor_id = Sensor.id
WHERE 
    Sensor.tipo = 'S2'
GROUP BY 
    YEAR(data_hora), MONTH(data_hora)
ORDER BY 
    ano, mes;

-- Exemplo 3: Média de umidade por cultura
SELECT 
    c.nome AS cultura,
    AVG(l.valor_umidade) AS media_umidade
FROM 
    Leitura l
JOIN 
    Sensor s ON l.sensor_id = s.id
JOIN 
    Plantacao p ON s.localizacao = p.area
JOIN 
    Cultura c ON p.cultura_id = c.id
WHERE 
    s.tipo = 'S1'
GROUP BY 
    c.nome;

-- Exemplo 4: Quantidade total de nutrientes aplicados por plantação
SELECT 
    p.id AS plantacao_id,
    c.nome AS cultura,
    SUM(CASE WHEN a.tipo = 'Fósforo' THEN a.quantidade ELSE 0 END) AS total_fosforo,
    SUM(CASE WHEN a.tipo = 'Potássio' THEN a.quantidade ELSE 0 END) AS total_potassio
FROM 
    Aplicacao a
JOIN 
    Plantacao p ON a.plantacao_id = p.id
JOIN 
    Cultura c ON p.cultura_id = c.id
GROUP BY 
    p.id, c.nome;

-- Exemplo 5: Últimas sugestões de ajuste para cada plantação
SELECT 
    p.id AS plantacao_id,
    c.nome AS cultura,
    sa.data_hora,
    sa.tipo_ajuste,
    sa.quantidade_sugerida
FROM 
    Sugestao_Ajuste sa
JOIN 
    Plantacao p ON sa.plantacao_id = p.id
JOIN 
    Cultura c ON p.cultura_id = c.id
WHERE 
    sa.data_hora = (
        SELECT MAX(data_hora)
        FROM Sugestao_Ajuste
        WHERE plantacao_id = p.id
    );
