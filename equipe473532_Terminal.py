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

def telaBDlogado():
    print("\n")
    print("\nBem-vindo!\n")
    return int(input("Escolha a ação: " +
                        "\n<1> - para Fazer Insercoes (somente Admin)" +
                        "\n<2> - para Fazer Remocoes (somente Admin)" +
                        "\n<3> - para Fazer Alteracoes" +
                        "\n<4> - para Fazer Consultas" +
                        "\n<ou qualquer outra tecla> - para Sair" +
                        "\nDigite: "))

try:
    with connect(
        host="localhost",
        user=input("Digite o LOGIN do usuário dentro do Banco de Dados da biblioteca: "),
        password=getpass("Digite a SENHA do usuário dentro do BD da biblioteca (a senha é ocultada neste terminal): "),
        database="equipe473532",
    ) as connection:
        print(connection)

        #loginUsuarioBD = input("\nDigite o LOGIN do usuário dentro do Banco de Dados da biblioteca: ")
        #senhaUsuarioBD = getpass("\nDigite a SENHA do usuário dentro do BD da biblioteca (a senha é ocultada neste terminal): ")
        
        #logarUsuarioBD = 'mysql -u {loginUsuarioBD} -p'.format(loginUsuarioBD=loginUsuarioBD)

        #with connection.cursor() as cursor:
        #    cursor.execute(logarUsuarioBD)
        #    connection.commit();
        #print("\n")

        opcaoBDlogado = telaBDlogado();

        if(opcaoBDlogado == 1):#Opção 1 => Fazer inserções como Administrador
            menu="1"
            print("\n")
            while menu=="1" or menu=="2" or menu=="3" or menu=="4" or menu=="5" or menu=="6" or menu=="7":
                menu=input("Escolha a ação: " +
                            "\n<1> - para Inserir Livros" +
                            "\n<2> - para Inserir Autores" +
                            "\n<3> - para Inserir Categorias de Livros" +
                            "\n<4> - para Inserir Cursos" +
                            "\n<5> - para Inserir Funcionarios" +
                            "\n<6> - para Inserir Professores" +
                            "\n<7> - para Inserir Alunos" +
                            "\n<ou qualquer outra tecla> - para Sair" +
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
                        print("\nInfo: Insercao do livro feita com sucesso!\n")
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
                        print("\nInfo: Insercao do(a) autor(a) feita com sucesso!\n")
                    print("\n")
                elif menu=="3":
                    print("\n---Modo: Administrador | Ação: Inserir Categorias de Livros---\n")
                    codigo_categoria_inserir =  int(input("\nDigite o código numérico para representar a nova categoria: "))
                    keyword_categoria_inserir = input("\nDigite a palavra-chave que descreve a categoria: ")
                    
                    inserir_categoria_query = 'INSERT INTO `equipe473532`.`categoria` (`codigo_da_categoria`, `descricao`) VALUES ("{codigo_categoria_inserir}", "{keyword_categoria_inserir}");'.format(codigo_categoria_inserir=codigo_categoria_inserir, keyword_categoria_inserir=keyword_categoria_inserir)
                    with connection.cursor() as cursor:
                        cursor.execute(inserir_categoria_query)
                        connection.commit();
                        print("\nInfo: Insercao da categoria feita com sucesso!\n")
                    print("\n")
                elif menu=="4":
                    print("\n---Modo: Administrador | Ação: Inserir Cursos---\n")
                    codigo_curso_inserir =  int(input("\nDigite o código numérico para representar o novo curso: "))
                    nome_curso_inserir = input("\nDigite o nome do novo curso: ")
                    
                    inserir_curso_query = 'INSERT INTO `equipe473532`.`cursos` (`cod_curso`, `nome_curso`) VALUES ("{codigo_curso_inserir}", "{nome_curso_inserir}");'.format(codigo_curso_inserir=codigo_curso_inserir, nome_curso_inserir=nome_curso_inserir)
                    with connection.cursor() as cursor:
                        cursor.execute(inserir_curso_query)
                        connection.commit();
                        print("\nInfo: Insercao do curso feita com sucesso!\n")
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
                        print("\nInfo: Insercao do login e senha do usuario feita com sucesso!\n")
                    with connection.cursor() as cursor:
                        cursor.execute(inserir_funcionario_query)
                        connection.commit();
                        print("\nInfo: Insercao do funcionario feita com sucesso!\n")
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
                        print("\nInfo: Insercao do(a) professor(a) feita com sucesso!\n")
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
                        print("\nInfo: Insercao do login e senha do usuario feita com sucesso!\n")

                    inserir_aluno_query = 'INSERT INTO `equipe473532`.`alunos` (`matricula_aluno`, `nome`, `cod_curso`, `endereco`, `data_de_ingresso`, `data_de_conclusao_prevista`, `id_usuario`) VALUES ({mat_aluno_inserir}, "{nome_aluno_inserir}", {codigo_curso_aluno_inserir}, "{endereco_aluno_inserir}", DATE "{data_ingresso_aluno_inserir}", DATE "{data_conclusao_prev_aluno_inserir}", {id_usuario_aluno_inserir});'.format(mat_aluno_inserir=mat_aluno_inserir, nome_aluno_inserir=nome_aluno_inserir, codigo_curso_aluno_inserir=codigo_curso_aluno_inserir, endereco_aluno_inserir=endereco_aluno_inserir, data_ingresso_aluno_inserir=data_ingresso_aluno_inserir, data_conclusao_prev_aluno_inserir=data_conclusao_prev_aluno_inserir, id_usuario_aluno_inserir=id_usuario_aluno_inserir)
                    
                    with connection.cursor() as cursor:
                        cursor.execute(inserir_aluno_query)
                        connection.commit();
                        print("\nInfo: Insercao do(a) aluno(a) feita com sucesso!\n")

                    estadoInserirTelAlunos = 1
                    while(estadoInserirTelAlunos == 1):
                        id_telefone_aluno_inserir =  int(input("\nDigite o código ID do telefone do(a) aluno(a): "))
                        telefone_aluno_inserir = input("\nDigite o telefone do(a) aluno(a): ")
                        inserir_telefone_aluno_query = 'INSERT INTO `equipe473532`.`telefones_alunos` (`telefone_ID`, `numero_telefone`, `matricula_aluno`) VALUES ({id_telefone_aluno_inserir}, "{telefone_aluno_inserir}", {mat_aluno_inserir});'.format(id_telefone_aluno_inserir=id_telefone_aluno_inserir, telefone_aluno_inserir=telefone_aluno_inserir, mat_aluno_inserir=mat_aluno_inserir)
                        with connection.cursor() as cursor:
                            cursor.execute(inserir_telefone_aluno_query)
                            connection.commit();
                            print("\nInfo: Insercao do telefone feita com sucesso!\n")
                        estadoInserirTelAlunos = int(input("\nPara inserir outro telefone, digite <1>. Caso contrário, digite qualquer outra tecla. Digite: "))
                        print("\n")
                    print("\n")
        elif(opcaoBDlogado == 2):#Opção 2 => Fazer remoções como Administrador
            menu="1"
            print("\n")
            while menu=="1" or menu=="2" or menu=="3" or menu=="4" or menu=="5" or menu=="6" or menu=="7":
                menu=input("Escolha a ação: " +
                            "\n<1> - para Remover Livros" +
                            "\n<2> - para Remover Autores" +
                            "\n<3> - para Remover Categorias de Livros" +
                            "\n<4> - para Remover Cursos" +
                            "\n<5> - para Remover Funcionarios" +
                            "\n<6> - para Remover Professores" +
                            "\n<7> - para Remover Alunos" +
                            "\n<ou qualquer outra tecla> - para Sair" +
                            "\nDigite: ")
                if menu=="1":
                    print("\n---Modo: Administrador | Ação: Remover Livros---\n")
                    isbn_livro_remover =  int(input("\nDigite o ISBN do livro: "))
                    
                    remover_livros_query = 'DELETE FROM `equipe473532`.`livros` WHERE `ISBN` = {isbn_livro_remover};'.format(isbn_livro_remover=isbn_livro_remover)
                    with connection.cursor() as cursor:
                        cursor.execute(remover_livros_query)
                        connection.commit();
                        print("\nInfo: Remocao do livro feita com sucesso!\n")
                    print("\n")
                elif menu=="2":
                    print("\n---Modo: Administrador | Ação: Remover Autores---\n")
                    email_autor_remover =  input("\nDigite o e-mail do(a) autor(a): ")
                    
                    remover_autor_query = 'DELETE FROM `equipe473532`.`autores` WHERE `email` = {email_autor_remover};'.format(email_autor_remover=email_autor_remover)
                    with connection.cursor() as cursor:
                        cursor.execute(remover_autor_query)
                        connection.commit();
                        print("\nInfo: Remocao do(a) autor(a) feita com sucesso!\n")
                    print("\n")
                elif menu=="3":
                    print("\n---Modo: Administrador | Ação: Remover Categorias de Livros---\n")
                    codigo_categoria_remover =  int(input("\nDigite o código numérico da categoria: "))
                    
                    remover_categoria_query = 'DELETE FROM `equipe473532`.`categoria` WHERE `codigo_da_categoria` = {codigo_categoria_remover};'.format(codigo_categoria_remover=codigo_categoria_remover)
                    with connection.cursor() as cursor:
                        cursor.execute(remover_categoria_query)
                        connection.commit();
                        print("\nInfo: Remocao da categoria feita com sucesso!\n")
                    print("\n")
                elif menu=="4":
                    print("\n---Modo: Administrador | Ação: Remover Cursos---\n")
                    codigo_curso_remover =  int(input("\nDigite o código numérico do curso: "))
                    
                    remover_curso_query = 'DELETE FROM `equipe473532`.`cursos` WHERE `cod_curso` = {codigo_curso_remover};'.format(codigo_curso_remover=codigo_curso_remover)
                    with connection.cursor() as cursor:
                        cursor.execute(remover_curso_query)
                        connection.commit();
                        print("\nInfo: Remocao do curso feita com sucesso!\n")
                    print("\n")
                elif menu=="5":
                    print("\n---Modo: Administrador | Ação: Remover Funcionarios---\n")
                    matricula_funcionario_remover =  int(input("\nDigite a matrícula do(a) funcionario(a): "))
                    id_usuario_funcionario_remover =  int(input("\nDigite o código ID do usuario do(a) funcionário(a): "))


                    remover_usuario_funcionario_fk_query = 'DELETE FROM `equipe473532`.`usuarios` WHERE `id` = {id_usuario_funcionario_remover};'.format(id_usuario_funcionario_remover=id_usuario_funcionario_remover)
                    remover_funcionario_query = 'DELETE FROM `equipe473532`.`funcionarios` WHERE `matricula_funcionario` = {matricula_funcionario_remover};'.format(matricula_funcionario_remover=matricula_funcionario_remover)
                    with connection.cursor() as cursor:
                        cursor.execute(remover_usuario_funcionario_fk_query)
                        connection.commit();
                        print("\nInfo: Remocao do login e senha do usuario feita com sucesso!\n")
                    with connection.cursor() as cursor:
                        cursor.execute(remover_funcionario_query)
                        connection.commit();
                        print("\nInfo: Remocao do funcionario feita com sucesso!\n")
                    print("\n")
                elif menu=="6":
                    print("\n---Modo: Administrador | Ação: Remover Professores---\n")
                    mat_siape_professor_remover =  int(input("\nDigite a matrícula SIAPE do(a) professor(a): "))
                    
                    remover_professor_query = 'DELETE FROM `equipe473532`.`professores` WHERE `mat_siape` = {mat_siape_professor_remover};'.format(mat_siape_professor_remover=mat_siape_professor_remover)
                    with connection.cursor() as cursor:
                        cursor.execute(remover_professor_query)
                        connection.commit();
                        print("\nInfo: Remocao do(a) professor(a) feita com sucesso!\n")
                    print("\n")
                elif menu=="7":
                    print("\n---Modo: Administrador | Ação: Remover Alunos---\n")
                    mat_aluno_remover =  int(input("\nDigite a matrícula do(a) aluno(a): "))
                    
                    id_usuario_aluno_remover =  int(input("\nDigite o código ID do usuario do(a) aluno(a): "))

                    remover_usuario_aluno_fk_query = 'DELETE FROM `equipe473532`.`usuarios` WHERE `id` = {id_usuario_aluno_remover};'.format(id_usuario_aluno_remover=id_usuario_aluno_remover)
                    
                    with connection.cursor() as cursor:
                        cursor.execute(remover_usuario_aluno_fk_query)
                        connection.commit();
                        print("\nInfo: Remocao do login e senha do usuario feita com sucesso!\n")

                    remover_telefones_alunos_query = 'DELETE FROM `equipe473532`.`telefones_alunos` WHERE `matricula_aluno` = {mat_aluno_remover};'.format(mat_aluno_remover=mat_aluno_remover)
                    remover_aluno_query = 'DELETE FROM `equipe473532`.`alunos` WHERE `matricula_aluno` = {mat_aluno_remover};'.format(mat_aluno_remover=mat_aluno_remover)
                    
                    with connection.cursor() as cursor:
                        cursor.execute(remover_telefones_alunos_query)
                        connection.commit();
                        cursor.execute(remover_aluno_query)
                        connection.commit();
                        print("\nInfo: Remocao do(a) aluno(a) feita com sucesso!\n")

                    
                    print("\n")
        elif(opcaoBDlogado == 3):#Opção 3 => Fazer alterações como Administrador/Bibliotecario
            menu="1"
            print("\n")
            while menu=="1" or menu=="2" or menu=="3" or menu=="4" or menu=="5" or menu=="6" or menu=="7":
                menu=input("Escolha a ação: " +
                            "\n<1> - para Alterar Livros" +
                            "\n<2> - para Alterar Autores" +
                            "\n<3> - para Alterar Categorias de Livros" +
                            "\n<4> - para Alterar Cursos" +
                            "\n<5> - para Alterar Funcionarios" +
                            "\n<6> - para Alterar Professores" +
                            "\n<7> - para Alterar Alunos" +
                            "\n<ou qualquer outra tecla> - para Sair" +
                            "\nDigite: ")
                if menu=="1":
                    print("\n---Modo: Administrador/Bibliotecario | Ação: Alterar Livros---\n")
                    isbn_livro_pk_antiga =  int(input("\nDigite o ISBN do livro a ser alterado: "))
                    isbn_livro_pk_nova =  int(input("\nDigite o novo ISBN do livro: "))
                    titulo_do_livro_nova = input("\nDigite o novo titulo do livro: ")
                    ano_lancamento_do_livro_nova = int(input("\nDigite o novo ano de lancamento do livro: "))
                    editora_do_livro_nova = input("\nDigite a nova editora do livro: ")
                    qtd_copias_do_livro_nova = int(input("\nDigite a nova quantidade de cópias do livro: "))
                    cod_categoria_do_livro_nova = int(input("\nDigite o novo codigo da categoria do livro: "))
                    nome_autor_do_livro_nova = input("\nDigite o(s) novo(s) nome(s) do(s) autor(es) do livro: ")
                    
                    alterar_livros_query = 'UPDATE `equipe473532`.`livros` SET `ISBN` = {isbn_livro_pk_nova}, `titulo` = "{titulo_do_livro_nova}", `ano_lancamento` = {ano_lancamento_do_livro_nova}, `editora` = "{editora_do_livro_nova}", `quantidade_copias` = {qtd_copias_do_livro_nova}, `categoria_codigo_da_categoria` = {cod_categoria_do_livro_nova}, `autores` = "{nome_autor_do_livro_nova}" WHERE `ISBN` = {isbn_livro_pk_antiga};'.format(isbn_livro_pk_nova=isbn_livro_pk_nova, titulo_do_livro_nova=titulo_do_livro_nova, ano_lancamento_do_livro_nova=ano_lancamento_do_livro_nova, editora_do_livro_nova=editora_do_livro_nova, qtd_copias_do_livro_nova=qtd_copias_do_livro_nova, cod_categoria_do_livro_nova=cod_categoria_do_livro_nova, nome_autor_do_livro_nova=nome_autor_do_livro_nova, isbn_livro_pk_antiga=isbn_livro_pk_antiga)
                    with connection.cursor() as cursor:
                        cursor.execute(alterar_livros_query)
                        connection.commit();
                        print("\nInfo: Alteracao do livro feita com sucesso!\n")
                    print("\n")
                elif menu=="2":
                    print("\n---Modo: Administrador/Bibliotecario | Ação: Alterar Autores---\n")
                    email_autor_pk_antiga =  input("\nDigite o e-mail do(a) autor(a) a ser alterado(a): ")
                    email_autor_pk_nova =  input("\nDigite o novo e-mail do(a) autor(a): ")
                    nome_autor_nova = input("\nDigite o novo nome do(a) autor(a): ")
                    nacionalidade_autor_nova = input("\nDigite a nova nacionalidade do(a) autor(a): ")
                    
                    alterar_autor_query = 'UPDATE `equipe473532`.`autores` SET `email` = "{email_autor_pk_nova}", `nome` = "{nome_autor_nova}", `nacionalidade` = "{nacionalidade_autor_nova}" WHERE `email` = {email_autor_pk_antiga};'.format(email_autor_pk_nova=email_autor_pk_nova, nome_autor_nova=nome_autor_nova, nacionalidade_autor_nova=nacionalidade_autor_nova, email_autor_pk_antiga=email_autor_pk_antiga)
                    with connection.cursor() as cursor:
                        cursor.execute(alterar_autor_query)
                        connection.commit();
                        print("\nInfo: Alteracao do(a) autor(a) feita com sucesso!\n")
                    print("\n")
                elif menu=="3":
                    print("\n---Modo: Administrador/Bibliotecario | Ação: Alterar Categorias de Livros---\n")
                    codigo_categoria_pk_antiga =  int(input("\nDigite o codigo numerico da categoria a ser alterada: "))
                    codigo_categoria_pk_nova =  int(input("\nDigite o novo codigo numerico para representar a categoria: "))
                    keyword_categoria_nova = input("\nDigite a nova palavra-chave que descreve a categoria: ")
                    
                    alterar_categoria_query = 'UPDATE `equipe473532`.`categoria` SET `codigo_da_categoria` = {codigo_categoria_pk_nova}, `descricao` = "{keyword_categoria_nova}" WHERE `codigo_da_categoria` = {codigo_categoria_pk_antiga};'.format(codigo_categoria_pk_nova=codigo_categoria_pk_nova, keyword_categoria_nova=keyword_categoria_nova, codigo_categoria_pk_antiga=codigo_categoria_pk_antiga)
                    with connection.cursor() as cursor:
                        cursor.execute(alterar_categoria_query)
                        connection.commit();
                        print("\nInfo: Alteracao da categoria feita com sucesso!\n")
                    print("\n")
                elif menu=="4":
                    print("\n---Modo: Administrador/Bibliotecario | Ação: Alterar Cursos---\n")
                    codigo_curso_pk_antiga =  int(input("\nDigite o codigo numerico do curso a ser alterado: "))
                    codigo_curso_pk_nova =  int(input("\nDigite o novo codigo numerico do curso: "))
                    nome_curso_nova = input("\nDigite o novo nome do curso: ")
                    
                    alterar_curso_query = 'UPDATE `equipe473532`.`cursos` SET `cod_curso` = {codigo_curso_pk_nova}, `nome_curso` = "{nome_curso_nova}" WHERE `cod_curso` = {codigo_curso_pk_antiga};'.format(codigo_curso_pk_nova=codigo_curso_pk_nova, nome_curso_nova=nome_curso_nova, codigo_curso_pk_antiga=codigo_curso_pk_antiga)
                    with connection.cursor() as cursor:
                        cursor.execute(alterar_curso_query)
                        connection.commit();
                        print("\nInfo: Alteracao do curso feita com sucesso!\n")
                    print("\n")
                elif menu=="5":
                    print("\n---Modo: Administrador/Bibliotecario | Ação: Alterar Funcionarios---\n")
                    matricula_funcionario_pk_antiga =  int(input("\nDigite a matrícula do(a) funcionario(a) a ser alterado(a): "))
                    matricula_funcionario_pk_nova =  int(input("\nDigite a nova matrícula do(a) funcionario(a): "))
                    nome_funcionario_nova = input("\nDigite o novo nome do(a) funcionario(a): ")
                    endereco_funcionario_nova = input("\nDigite o novo endereco do(a) funcionario(a): ")
                    id_usuario_funcionario_antiga =  int(input("\nDigite o código ID do usuario a ser alterado do(a) funcionário(a): "))
                    id_usuario_funcionario_nova =  int(input("\nDigite o novo código ID do usuario do(a) funcionário(a): "))
                    login_usuario_funcionario_nova =  input("\nDigite o novo LOGIN do usuario do(a) funcionário(a): ")
                    senha_usuario_funcionario_nova =  input("\nDigite a nova SENHA do usuario do(a) funcionário(a): ")


                    alterar_usuario_funcionario_fk_query = 'UPDATE  `equipe473532`.`usuarios` SET `id` = {id_usuario_funcionario_nova}, `login` = "{login_usuario_funcionario_nova}", `senha` = "{senha_usuario_funcionario_nova}") WHERE `id` = {id_usuario_funcionario_antiga};'.format(id_usuario_funcionario_nova=id_usuario_funcionario_nova, login_usuario_funcionario_nova=login_usuario_funcionario_nova, senha_usuario_funcionario_nova=senha_usuario_funcionario_nova, id_usuario_funcionario_antiga=id_usuario_funcionario_antiga)
                    alterar_funcionario_query = 'UPDATE `equipe473532`.`funcionarios` SET `matricula_funcionario` = {matricula_funcionario_pk_nova}, `nome` = "{nome_funcionario_nova}", `endereco` = "{endereco_funcionario_nova}", `id_usuario` = {id_usuario_funcionario_nova}) WHERE `matricula_funcionario` = {matricula_funcionario_pk_antiga};'.format(matricula_funcionario_pk_nova=matricula_funcionario_pk_nova, nome_funcionario_nova=nome_funcionario_nova, endereco_funcionario_nova=endereco_funcionario_nova, id_usuario_funcionario_nova=id_usuario_funcionario_nova, matricula_funcionario_pk_antiga=matricula_funcionario_pk_antiga)
                    with connection.cursor() as cursor:
                        cursor.execute(alterar_usuario_funcionario_fk_query)
                        connection.commit();
                        print("\nInfo: Alteracao do login e senha do usuario feita com sucesso!\n")
                    with connection.cursor() as cursor:
                        cursor.execute(alterar_funcionario_query)
                        connection.commit();
                        print("\nInfo: Alteracao do(a) funcionario(a) feita com sucesso!\n")
                    print("\n")
                elif menu=="6":
                    print("\n---Modo: Administrador/Bibliotecario | Ação: Alterar Professores---\n")
                    mat_siape_professor_pk_antiga =  int(input("\nDigite a matrícula SIAPE a ser alterada do(a) professor(a): "))
                    mat_siape_professor_pk_nova =  int(input("\nDigite a nova matrícula SIAPE do(a) professor(a): "))
                    nome_professor_nova = input("\nDigite o novo nome do(a) professor(a): ")
                    endereco_professor_nova = input("\nDigite o novo endereco do(a) professor(a): ")
                    telefone_celular_professor_nova = input("\nDigite o novo telefone celular do(a) professor(a): ")
                    codigo_curso_professor_nova = int(input("\nDigite o novo código numérico do curso do(a) professor(a): "))
                    data_contratacao_professor_nova = input("\nDigite a nova data de contratacao do(a) professor(a) no formato AAAA-MM-DD: ")
                    regime_de_trabalho_professor_nova = input("\nDigite o novo regime de trabalho do(a) professor(a) (opcoes: 20h, 40h ou DE): ")
                    
                    alterar_professor_query = 'UPDATE `equipe473532`.`professores` SET `mat_siape` = {mat_siape_professor_pk_nova}, `nome` = "{nome_professor_nova}", `endereco` = "{endereco_professor_nova}", `telefone_celular` = "{telefone_celular_professor_nova}", `codigo_curso` = {codigo_curso_professor_nova}, `data_de_contratacao` = DATE "{data_contratacao_professor_nova}", `regime_de_trabalho` = "{regime_de_trabalho_professor_nova}" WHERE `mat_siape` = {mat_siape_professor_pk_antiga};'.format(mat_siape_professor_pk_nova=mat_siape_professor_pk_nova, nome_professor_nova=nome_professor_nova, endereco_professor_nova=endereco_professor_nova, telefone_celular_professor_nova=telefone_celular_professor_nova, codigo_curso_professor_nova=codigo_curso_professor_nova, data_contratacao_professor_nova=data_contratacao_professor_nova, regime_de_trabalho_professor_nova=regime_de_trabalho_professor_nova, mat_siape_professor_pk_antiga=mat_siape_professor_pk_antiga)
                    with connection.cursor() as cursor:
                        cursor.execute(alterar_professor_query)
                        connection.commit();
                        print("\nInfo: Alteracao do(a) professor(a) feita com sucesso!\n")
                    print("\n")
                elif menu=="7":
                    print("\n---Modo: Administrador/Bibliotecario | Ação: Alterar Alunos---\n")
                    mat_aluno_pk_antiga =  int(input("\nDigite a matrícula a ser alterada do(a) aluno(a): "))
                    mat_aluno_pk_nova =  int(input("\nDigite a nova matrícula do(a) aluno(a): "))
                    nome_aluno_nova = input("\nDigite o novo nome do(a) aluno(a): ")
                    codigo_curso_aluno_nova = int(input("\nDigite o novo código numérico do curso do(a) aluno(a): "))
                    endereco_aluno_nova = input("\nDigite o novo endereco do(a) aluno(a): ")
                    data_ingresso_aluno_nova = input("\nDigite a nova data de ingresso do(a) aluno(a) no formato AAAA-MM-DD: ")
                    data_conclusao_prev_aluno_nova = input("\nDigite a nova data de conclusao prevista do(a) aluno(a) no formato AAAA-MM-DD: ")
                    
                    id_usuario_aluno_pk_antiga = int(input("\nDigite o código ID do usuario a ser alterado do(a) aluno(a): "))
                    id_usuario_aluno_pk_nova = int(input("\nDigite o novo código ID do usuario do(a) aluno(a): "))
                    login_usuario_aluno_nova = input("\nDigite o novo LOGIN do usuario do(a) aluno(a): ")
                    senha_usuario_aluno_nova = input("\nDigite a nova SENHA do usuario do(a) aluno(a): ")


                    alterar_usuario_aluno_fk_query = 'UPDATE `equipe473532`.`usuarios` SET `id` = {id_usuario_aluno_pk_nova}, `login` = "{login_usuario_aluno_nova}", `senha` = "{senha_usuario_aluno_nova}" WHERE `id` = {id_usuario_aluno_pk_antiga};'.format(id_usuario_aluno_pk_nova=id_usuario_aluno_pk_nova, login_usuario_aluno_nova=login_usuario_aluno_nova, senha_usuario_aluno_nova=senha_usuario_aluno_nova, id_usuario_aluno_pk_antiga=id_usuario_aluno_pk_antiga)
                    
                    with connection.cursor() as cursor:
                        cursor.execute(alterar_usuario_aluno_fk_query)
                        connection.commit();
                        print("\nInfo: Alteracao do login e senha do usuario feita com sucesso!\n")

                    alterar_aluno_query = 'UPDATE `equipe473532`.`alunos` SET `matricula_aluno` = {mat_aluno_pk_nova}, `nome` = "{nome_aluno_nova}", `cod_curso` = {codigo_curso_aluno_nova}, `endereco` = "{endereco_aluno_nova}", `data_de_ingresso` = DATE "{data_ingresso_aluno_nova}", `data_de_conclusao_prevista` = DATE "{data_conclusao_prev_aluno_nova}", `id_usuario` = {id_usuario_aluno_pk_nova} WHERE `matricula_aluno` = {mat_aluno_pk_antiga};'.format(mat_aluno_pk_nova=mat_aluno_pk_nova, nome_aluno_nova=nome_aluno_nova, codigo_curso_aluno_nova=codigo_curso_aluno_nova, endereco_aluno_nova=endereco_aluno_nova, data_ingresso_aluno_nova=data_ingresso_aluno_nova, data_conclusao_prev_aluno_nova=data_conclusao_prev_aluno_nova, id_usuario_aluno_pk_nova=id_usuario_aluno_pk_nova, mat_aluno_pk_antiga=mat_aluno_pk_antiga)
                    
                    with connection.cursor() as cursor:
                        cursor.execute(alterar_aluno_query)
                        connection.commit();
                        print("\nInfo: Alteracao do(a) aluno(a) feita com sucesso!\n")
                    print("\n")
        elif(opcaoBDlogado == 4):#Opção 4 => Fazer consultas como Administrador/Bibliotecario/Usuario comum
            menu="1"
            print("\n")
            while menu=="1" or menu=="2" or menu=="3" or menu=="4" or menu=="5" or menu=="6" or menu=="7" or menu=="8" or menu=="9" or menu=="10" or menu=="11":
                menu=input("Escolha a ação: " +
                            "\n<1> - para Consultar Livros por Categoria" +
                            "\n<2> - para Consultar Livros por Editora" +
                            "\n<3> - para Consultar Livros por Ano" +
                            "\n<4> - para Consultar Livros por Autor" +
                            "\n<5> - para Consultar Autores" +
                            "\n<6> - para Consultar Categorias de Livros" +
                            "\n<7> - para Consultar Reservas" +
                            "\n<8> - para Consultar Cursos" +
                            "\n<9> - para Consultar Funcionarios" +
                            "\n<10> - para Consultar Professores por Curso" +
                            "\n<11> - para Consultar Alunos" +
                            "\n<ou qualquer outra tecla> - para Sair" +
                            "\nDigite: ")
                if menu=="1":
                    print("\n---Modo: Usuario comum | Ação: Consultar Livros por Categoria---\n")
                    listar_livros_por_categoria_query = 'SELECT * FROM `equipe473532`.`viewLivrosbyCategoria`;'
                    with connection.cursor() as cursor:
                        cursor.execute(listar_livros_por_categoria_query)
                        resultado = cursor.fetchall()
                        print("\n|-----ISBN-----||-----Titulo-----||-Ano de lancamento-||-Editora-||-Qtd. de copias-||-Categoria-||-----Autores-----|\n")
                        for linha in resultado:
                            print(linha)
                    print("\n")
                elif menu=="2":
                    print("\n---Modo: Usuario comum | Ação: Consultar Livros por Editora---\n")
                    listar_livros_por_editora_query = 'SELECT * FROM `equipe473532`.`viewLivrosbyEditora`;'
                    with connection.cursor() as cursor:
                        cursor.execute(listar_livros_por_editora_query)
                        resultado = cursor.fetchall()
                        print("\n|-----ISBN-----||-----Titulo-----||-Ano de lancamento-||-Editora-||-Qtd. de copias-||-Categoria-||-----Autores-----|\n")
                        for linha in resultado:
                            print(linha)
                    print("\n")
                elif menu=="3":
                    print("\n---Modo: Usuario comum | Ação: Consultar Livros por Ano---\n")
                    listar_livros_por_ano_query = 'SELECT * FROM `equipe473532`.`viewLivrosbyAno`;'
                    with connection.cursor() as cursor:
                        cursor.execute(listar_livros_por_ano_query)
                        resultado = cursor.fetchall()
                        print("\n|-----ISBN-----||-----Titulo-----||-Ano de lancamento-||-Editora-||-Qtd. de copias-||-Categoria-||-----Autores-----|\n")
                        for linha in resultado:
                            print(linha)
                    print("\n")
                elif menu=="4":
                    print("\n---Modo: Usuario comum | Ação: Consultar Livros por Autor---\n")
                    listar_livros_por_autor_query = 'SELECT * FROM `equipe473532`.`viewLivrosbyAutor`;'
                    with connection.cursor() as cursor:
                        cursor.execute(listar_livros_por_autor_query)
                        resultado = cursor.fetchall()
                        print("\n|-----ISBN-----||-----Titulo-----||-Ano de lancamento-||-Editora-||-Qtd. de copias-||-Categoria-||-----Autores-----|\n")
                        for linha in resultado:
                            print(linha)
                    print("\n")
                elif menu=="5":
                    print("\n---Modo: Usuario comum | Ação: Consultar Autores---\n")
                    listar_autores_query = 'SELECT * FROM `equipe473532`.`autores`;'
                    with connection.cursor() as cursor:
                        cursor.execute(listar_autores_query)
                        resultado = cursor.fetchall()
                        print("\n|------------Email------------||----------Nome----------||-Nacionalidade-|\n")
                        for linha in resultado:
                            print(linha)
                    print("\n")
                elif menu=="6":
                    print("\n---Modo: Usuario comum | Ação: Consultar Categorias de Livros---\n")
                    listar_categorias_query = 'SELECT * FROM `equipe473532`.`categoria`;'
                    with connection.cursor() as cursor:
                        cursor.execute(listar_categorias_query)
                        resultado = cursor.fetchall()
                        print("\n|-Cod. da categoria-||-----Descricao-----|\n")
                        for linha in resultado:
                            print(linha)
                    print("\n")
                elif menu=="7":
                    print("\n---Modo: Usuario comum | Ação: Consultar Reservas---\n")
                    listar_reservas_query = 'SELECT * FROM `equipe473532`.`reserva`;'
                    with connection.cursor() as cursor:
                        cursor.execute(listar_reservas_query)
                        resultado = cursor.fetchall()
                        print("\n|-----Usuarios ID-----||-----Livros ISBN-----||-Atendida (Estado)-||-Data da reserva-|\n")
                        for linha in resultado:
                            print(linha)
                    print("\n")
                elif menu=="8":
                    print("\n---Modo: Usuario comum | Ação: Consultar Cursos---\n")
                    listar_cursos_query = 'SELECT * FROM `equipe473532`.`cursos`;'
                    with connection.cursor() as cursor:
                        cursor.execute(listar_cursos_query)
                        resultado = cursor.fetchall()
                        print("\n|-Cod. do curso-||-----Nome do curso-----|\n")
                        for linha in resultado:
                            print(linha)
                    print("\n")
                elif menu=="9":
                    print("\n---Modo: Usuario comum | Ação: Consultar Funcionarios---\n")
                    listar_funcionarios_query = 'SELECT * FROM `equipe473532`.`funcionarios`;'
                    with connection.cursor() as cursor:
                        cursor.execute(listar_funcionarios_query)
                        resultado = cursor.fetchall()
                        print("\n|-Matricula-||-----Nome-----||-Endereco-||-ID Usuario-|\n")
                        for linha in resultado:
                            print(linha)
                    print("\n")
                elif menu=="10":
                    print("\n---Modo: Usuario comum | Ação: Consultar Professores por Curso---\n")
                    listar_professores_por_curso_query = 'SELECT * FROM `equipe473532`.`viewProfbyCurso`;'
                    with connection.cursor() as cursor:
                        cursor.execute(listar_professores_por_curso_query)
                        resultado = cursor.fetchall()
                        print("\n|-Matricula SIAPE-||-----Nome-----||-Regime de trabalho-||-Curso-|\n")
                        for linha in resultado:
                            print(linha)
                    print("\n")
                elif menu=="11":
                    print("\n---Modo: Usuario comum | Ação: Consultar Alunos---\n")
                    listar_alunos_query = 'SELECT * FROM `equipe473532`.`alunos`;'
                    with connection.cursor() as cursor:
                        cursor.execute(listar_alunos_query)
                        resultado = cursor.fetchall()
                        print("\n|-Matricula-||-----Nome-----||-Cod. do curso-||-Endereco-||-Data de ingresso-||-Data de conclusao prevista-||-ID Usuario-|\n")
                        for linha in resultado:
                            print(linha)
                    print("\n")
        connection.close();
except Error as e:
    print(e)

