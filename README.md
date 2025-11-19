# 💾 Projeto Lógico e Manipulação de Dados (DML) - Loja de Eletrônicos

Este repositório contém o Projeto Lógico (DDL) e os scripts de manipulação de dados (DML) desenvolvidos para a **Atividade 04: Checkpoint - Loja de Eletrônicos**.

O projeto visa criar um banco de dados relacional que garanta a **integridade** e a **agilidade** na consulta e gerenciamento de dados de clientes, produtos, fornecedores e transações de vendas.

---

## 🚀 Visão Geral do Projeto

### 1. Modelo Lógico e Normalização

O modelo foi concebido para atender rigorosamente à **Terceira Forma Normal (3FN)**, eliminando redundâncias e dependências transitivas.

* **Estrutura:** O modelo é composto por 6 tabelas (Entidades) que gerenciam a transação de vendas: `CLIENTE`, `VENDEDOR`, `FORNECEDOR`, `PRODUTO`, `VENDA` e a tabela associativa **`ITEM_VENDA`** (resolução do relacionamento M:N).
* **Integridade:** A integridade referencial é garantida pela aplicação de **5 Chaves Estrangeiras (FKs)**, que impedem a inserção de dados "órfãos" no sistema.
* **Decisão Crítica:** Foi aplicada uma pequena **Denormalização Tática** ao incluir o campo `valor_total` na tabela `VENDA`. Essa decisão visa o **ganho de desempenho** em relatórios, evitando recálculos complexos a cada consulta.

### 2. Diagrama Entidade-Relacionamento (Modelo Lógico Visual)

*(**INSERIR LINK AQUI:** (https://dbdiagram.io/d/Sprint2-atv-3-690a043d6735e111702ff3b3)

<img width="1270" height="629" alt="sprint2" src="https://github.com/user-attachments/assets/652e0c61-b5f5-44f5-8e7a-db6d4f9cdc75" />
<img width="1382" height="820" alt="sprint3-2" src="https://github.com/user-attachments/assets/999a0db7-ee97-48e8-a78b-a8eaeb687d67" />

<img width="1527" height="735" alt="dbe" src="https://github.com/user-attachments/assets/32c3e15a-a55e-46be-b728-77852c65fc2e" />




---

## 📦 Estrutura do Repositório

O projeto está dividido em três scripts SQL principais, seguindo as etapas de implementação e manipulação:

| Arquivo | Conteúdo | Etapa da Atividade |
| :--- | :--- | :--- |
| `01_ddl_criacao_tabelas.sql` | `CREATE TABLE`, `PRIMARY KEY`, `ALTER TABLE` (FOREIGN KEY) | Atividade 03 (DDL e Integridade) |
| `02_dml_insercao_consulta.sql` | `INSERT INTO` (povoamento de dados) e `SELECT` (consultas iniciais) | Atividade 04 - Sprint 2 |
| `03_dml_manipulacao.sql` | `UPDATE` e `DELETE` (incluindo testes de integridade) | Atividade 04 - Sprint 3 |

---

## ⚙️ Instruções para Execução

Para rodar este projeto, você precisará de um servidor MySQL/MariaDB instalado e uma ferramenta cliente (como o **MySQL Workbench**).

### Pré-requisitos

* MySQL Server (ou equivalente).
* MySQL Workbench (ou outro cliente SQL).

### Passo a Passo

#### 1. Preparação do Ambiente

No seu cliente SQL (Workbench), execute os comandos para criar e selecionar o banco de dados (schema):

```sql
-- Cria o esquema/banco de dados
CREATE SCHEMA loja_eletronicos;


2. Criação da Estrutura (DDL)
Execute o script 01_ddl_criacao_tabelas.sql.

Este script cria as 6 tabelas e aplica as 5 regras de integridade referencial (FOREIGN KEY).

3. Inserção e Consultas Iniciais (DML)
Execute o script 02_dml_insercao_consulta.sql.

Este script povoa as tabelas com dados de teste e realiza 5 consultas JOIN, WHERE e ORDER BY, cumprindo os requisitos da Sprint 2.

4. Manipulação de Dados (UPDATE/DELETE)
Execute o script 03_dml_manipulacao.sql.

Este script realiza atualizações (UPDATE) e exclusões (DELETE). ATENÇÃO: O comando de DELETE que tenta remover um fornecedor com produtos ativos é intencionalmente programado para falhar, demonstrando que as regras de FOREIGN KEY estão protegendo a integridade dos seus dados.

🤝 Autor e Contato
Aluno: [Ronaldo César ] Instituição: [Cruzeiro Do Sul ] Disciplina: Modelagem de Banco de Dados
------
[Link para o seu perfil do GitHub : https://github.com/Ronaldo94-cf

-------
/ LinkedIn] https://www.linkedin.com/in/cesar-ronaldo-b78b04172/

-------

-- Seleciona o banco de dados
USE loja_eletronicos;
