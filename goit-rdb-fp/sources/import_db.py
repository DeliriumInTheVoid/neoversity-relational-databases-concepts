import pandas as pd
import argparse
from sqlalchemy import create_engine


def import_csv_to_mysql(csv_file_path, mysql_connection_string, table_name):
    df = pd.read_csv(csv_file_path)

    engine = create_engine(mysql_connection_string)

    imported = df.to_sql(table_name, con=engine, index=False, if_exists='replace')
    print(f"Imported {imported} rows from {len(df)} rows in the CSV file.")


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Import CSV data into MySQL database.')
    parser.add_argument('csv_file_path', help='Path to the CSV file to import')
    parser.add_argument('mysql_connection_string', help='MySQL connection string (e.g., mysql+pymysql://user:password@localhost/dbname)')
    parser.add_argument('table_name', help='Name of the table to create in MySQL')

    args = parser.parse_args()

    import_csv_to_mysql(args.csv_file_path, args.mysql_connection_string, args.table_name)


# Example usage:
# python import_db.py data.csv mysql+pymysql://user:password@localhost/dbname my_new_table