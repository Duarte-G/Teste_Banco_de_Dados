-- Criação da tabela de operadoras, armazena informações básicas sobre cada operadora
DROP TABLE IF EXISTS operadoras;
CREATE TABLE operadoras (
    Registro_ANS VARCHAR(20) PRIMARY KEY,
    CNPJ VARCHAR(14),
    Razao_Social TEXT,
    Nome_Fantasia TEXT
);

-- Criação da tabela temporária para importação dos dados de operadoras
DROP TABLE IF EXISTS temp_operadoras;
CREATE TEMP TABLE temp_operadoras (
    Registro_ANS VARCHAR(6),
    CNPJ VARCHAR(14),
    Razao_Social TEXT,
    Nome_Fantasia TEXT,
    Modalidade TEXT,
    Logradouro TEXT,
    Numero VARCHAR(20),
    Complemento TEXT,
    Bairro TEXT,
    Cidade TEXT,
    UF CHAR(2),
    CEP VARCHAR(8),
    DDD VARCHAR(2),
    Telefone VARCHAR(20),
    Fax VARCHAR(20),
    Endereco_eletronico TEXT,
    Representante TEXT,
    Cargo_Representante TEXT,
    Regiao_de_Comercializacao VARCHAR(2),
    Data_Registro_ANS DATE
);

-- Criação da tabela final de trimestres
DROP TABLE IF EXISTS trimestres;
CREATE TABLE trimestres (
    DATA DATE,
    REG_ANS VARCHAR(6),
    CD_CONTA_CONTABIL VARCHAR(15),
    DESCRICAO TEXT,
    VL_SALDO_INICIAL DECIMAL(15,2),
    VL_SALDO_FINAL DECIMAL(15,2)
);

-- Criação da tabela temporária para importar dados dos trimestres
DROP TABLE IF EXISTS temp_trimestres;
CREATE TEMP TABLE temp_trimestres (
    DATA TEXT, -- Mantém como texto por causa dos diferentes formatos de data
    REG_ANS VARCHAR(6),
    CD_CONTA_CONTABIL VARCHAR(15),
    DESCRICAO TEXT,
    VL_SALDO_INICIAL TEXT,  -- Armazena como texto para conversão depois
    VL_SALDO_FINAL TEXT -- Armazena como texto para conversão depois
);
