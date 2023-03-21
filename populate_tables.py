import pandas as pd
import os
import psycopg2
from sqlalchemy import create_engine
import datetime

list_sorted_by_order_of_insertion = [
    'circuits.csv',
    'drivers.csv',
    'constructors.csv',
    'seasons.csv',
    'status.csv',
    'races.csv',
    'sprint_results.csv',
    'results.csv',
    'constructor_standings.csv',
    'driver_standings.csv',
    'qualifying.csv',
    'constructor_results.csv',
    'pit_stops.csv',
    'lap_times.csv'
]
c = 1
for f_i in list_sorted_by_order_of_insertion:
    f_i = os.path.join('f1_dataset', f_i)
    print(f_i)
    df_i = pd.read_csv(f_i, na_values=['\\N'])
    df_i.columns = df_i.columns.str.lower()

    table_name = os.path.basename(f_i).split('.')[0].lower()

    database = os.environ.get('DB_DATABASE_NAME')
    user = os.environ.get('DB_USER')
    password = os.environ.get('DB_PASSWORD')
    host = os.environ.get('DB_HOST')
    port = os.environ.get('DB_PORT')

    # create connection
    url = f'postgresql+psycopg2://{user}:{password}@{host}:{port}/{database}'
    engine = create_engine(url)

    try:
        df_i.to_sql(
            table_name,
            con=engine,
            schema='bronze',
            if_exists='append',
            index=False
        )
    except Exception as e:
        dt = datetime.datetime.now().strftime('%y-%m-%dH%H-%M-%S')
        error_file = f'{dt}_error_log_{table_name}.log'
        with open(f'{error_file}', 'w') as f:
            f.write(e)
        print(f'Error while inserting data for table {table_name} with error {error_file}')

    print('----------------------')