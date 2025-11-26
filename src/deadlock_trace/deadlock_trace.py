"""
select * from cadis.vwProcessLog
where RUNID in 
(select RUNID
from CADIS.vwProcessHistory
where TOPLEVELRUNID=)
order by logid
"""

import pandas as pd
import re
def load_data(file_path):
    """Load data from a CSV file into a pandas DataFrame."""
    return pd.read_csv(file_path)
file_path = 'Analyze.csv'
data = load_data(file_path)
# print(data)

running_processes=set()
error_found = False

try:
    for index,row in data.iterrows():
        if row['MESSAGETYPE']==5:
            running_processes.add(row['PROCESSNAME'])
        elif row['MESSAGETYPE']==3:
            running_processes.discard(row['PROCESSNAME'])
        elif row['MESSAGETYPE']==2:
            error_found=True
            break
except Exception as e:
    pass
finally:
    if error_found:
        component,solution=[],[]
        for process in running_processes:
            if re.search(r'\d',process):
                solution.append(process)
            else:
                component.append(process)
        print("Component = ", end="")
        print(", ".join (component))
        print("Solution = ", end="")
        print(", ".join (solution))
    else:
        if len(running_processes)==0:
            print("No conflicting processes found")
        else:
            print(", ".join(running_processes))