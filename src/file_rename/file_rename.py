import re
from pathlib import Path

folder = Path(r"C:\Users\ankit.yadav2\Documents\send")
PREFIX = "QM0E.PASTRUSPGI."

pattern=re.compile(r'^\d+?_(.*?)\.(dif|out|px)\.gz\.(\d{8})$')

print(f"Scanning folder: {folder.resolve()}")
print('Files to be renamed')
print('-'*80)

all_file_count=0
renamed_count=0

for file in folder.iterdir():
    if not file.is_file():
        continue

    all_file_count+=1
    match=pattern.search(file.name)

    if match:
        base_name=match.group(1)
        file_type=match.group(2)
        date_part=match.group(3)
    
        new_filename=f"{PREFIX}{base_name}_{date_part}.{file_type}.gz"
        new_path=folder/new_filename
        print(f"{file.name}")
        print(f" -> {new_filename}")
        print()

        file.rename(new_path)
        renamed_count+=1

print('-'*80)
print(f'Found {renamed_count} files to be renamed out of {all_file_count} total files')