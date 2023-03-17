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

    database = 'ae_training'
    user = 'dip_admin'
    password = 'Digi_rOOt123!'
    host = 'dip-analytics-engineer-training-postgresql.postgres.database.azure.com'
    port = '5432'

    # create connection
    url = f'postgresql+psycopg2://{user}:{password}@{host}:{port}/{database}'
    engine = create_engine(url)
    ##conn = psycopg2.connect(database=database, user=user, password=password, host=host, port=port)

    df_i.to_sql(table_name, con=engine, schema='bronze', if_exists='replace', index=False)

    print('----------------------')