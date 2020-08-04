#code for one person data
import pandas as pd
data=pd.read_excel("stage_0_Alaa.xlsx")
my_data=data.iloc[0]
print('NAME:{}'.format(my_data[0]))
print('EMAIL:{}'.format(my_data[1]))
print('LANGUAGE_USED:{}'.format(my_data[2]))
print('BIOSTACK:{}'.format(my_data[3]))
print('SLACK_USERNAME:@{}'.format(my_data[4]))

##code for selection data 
import pandas as pd
data=pd.read_excel("stage_0_Alaa.xlsx")
filtrated_data=data[data.SLACK_USERNAME=='Alaa']
positions=list(filtrated_data.index)
for n in positions:
    final_data=data.iloc[n]
    print('NAME:{}'.format(final_data[0]))
    print('EMAIL:{}'.format(final_data[1]))
    print('LANGUAGE_USED:{}'.format(final_data[2]))
    print('BIOSTACK:{}'.format(final_data[3]))
    print('SLACK_USERNAME:@{}'.format(final_data[4]))
  
output:
NAME:Alaa Samy
EMAIL:alaasamy878@gmail.com
LANGUAGE_USED:Python
BIOSTACK:genomics
SLACK_USERNAME:@Alaa
