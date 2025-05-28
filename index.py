import mysql.connector 
from datetime import datetime, date 
from tabulate import tabulate 

conexao = mysql.connector.connect( 
    
)

cursor = conexao.cursor()


def cadastrar_cliente():
    nome_cliente = ((input('Digite o seu nome: ')))
    while True:
        tel_cliente = input('Digite o seu telefone (11 números): ').strip()
        if len(tel_cliente) == 11 and tel_cliente.isdigit():
            break
        else:
            print("❌ Telefone inválido! Deve conter exatamente 11 números.")
    comando_cliente = f'INSERT INTO tbl_clientes ( nome_cliente, tel_cliente ) VALUES ( "{nome_cliente}", {tel_cliente} )'
    cursor.execute(comando_cliente)
    conexao.commit()
    print("✅ Cliente cadastrado com sucesso!")


def mostrar_barbeiros():
    comando_barbeiro = f'SELECT * FROM tbl_barbeiros'
    cursor.execute(comando_barbeiro)
    resultado_barbeiros = cursor.fetchall()
    print(tabulate(resultado_barbeiros, headers=["ID", "Nome do Barbeiro"], tablefmt="fancy_grid"))


def mostrar_servicos():
    comando_servico = f'SELECT * FROM tbl_servicos'
    cursor.execute(comando_servico)
    resultado_servicos = cursor.fetchall()
    print(tabulate(resultado_servicos, headers=["ID", "Serviço", "Preço"], tablefmt="fancy_grid"))


def agendar():
    mostrar_clientes = f'SELECT id_cliente,nome_cliente FROM tbl_clientes'
    cursor.execute(mostrar_clientes)
    resultado_clientes = cursor.fetchall()
    print(tabulate(resultado_clientes, headers=["ID", "Nome do Cliente"], tablefmt="fancy_grid"))
    ids_existentes = [id[0] for id in resultado_clientes]

    while True:
        try:
            IDcliente = int(input("Digite seu ID de cliente: "))
            if IDcliente in ids_existentes:
                break
            else:
                print("❌ ID inválido. Por favor, digite um ID de cliente existente.")
        except (ValueError):
            print("❌ ID inválido. Por favor, digite um ID de cliente existente.")

    mostrar_barbeiros()
    while True:
        try:
            IDbarbeiro = int(input("Digite o ID do barbeiro que deseja: "))
            if IDbarbeiro >= 1 and IDbarbeiro <= 2:
                break
            else:
                print("❌ ID inválido")
        except (ValueError):
            print("❌ ID inválido")

    mostrar_servicos()
    while True:
        try:
            IDservicos = int(input("Digite o ID do serviço que deseja: "))
            if IDservicos >= 1 and IDservicos <= 6:
                break
            else:
                print("❌ ID inválido")
        except (ValueError):
            print("❌ ID inválido")

    while True:
        try:
            data = input("Digite a DATA do agendamento (AAAA-MM-DD): ")
            data_formatada = datetime.strptime(data, "%Y-%m-%d").date()
            hoje = date.today()
            if data_formatada < hoje:
                print("❌ Digite uma DATA disponível")
            else:
                break
        except ValueError:
            print("❌ Digite uma DATA válida")

    while True:
        try:
            hora = input("Digite a HORA do agendamento (HH:MM): ")
            hora_formatada = datetime.strptime(hora, "%H:%M").time()

            comando_verifica_barbeiro = '''
                SELECT * FROM tbl_agendamentos 
                WHERE data_agendamento = %s AND hora_agendamento = %s AND fk_barbeiro = %s
            '''
            cursor.execute(comando_verifica_barbeiro, (data_formatada, hora_formatada, IDbarbeiro))
            conflito_barbeiro = cursor.fetchone()

            if conflito_barbeiro:
                print("❌ Horário já ocupado para este barbeiro.")
                continue

            comando_verifica_cliente = '''
                SELECT * FROM tbl_agendamentos 
                WHERE data_agendamento = %s AND hora_agendamento = %s AND fk_cliente = %s
            '''
            cursor.execute(comando_verifica_cliente, (data_formatada, hora_formatada, IDcliente))
            conflito_cliente = cursor.fetchone()

            if conflito_cliente:
                print("❌ Você já tem um agendamento nesse horário.")
                continue

            break
        except (ValueError):
            print("❌ Digite uma HORA válida")

    inserir = (f"INSERT INTO tbl_agendamentos (data_agendamento, hora_agendamento, fk_cliente, fk_barbeiro, fk_servico) VALUES ('{data_formatada}', '{hora_formatada}', '{IDcliente}','{IDbarbeiro}', '{IDservicos}')")
    cursor.execute(inserir)
    conexao.commit()
    print("✅ Agendamento realizado com sucesso!")


def mostrar_agendamentos():
    comando_agendamentos = f"SELECT tbl_agendamentos.id_agendamento, tbl_agendamentos.data_agendamento, tbl_agendamentos.hora_agendamento, tbl_barbeiros.nome_barbeiro, tbl_clientes.nome_cliente, tbl_servicos.nome_servico,tbl_servicos.preco_servico FROM tbl_agendamentos INNER JOIN tbl_barbeiros ON tbl_agendamentos.fk_barbeiro = tbl_barbeiros.id_barbeiro INNER JOIN tbl_clientes ON tbl_agendamentos.fk_cliente = tbl_clientes.id_cliente INNER JOIN tbl_servicos ON tbl_agendamentos.fk_servico = tbl_servicos.id_servico"
    cursor.execute(comando_agendamentos)
    resultado_agendamento = cursor.fetchall()
    print(tabulate(resultado_agendamento, headers=["ID", "Data", "Hora", "Barbeiro", "Cliente", "Serviço", "Preço"], tablefmt="fancy_grid"))


def cancelar_agendamento():
    mostrar_agendamentos()
    cursor.execute("SELECT id_agendamento FROM tbl_agendamentos")
    resultado_ids = cursor.fetchall()
    ids_validos = [id[0] for id in resultado_ids]
    while True:
        try:
            idCANCELAR = int(input("Digite o ID do agendamento que deseja cancelar: "))
            if idCANCELAR in ids_validos:
                comando_cancelar = f"DELETE FROM tbl_agendamentos WHERE id_agendamento = {idCANCELAR}"
                cursor.execute(comando_cancelar)
                conexao.commit()
                print("✅ Agendamento cancelado com sucesso! ")
                break
            else:
                print("❌ ID inválido. Digite um ID que esteja na lista.")
        except (ValueError):
            print("❌ ID inválido. Digite um ID que esteja na lista.")


while True:
    print("MENU BARBEARIA ✂️")
    print("1 - Fazer cadastro")
    print("2 - Barbeiros disponíveis")
    print("3 - Serviços disponíveis")
    print("4 - Fazer agendamento")
    print("5 - Mostrar agendamentos")
    print("6 - Cancelar agendamento")
    print("7 - Sair")

    opcao = int(input('Escolha uma opção: '))

    if opcao == 1:
        cadastrar_cliente()
    elif opcao == 2:
        mostrar_barbeiros()
    elif opcao == 3:
        mostrar_servicos()
    elif opcao == 4:
        agendar()
    elif opcao == 5:
        mostrar_agendamentos()
    elif opcao == 6:
        cancelar_agendamento()
    elif opcao == 7:
        print("Saindo...")
        break
    else:
        print('❌ Opção inválida')

cursor.close()
conexao.close()
