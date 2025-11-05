-- 1. Criar uma view vw_media_temperatura_reservatorio

CREATE VIEW vw_media_temperatura_reservatorio AS
SELECT
    r.nome AS reservatorio,
    AVG(s.valor) AS media_temperatura
FROM
    reservatorio r
JOIN
    serie_temporal s ON r.id_reservatorio = s.id_reservatorio
JOIN
    parametro p ON s.id_parametro = p.id_parametro
WHERE
    p.nome_parametro = 'Temperatura' 
GROUP BY
    r.nome;


-- 2. Criar uma view vw_eventos_reservatorio listando: nome_reservatorio, nome_parametro, valor, data_hora 

CREATE VIEW vw_eventos_reservatorio AS
SELECT
    r.nome AS nome_reservatorio,
    p.nome_parametro AS nome_parametro,
    s.valor,
    s.data_hora 
FROM
    serie_temporal s
JOIN
    reservatorio r ON s.id_reservatorio = r.id_reservatorio
JOIN
    parametro p ON s.id_parametro = p.id_parametro;


-- 3. Criar uma view que mostre apenas reservatórios com média de turbidez acima de 5

CREATE VIEW vw_reservatorios_alta_turbidez AS
SELECT
    r.nome AS reservatorio,
    AVG(s.valor) AS media_turbidez
FROM
    reservatorio r
JOIN
    serie_temporal s ON r.id_reservatorio = s.id_reservatorio
JOIN
    parametro p ON s.id_parametro = p.id_parametro
WHERE
    p.nome_parametro = 'Turbidez'
GROUP BY
    r.nome
HAVING
    AVG(s.valor) > 5; 


-- 4. Consultar as views criadas

SELECT * FROM vw_media_temperatura_reservatorio;

SELECT * FROM vw_eventos_reservatorio;

SELECT * FROM vw_reservatorios_alta_turbidez;


-- 5. Remover uma view (DROP VIEW nome) 

DROP VIEW vw_media_temperatura_reservatorio;

