import json #grabbing json to work with json file
import pandas as pd    #grabbing pandas for playing with data

# Opening JSON file 
f = open('information.json',) 

# returns JSON object as a dictionary 
data = json.load(f) 

# Iterating through the json list 
for i in data['member-details']: 
   print(json.dumps(i, indent = 4, sort_keys=True)) #making the output pretty

#json to csv
df = pd.read_json (r'information.json')
export_csv = df.to_csv (r'output.csv', index = None, header=True)
