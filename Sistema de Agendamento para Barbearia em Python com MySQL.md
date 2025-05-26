## Sistema de Agendamento para Barbearia em Python com MySQL

Este projeto consiste em um sistema de linha de comando (CLI) desenvolvido em Python para gerenciar agendamentos em uma barbearia. Ele permite o cadastro de clientes, visualização de barbeiros e serviços, realização de novos agendamentos com verificação de conflitos e cancelamento de agendamentos existentes. A persistência dos dados é garantida através da integração com um banco de dados MySQL.

### Funcionalidades Principais

O sistema oferece as seguintes funcionalidades através de um menu interativo:

1.  **Cadastro de Clientes:** Permite registrar novos clientes, solicitando nome e telefone (com validação básica do formato).
2.  **Listagem de Barbeiros:** Exibe os barbeiros disponíveis cadastrados no banco de dados.
3.  **Listagem de Serviços:** Mostra os serviços oferecidos pela barbearia, incluindo seus respectivos preços.
4.  **Agendamento:** Guia o usuário pelo processo de agendamento, selecionando cliente (por ID), barbeiro (por ID), serviço (por ID), data e hora. Inclui validações importantes:
    *   Verifica se o ID do cliente existe.
    *   Verifica se os IDs de barbeiro e serviço são válidos.
    *   Valida o formato da data (AAAA-MM-DD) e impede agendamentos em datas passadas.
    *   Valida o formato da hora (HH:MM).
    *   **Verificação de Conflitos:** Impede que um mesmo barbeiro seja agendado no mesmo horário e que um mesmo cliente faça dois agendamentos simultâneos.
5.  **Visualização de Agendamentos:** Apresenta uma lista formatada de todos os agendamentos registrados, incluindo detalhes como ID do agendamento, data, hora, nome do barbeiro, nome do cliente, serviço e preço.
6.  **Cancelamento de Agendamento:** Permite cancelar um agendamento existente selecionando seu ID na lista de agendamentos.
7.  **Sair:** Encerra a aplicação e fecha a conexão com o banco de dados.

### Tecnologias Utilizadas

*   **Linguagem:** Python 3
*   **Banco de Dados:** MySQL
*   **Bibliotecas Python:**
    *   `mysql.connector`: Para realizar a conexão e interação com o banco de dados MySQL.
    *   `datetime`: Para manipulação e validação de datas e horas.
    *   `tabulate`: Para formatar e exibir dados tabulares (listas de clientes, barbeiros, serviços, agendamentos) de forma organizada no console.

### Estrutura do Código

O código está estruturado em funções modulares para cada funcionalidade principal:

*   `cadastrar_cliente()`: Cuida do registro de novos clientes.
*   `mostrar_barbeiros()`: Busca e exibe os barbeiros.
*   `mostrar_servicos()`: Busca e exibe os serviços.
*   `agendar()`: Orquestra o fluxo de agendamento, incluindo seleção de IDs, entrada de data/hora e validações.
*   `mostrar_agendamentos()`: Busca e exibe os agendamentos existentes, juntando informações de diferentes tabelas.
*   `cancelar_agendamento()`: Permite a exclusão de um agendamento pelo ID.

O fluxo principal da aplicação é controlado por um loop `while` que exibe o menu e chama a função correspondente à opção escolhida pelo usuário.

### Integração com MySQL

A conexão com o banco de dados MySQL é estabelecida no início do script usando a biblioteca `mysql.connector`. As credenciais (host, usuário, senha, nome do banco) estão definidas diretamente no código (recomenda-se o uso de variáveis de ambiente ou arquivos de configuração para ambientes de produção).

Todas as operações de leitura (SELECT) e escrita (INSERT, DELETE) são realizadas através de comandos SQL executados pelo cursor da conexão. A função `conexao.commit()` é utilizada após operações de escrita para persistir as alterações no banco.

**Estrutura do Banco de Dados (Exemplo Esperado):**

O sistema assume a existência de um banco de dados chamado `barbearia` com as seguintes tabelas (ou estrutura similar):

*   `tbl_clientes` (id_cliente, nome_cliente, tel_cliente)
*   `tbl_barbeiros` (id_barbeiro, nome_barbeiro)
*   `tbl_servicos` (id_servico, nome_servico, preco_servico)
*   `tbl_agendamentos` (id_agendamento, data_agendamento, hora_agendamento, fk_cliente, fk_barbeiro, fk_servico)

*Nota: As chaves estrangeiras (`fk_cliente`, `fk_barbeiro`, `fk_servico`) na tabela `tbl_agendamentos` referenciam as chaves primárias das tabelas correspondentes.*

### Como Executar o Projeto

1.  **Pré-requisitos:**
    *   Python 3 instalado.
    *   Servidor MySQL instalado e em execução.
    *   Banco de dados `barbearia` criado no MySQL com as tabelas mencionadas acima.
2.  **Instalar Dependências:**
    ```bash
    pip install mysql-connector-python tabulate
    ```
3.  **Configurar Conexão:**
    *   Abra o arquivo `PROJETO_PY.py`.
    *   Modifique os detalhes da conexão MySQL (host, user, password, database) na seção `mysql.connector.connect(...)` para corresponder à sua configuração local.
4.  **Executar:**
    ```bash
    python PROJETO_PY.py
    ```
5.  Siga as instruções no menu interativo.

### Possíveis Melhorias

*   Utilizar variáveis de ambiente ou arquivo de configuração para as credenciais do banco de dados.
*   Implementar tratamento de exceções mais robusto.
*   Adicionar funcionalidades como edição de clientes ou agendamentos.
*   Criar uma interface gráfica (GUI) ou web.
*   Melhorar a validação de entrada do usuário.
*   Adicionar testes unitários.

