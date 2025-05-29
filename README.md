# Sistema de Agendamento para Barbearia ✂️

Este projeto é um sistema de agendamento desenvolvido em Python para gerenciar clientes, serviços e agendamentos de uma barbearia. Foi criado com o objetivo de demonstrar habilidades em programação, integração com banco de dados MySQL e construção de interfaces de linha de comando (CLI).

---

## 🎯 Objetivo  
Automatizar o processo de agendamento de uma barbearia, permitindo:  
- Cadastro de clientes.  
- Visualização de barbeiros e serviços disponíveis.  
- Agendamento e cancelamento de horários.  
- Controle centralizado de registros via banco de dados.  

---

## ⚙️ Funcionalidades  
1. **Cadastro de Clientes**: Validação de telefone e armazenamento no banco de dados.  
2. **Listagem de Barbeiros e Serviços**: Exibição organizada em tabelas usando a biblioteca `tabulate`.  
3. **Agendamento Inteligente**:  
   - Verificação de conflitos de horário para clientes e barbeiros.  
   - Validação de datas e horários.  
4. **Cancelamento de Agendamentos**: Remoção segura de registros com confirmação de IDs.  
5. **Relatórios**: Visualização detalhada de todos os agendamentos, incluindo preços e informações relacionadas.  

---

## 🛠️ Tecnologias Utilizadas  
- **Python**: Lógica principal do sistema.  
- **MySQL**: Armazenamento de dados (clientes, barbeiros, serviços, agendamentos).  
- **Bibliotecas**:  
  - `mysql.connector`: Conexão com o banco de dados.  
  - `datetime` e `tabulate`: Manipulação de datas e formatação de tabelas.  

---

## 📌 Habilidades Destacadas  
- **Programação em Python**: Estruturação de funções modularizadas e tratamento de exceções.  
- **Banco de Dados**: CRUD (Create, Read, Update, Delete) com MySQL.  
- **CLI (Interface de Linha de Comando)**: Experiência em criar interfaces interativas para usuários.  
- **Boas Práticas**: Validação de inputs, prevenção de SQL injection (uso de placeholders), e organização de código.  

---

## 🚀 Como Executar  
1. **Pré-requisitos**:  
   - Instalar Python e MySQL.  
   - Criar as tabelas do banco de dados (schemas fornecidos no código).  
   - Configurar a conexão MySQL em `conexao = mysql.connector.connect()`.  

2. **Instalar Dependências**:  
   ```bash
   pip install mysql-connector-python tabulate

 Este projeto serve como base para um sistema simples de agendamento, mas requer ajustes para uso em produção.
