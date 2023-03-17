import pandas as pd
import os
import glob

c = 1
for f_i in glob.glob('f1_dataset/*.csv'):
    print(f_i)
    df_i = pd.read_csv(f_i, na_values=['\\N'])

    table_name = os.path.basename(f_i).split('.')[0]
    file_name = f'V{200+c}__create_table_{table_name}.sql'
    msg = f'CREATE TABLE bronze.{table_name} ('
    for col_j, type_j in zip(df_i.columns, df_i.dtypes):
        if pd.api.types.is_integer_dtype(type_j):
            t = f'\n\t{col_j} INTEGER,'
            msg += t
        elif pd.api.types.is_float_dtype(type_j):
            t = f'\n\t{col_j} FLOAT,'
            msg += t
        elif pd.api.types.is_string_dtype(type_j):
            t = f'\n\t{col_j} TEXT,'
            msg += t
        else:
            print('Opus')

    msg = msg[:-1] + '\n)'

    with open(f'flyway/tables/{file_name}', 'w') as f:
        f.write(msg)

    c += 1
    #print(msg)
    print('----------------------')