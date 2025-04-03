-- Consulta para obter as 10 operadoras com maiores despesas na categoria 
-- "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR"

SELECT 
    o.Nome_Fantasia,
    SUM(t.VL_SALDO_FINAL - t.VL_SALDO_INICIAL) AS total_despesas
FROM trimestres t
JOIN operadoras o ON t.REG_ANS = o.Registro_ANS
WHERE t.DESCRICAO ILIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR %'
  AND t.DATA >= (SELECT MAX(DATA) - INTERVAL '12 months' FROM trimestres) -- Filtra os últimos 12 meses
GROUP BY o.Nome_Fantasia
ORDER BY total_despesas DESC
LIMIT 10;