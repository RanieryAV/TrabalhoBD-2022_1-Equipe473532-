from getpass import getpass
from mysql.connector import connect, Error

def telaTeste():
    menu="1"
    while menu=="1" or menu=="2" or menu=="3":
        menu=input("Escolha a ação: " +
                        "\n<1> - para Listar Livros" +
                        "\n<2> - para Listar Autores" +
                        "\n<3> - para Listar Categorias de Livros" +
                        "\nDigite: ")
        if menu=="1":
            listar_livros_query = 'SELECT * FROM livros'
            with connection.cursor() as cursor:
                cursor.execute(listar_livros_query)
                resultado = cursor.fetchall()
                for linha in resultado:
                    print(linha)
        elif menu=="2":
            listar_autores_query = 'SELECT * FROM autores'
            with connection.cursor() as cursor:
                cursor.execute(listar_autores_query)
                resultado = cursor.fetchall()
                for linha in resultado:
                    print(linha)
        elif menu=="3":
            listar_categorias_query = 'SELECT * FROM categoria'
            with connection.cursor() as cursor:
                cursor.execute(listar_categorias_query)
                resultado = cursor.fetchall()
                for linha in resultado:
                    print(linha)

def telaAdmin():
    print("\nBem-vindo, Administrador!\n")
    return input("Escolha a ação: " +
                        "\n<1> - para Fazer Insercoes" +
                        "\n<2> - para Fazer Remocoes" +
                        "\n<3> - para Fazer Alteracoes" +
                        "\n<4> - para Fazer Consultas" +
                        "\nDigite: ")

try:
    with connect(
        host="localhost",
        user=input("Digite o nome de usuário do MySQL: "),
        password=getpass("Digite a senha do MySQL: "),
        database="equipe473532",
    ) as connection:
        print(connection)

        telaAdmin();

        menu="1"
        while menu=="1" or menu=="2" or menu=="3" or menu=="4" or menu=="5" or menu=="6" or menu=="7":
            menu=input("Escolha a ação: " +
                        "\n<1> - para Inserir Livros" +
                        "\n<2> - para Inserir Autores" +
                        "\n<3> - para Inserir Categorias de Livros" +
                        "\n<4> - para Inserir Cursos" +
                        "\n<5> - para Inserir Funcionarios" +
                        "\n<6> - para Inserir Professores" +
                        "\n<7> - para Inserir Alunos" +
                        "\nDigite: ")
            if menu=="1":
                print("\n---Modo: Administrador | Ação: Inserir Livros---\n")
                isbn_livro_inserir =  int(input("\nDigite o ISBN do livro: "))
                titulo_do_livro_inserir = input("\nDigite o titulo do livro: ")
                ano_lancamento_do_livro_inserir = int(input("\nDigite o ano de lancamento do livro: "))
                editora_do_livro_inserir = input("\nDigite a editora do livro: ")
                qtd_copias_do_livro_inserir = int(input("\nDigite a quantidade de cópias do livro: "))
                cod_categoria_do_livro_inserir = int(input("\nDigite o codigo da categoria do livro: "))
                nome_autor_do_livro_inserir = input("\nDigite o(s) nome(s) do(s) autor(es) do livro: ")
                
                inserir_livros_query = 'INSERT INTO `equipe473532`.`livros` (`ISBN`, `titulo`, `ano_lancamento`, `editora`, `quantidade_copias`, `categoria_codigo_da_categoria`, `autores`) VALUES ({isbn_livro_inserir}, "{titulo_do_livro_inserir}", {ano_lancamento_do_livro_inserir}, "{editora_do_livro_inserir}", {qtd_copias_do_livro_inserir}, {cod_categoria_do_livro_inserir}, "{nome_autor_do_livro_inserir}");'.format(isbn_livro_inserir=isbn_livro_inserir, titulo_do_livro_inserir=titulo_do_livro_inserir, ano_lancamento_do_livro_inserir=ano_lancamento_do_livro_inserir, editora_do_livro_inserir=editora_do_livro_inserir, qtd_copias_do_livro_inserir=qtd_copias_do_livro_inserir, cod_categoria_do_livro_inserir=cod_categoria_do_livro_inserir, nome_autor_do_livro_inserir=nome_autor_do_livro_inserir)
                with connection.cursor() as cursor:
                    cursor.execute(inserir_livros_query)
                    connection.commit();
            elif menu=="2":
                listar_autores_query = 'SELECT * FROM autores'
                with connection.cursor() as cursor:
                    cursor.execute(listar_autores_query)
                    resultado = cursor.fetchall()
                    for linha in resultado:
                        print(linha)
            elif menu=="3":
                listar_categorias_query = 'SELECT * FROM categoria'
                with connection.cursor() as cursor:
                    cursor.execute(listar_categorias_query)
                    resultado = cursor.fetchall()
                    for linha in resultado:
                        print(linha)

        connection.close();
except Error as e:
    print(e)

