-- Importação dos dados de operadoras
COPY temp_operadoras FROM 'C:/temp/Teste Banco de Dados/Relatorio_cadop.csv' 
DELIMITER ';' CSV HEADER ENCODING 'UTF8';

-- Inserção dos dados processados na tabela final de operadoras
INSERT INTO operadoras (Registro_ANS, CNPJ, Razao_Social, Nome_Fantasia)
SELECT Registro_ANS, CNPJ, Razao_Social, Nome_Fantasia
FROM temp_operadoras;

-- Importação dos dados do CSV trimestres
COPY temp_trimestres (DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL) 
FROM 'C:/temp/Teste Banco de Dados/2023/1T2023.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY temp_trimestres (DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL) 
FROM 'C:/temp/Teste Banco de Dados/2023/2t2023.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY temp_trimestres (DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL) 
FROM 'C:/temp/Teste Banco de Dados/2023/3T2023.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY temp_trimestres (DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL) 
FROM 'C:/temp/Teste Banco de Dados/2023/4T2023.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY temp_trimestres (DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL) 
FROM 'C:/temp/Teste Banco de Dados/2024/1T2024.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY temp_trimestres (DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL) 
FROM 'C:/temp/Teste Banco de Dados/2024/2T2024.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY temp_trimestres (DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL) 
FROM 'C:/temp/Teste Banco de Dados/2024/3T2024.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY temp_trimestres (DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL) 
FROM 'C:/temp/Teste Banco de Dados/2024/4T2024.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

-- Conversão de dados e inserção na tabela final de trimestres
INSERT INTO trimestres (DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL)
SELECT 
    CASE 
      WHEN DATA ~ '^\d{2}/\d{2}/\d{4}$' THEN TO_DATE(DATA, 'DD/MM/YYYY') -- converte para DATE se estiver DD/MM/YYYY 
      WHEN DATA ~ '^\d{4}-\d{2}-\d{2}$' THEN TO_DATE(DATA, 'YYYY-MM-DD') -- converte para DATE se estiver YYYY/MM/DD
      ELSE NULL -- se não estiver nenhum dos dois casos = null
    END AS DATA,
    REG_ANS,
    CD_CONTA_CONTABIL,
    DESCRICAO,
	-- Conversão dos valores para o formato decimal
    REPLACE(VL_SALDO_INICIAL, ',', '.')::DECIMAL(15,2),
    REPLACE(VL_SALDO_FINAL, ',', '.')::DECIMAL(15,2)
FROM temp_trimestres;