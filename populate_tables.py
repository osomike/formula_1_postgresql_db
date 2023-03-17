import pandas as pd
import os
import glob
import psycopg2
from sqlalchemy import create_engine

c = 1
for f_i in glob.glob('f1_dataset/*.csv'):
    print(f_i)
    df_i = pd.read_csv(f_i, na_values=['\\N'])

    table_name = os.path.basename(f_i).split('.')[0]

    database = os.environ.get('DB_DATABASE_NAME')
    user = os.environ.get('DB_USER')
    password = os.environ.get('DB_PASSWORD')
    host = os.environ.get('DB_HOST')
    port = os.environ.get('DB_PORT')

    # create connection
    url = f'postgresql+psycopg2://{user}:{password}@{host}:{port}/{database}'
    engine = create_engine(url)

    df_i.to_sql(table_name, con=engine, schema='bronze', if_exists='replace', index=False)

    print('----------------------')