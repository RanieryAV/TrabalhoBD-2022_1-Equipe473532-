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
    return int(input("Escolha a ação: " +
                        "\n<1> - para Fazer Insercoes" +
                        "\n<2> - para Fazer Remocoes" +
                        "\n<3> - para Fazer Alteracoes" +
                        "\n<4> - para Fazer Consultas" +
                        "\nDigite: "))

try:
    with connect(
        host="localhost",
        user=input("Digite o nome de usuário do MySQL: "),
        password=getpass("Digite a senha do MySQL: "),
        database="equipe473532",
    ) as connection:
        print(connection)

        opcaoAdmin = telaAdmin();

        if(opcaoAdmin == 1):
            a=1
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
                print("\n")
            elif menu=="2":
                print("\n---Modo: Administrador | Ação: Inserir Autores---\n")
                email_autor_inserir =  input("\nDigite o e-mail do(a) autor(a): ")
                nome_autor_inserir = input("\nDigite o nome do(a) autor(a): ")
                nacionalidade_autor_inserir = input("\nDigite a nacionalidade do(a) autor(a): ")
                
                inserir_autor_query = 'INSERT INTO `equipe473532`.`autores` (`email`, `nome`, `nacionalidade`) VALUES ("{email_autor_inserir}", "{nome_autor_inserir}", "{nacionalidade_autor_inserir}");'.format(email_autor_inserir=email_autor_inserir, nome_autor_inserir=nome_autor_inserir, nacionalidade_autor_inserir=nacionalidade_autor_inserir)
                with connection.cursor() as cursor:
                    cursor.execute(inserir_autor_query)
                    connection.commit();
                print("\n")
            elif menu=="3":
                print("\n---Modo: Administrador | Ação: Inserir Categorias de Livros---\n")
                codigo_categoria_inserir =  int(input("\nDigite o código numérico para representar a nova categoria: "))
                keyword_categoria_inserir = input("\nDigite a palavra-chave que descreve a categoria: ")
                
                inserir_categoria_query = 'INSERT INTO `equipe473532`.`categoria` (`codigo_da_categoria`, `descricao`) VALUES ("{codigo_categoria_inserir}", "{keyword_categoria_inserir}");'.format(codigo_categoria_inserir=codigo_categoria_inserir, keyword_categoria_inserir=keyword_categoria_inserir)
                with connection.cursor() as cursor:
                    cursor.execute(inserir_categoria_query)
                    connection.commit();
                print("\n")
            elif menu=="4":
                print("\n---Modo: Administrador | Ação: Inserir Cursos---\n")
                codigo_curso_inserir =  int(input("\nDigite o código numérico para representar o novo curso: "))
                nome_curso_inserir = input("\nDigite o nome do novo curso: ")
                
                inserir_curso_query = 'INSERT INTO `equipe473532`.`cursos` (`cod_curso`, `nome_curso`) VALUES ("{codigo_curso_inserir}", "{nome_curso_inserir}");'.format(codigo_curso_inserir=codigo_curso_inserir, nome_curso_inserir=nome_curso_inserir)
                with connection.cursor() as cursor:
                    cursor.execute(inserir_curso_query)
                    connection.commit();
                print("\n")
            elif menu=="5":
                print("\n---Modo: Administrador | Ação: Inserir Funcionarios---\n")
                matricula_funcionario_inserir =  int(input("\nDigite a matrícula do(a) funcionario(a): "))
                nome_funcionario_inserir = input("\nDigite o nome do(a) funcionario(a): ")
                endereco_funcionario_inserir = input("\nDigite o endereco do(a) funcionario(a): ")
                id_usuario_funcionario_inserir =  int(input("\nDigite o código ID do usuario do(a) funcionário(a): "))
                login_usuario_funcionario_inserir =  input("\nDigite o LOGIN do usuario do(a) funcionário(a): ")
                senha_usuario_funcionario_inserir =  input("\nDigite a SENHA do usuario do(a) funcionário(a): ")


                inserir_usuario_funcionario_fk_query = 'INSERT INTO  `equipe473532`.`usuarios` (`id`, `login`, `senha`, `tipo_usuario`) VALUES ({id_usuario_funcionario_inserir}, "{login_usuario_funcionario_inserir}", "{senha_usuario_funcionario_inserir}", "funcionarios");'.format(id_usuario_funcionario_inserir=id_usuario_funcionario_inserir, login_usuario_funcionario_inserir=login_usuario_funcionario_inserir, senha_usuario_funcionario_inserir=senha_usuario_funcionario_inserir)
                inserir_funcionario_query = 'INSERT INTO `equipe473532`.`funcionarios` (`matricula_funcionario`, `nome`, `endereco`, `id_usuario`) VALUES ({matricula_funcionario_inserir}, "{nome_funcionario_inserir}", "{endereco_funcionario_inserir}", {id_usuario_funcionario_inserir});'.format(matricula_funcionario_inserir=matricula_funcionario_inserir, nome_funcionario_inserir=nome_funcionario_inserir, endereco_funcionario_inserir=endereco_funcionario_inserir, id_usuario_funcionario_inserir=id_usuario_funcionario_inserir)
                with connection.cursor() as cursor:
                    cursor.execute(inserir_usuario_funcionario_fk_query)
                    connection.commit();
                with connection.cursor() as cursor:
                    cursor.execute(inserir_funcionario_query)
                    connection.commit();
                print("\n")
            elif menu=="6":
                print("\n---Modo: Administrador | Ação: Inserir Professores---\n")
                mat_siape_professor_inserir =  int(input("\nDigite a matrícula SIAPE do(a) professor(a): "))
                nome_professor_inserir = input("\nDigite o nome do(a) professor(a): ")
                endereco_professor_inserir = input("\nDigite o endereco do(a) professor(a): ")
                telefone_celular_professor_inserir = input("\nDigite o telefone celular do(a) professor(a): ")
                codigo_curso_professor_inserir = int(input("\nDigite o código numérico do curso do(a) professor(a): "))
                data_contratacao_professor_inserir = input("\nDigite a data de contratacao do(a) professor(a) no formato AAAA-MM-DD: ")
                regime_de_trabalho_professor_inserir = input("\nDigite o regime de trabalho do(a) professor(a) (opcoes: 20h, 40h ou DE): ")
                
                inserir_professor_query = 'INSERT INTO `equipe473532`.`professores` (`mat_siape`, `nome`, `endereco`, `telefone_celular`, `codigo_curso`, `data_de_contratacao`, `regime_de_trabalho`) VALUES ({mat_siape_professor_inserir}, "{nome_professor_inserir}", "{endereco_professor_inserir}", "{telefone_celular_professor_inserir}", {codigo_curso_professor_inserir}, DATE "{data_contratacao_professor_inserir}", "{regime_de_trabalho_professor_inserir}");'.format(mat_siape_professor_inserir=mat_siape_professor_inserir, nome_professor_inserir=nome_professor_inserir, endereco_professor_inserir=endereco_professor_inserir, telefone_celular_professor_inserir=telefone_celular_professor_inserir, codigo_curso_professor_inserir=codigo_curso_professor_inserir, data_contratacao_professor_inserir=data_contratacao_professor_inserir, regime_de_trabalho_professor_inserir=regime_de_trabalho_professor_inserir)
                with connection.cursor() as cursor:
                    cursor.execute(inserir_professor_query)
                    connection.commit();
                print("\n")
            elif menu=="7":
                print("\n---Modo: Administrador | Ação: Inserir Alunos---\n")
                mat_aluno_inserir =  int(input("\nDigite a matrícula do(a) aluno(a): "))
                nome_aluno_inserir = input("\nDigite o nome do(a) aluno(a): ")
                codigo_curso_aluno_inserir = int(input("\nDigite o código numérico do curso do(a) aluno(a): "))
                endereco_aluno_inserir = input("\nDigite o endereco do(a) aluno(a): ")
                data_ingresso_aluno_inserir = input("\nDigite a data de ingresso do(a) aluno(a) no formato AAAA-MM-DD: ")
                data_conclusao_prev_aluno_inserir = input("\nDigite a data de conclusao prevista do(a) aluno(a) no formato AAAA-MM-DD: ")
                
                id_usuario_aluno_inserir =  int(input("\nDigite o código ID do usuario do(a) aluno(a): "))
                login_usuario_aluno_inserir =  input("\nDigite o LOGIN do usuario do(a) aluno(a): ")
                senha_usuario_aluno_inserir =  input("\nDigite a SENHA do usuario do(a) aluno(a): ")


                inserir_usuario_aluno_fk_query = 'INSERT INTO  `equipe473532`.`usuarios` (`id`, `login`, `senha`, `tipo_usuario`) VALUES ({id_usuario_aluno_inserir}, "{login_usuario_aluno_inserir}", "{senha_usuario_aluno_inserir}", "alunos");'.format(id_usuario_aluno_inserir=id_usuario_aluno_inserir, login_usuario_aluno_inserir=login_usuario_aluno_inserir, senha_usuario_aluno_inserir=senha_usuario_aluno_inserir)
                
                with connection.cursor() as cursor:
                    cursor.execute(inserir_usuario_aluno_fk_query)
                    connection.commit();

                inserir_aluno_query = 'INSERT INTO `equipe473532`.`alunos` (`matricula_aluno`, `nome`, `cod_curso`, `endereco`, `data_de_ingresso`, `data_de_conclusao_prevista`, `id_usuario`) VALUES ({mat_aluno_inserir}, "{nome_aluno_inserir}", {codigo_curso_aluno_inserir}, "{endereco_aluno_inserir}", DATE "{data_ingresso_aluno_inserir}", DATE "{data_conclusao_prev_aluno_inserir}", {id_usuario_aluno_inserir});'.format(mat_aluno_inserir=mat_aluno_inserir, nome_aluno_inserir=nome_aluno_inserir, codigo_curso_aluno_inserir=codigo_curso_aluno_inserir, endereco_aluno_inserir=endereco_aluno_inserir, data_ingresso_aluno_inserir=data_ingresso_aluno_inserir, data_conclusao_prev_aluno_inserir=data_conclusao_prev_aluno_inserir, id_usuario_aluno_inserir=id_usuario_aluno_inserir)
                
                with connection.cursor() as cursor:
                    cursor.execute(inserir_aluno_query)
                    connection.commit();

                estadoInserirTelAlunos = 1
                while(estadoInserirTelAlunos == 1):
                    id_telefone_aluno_inserir =  int(input("\nDigite o código ID do telefone do(a) aluno(a): "))
                    telefone_aluno_inserir = input("\nDigite o telefone do(a) aluno(a): ")
                    inserir_telefone_aluno_query = 'INSERT INTO `equipe473532`.`telefones_alunos` (`telefone_ID`, `numero_telefone`, `matricula_aluno`) VALUES ({id_telefone_aluno_inserir}, "{telefone_aluno_inserir}", {mat_aluno_inserir});'.format(id_telefone_aluno_inserir=id_telefone_aluno_inserir, telefone_aluno_inserir=telefone_aluno_inserir, mat_aluno_inserir=mat_aluno_inserir)
                    with connection.cursor() as cursor:
                        cursor.execute(inserir_telefone_aluno_query)
                        connection.commit();
                    estadoInserirTelAlunos = int(input("\nPara inserir outro telefone, digite <1>. Caso contrário, digite qualquer outra tecla. Digite: "))
                    print("\n")
                print("\n")

        connection.close();
except Error as e:
    print(e)

