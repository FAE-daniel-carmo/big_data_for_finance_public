import os
import psycopg2
from dotenv import load_dotenv

# Carrega as variáveis do arquivo .env
load_dotenv()

def conectar_bd():
    try:
        # Obtém as credenciais das variáveis de ambiente
        connection = psycopg2.connect(
            host=os.getenv("DB_HOST"),
            database=os.getenv("DB_NAME"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD"),
            port=os.getenv("DB_PORT")
        )
        
        print("Conexão estabelecida com sucesso!")
        
        # Exemplo: Criar um cursor para executar comandos
        cursor = connection.cursor()
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"Versão do PostgreSQL: {db_version}")
        
        # Fecha a conexão
        cursor.close()
        connection.close()
        print("Conexão encerrada.")

    except Exception as error:
        print(f"Erro ao conectar ao banco de dados: {error}")

if __name__ == "__main__":
    conectar_bd()
