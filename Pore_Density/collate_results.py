import os
import pandas as pd
import matplotlib.pyplot as plt
df_collated = pd.DataFrame()
for root_path, directories, files in os.walk('.'):
    if r'production.csv' in files:
        df = pd.read_csv(os.path.join(root_path,'production.csv'),header=None)
        row = root_path.split('\\')[-1]
        df_collated.loc[row,'total_reserve'] = df.iloc[-1,3]
        df_collated.loc[row,'adsorbed_reserve'] = df.iloc[-1,4]
        df_collated.loc[row,'total_resource'] = df.iloc[0,1]
        df_collated.loc[row,'adsorbed_resource'] = df.iloc[0,2]
df_collated.to_csv('collated_results.csv')
