#code for one person data
import pandas as pd
data= pd.read_excel("stage_0_Alaa.xlsx")
for my_data in data.iloc:
    print('NAME:{}'.format(my_data[0]))
    print('E_MAIL:{}'.format(my_data[1]))
    print('USED LANGUAGE:{}'.format(my_data[2]))
    print('BIOSTACK:{}'.format(my_data[3]))
    print('SLACK USERNAME:@{}'.format(my_data[4]))

