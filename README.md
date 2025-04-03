# Teste de Banco de Dados - Análise de Despesas de Operadoras de Saúde  

Este repositório contém scripts SQL utilizados para estruturar, importar e analisar dados de despesas de operadoras de saúde. O objetivo é extrair insights a partir de arquivos CSV contendo informações financeiras trimestrais.  

## Estrutura do Repositório  
docs/ # Contém os arquivos de dados brutos
* 2023/ # Arquivos CSV de 2023
* 2024/ # Arquivos CSV de 2024
* Relatorio_cadop.csv # Dados cadastrais das operadoras

src/ # Contém os scripts SQL
* queries/ # Consultas analíticas
    * top10_3meses.sql # Top 10 operadoras com maiores despesas no último trimestre
    * top10_12meses.sql # Top 10 operadoras com maiores despesas no último ano
* scripts/ # Criação de tabelas e importação de dados
    * tables.sql # Estruturação das tabelas no PostgreSQL
    * import_data.sql # Importação e transformação dos dados

1 **Certifique-se de que todos os arquivos CSV estejam salvos no diretório `C:/temp/`**  
   - A estrutura deve ser:  
     ```
     C:/temp/Teste Banco de Dados/2023/
     C:/temp/Teste Banco de Dados/2024/
     C:/temp/Teste Banco de Dados/Relatorio_cadop.csv
     ```

2 **Execute os scripts na ordem correta:**  
   - **1 Criar as tabelas:** Rode `tables.sql` para criar as tabelas no banco de dados PostgreSQL.  
   - **2 Importar os dados:** Execute `import_data.sql` para carregar e transformar os dados.  
   - **3 Rodar as consultas analíticas:** Execute os scripts em `queries/` para gerar insights sobre despesas das operadoras.  

---

## Personalização  

Os caminhos dos arquivos CSV estão definidos no script `import_data.sql`. Se quiser alterar os diretórios, basta modificar os comandos `COPY` para apontar para o local correto.  

Sinta-se à vontade para modificar e melhorar o código!

 Sobre os Scripts  

- **`tables.sql`** → Cria as tabelas necessárias para armazenar os dados.  
- **`import_data.sql`** → Importa os arquivos CSV e faz a transformação dos dados para um formato padronizado.  
- **`top10_3meses.sql`** → Retorna as 10 operadoras com maiores despesas no último trimestre.  
- **`top10_12meses.sql`** → Retorna as 10 operadoras com maiores despesas no último ano.