from getpass import getpass
from mysql.connector import connect, Error

try:
    with connect(
        host="localhost",
        user=input("Digite o nome de usuário do MySQL: "),
        password=getpass("Digite a senha do MySQL: "),
        database="equipe473532",
    ) as connection:
        print(connection)

        menu="1"
        while menu=="1" or menu=="2" or menu=="3":
            menu=input("Escolha a ação: " +
                        "\n<1> - para Listar Livros" +
                        "\n<2> - para Listar Autores" +
                        "\n<3> - para Listar Categorias de Livros" +
                        "\nDigite: ")
            if menu=="1":
                listar_livros_query = "SELECT * FROM livros"
                with connection.cursor() as cursor:
                    cursor.execute(listar_livros_query)
                    resultado = cursor.fetchall()
                    for linha in resultado:
                        print(linha)
            elif menu=="2":
                listar_autores_query = "SELECT * FROM autores"
                with connection.cursor() as cursor:
                    cursor.execute(listar_autores_query)
                    resultado = cursor.fetchall()
                    for linha in resultado:
                        print(linha)
            elif menu=="3":
                listar_categorias_query = "SELECT * FROM categoria"
                with connection.cursor() as cursor:
                    cursor.execute(listar_categorias_query)
                    resultado = cursor.fetchall()
                    for linha in resultado:
                        print(linha)

        connection.close();
except Error as e:
    print(e)

