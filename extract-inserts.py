import re

# Read the SQL dump
with open('newyear (3).sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Extract all INSERT statements
# Pattern matches INSERT INTO ... VALUES (...);
insert_pattern = r'INSERT INTO[^;]+;'
inserts = re.findall(insert_pattern, content, re.DOTALL | re.MULTILINE)

# Write to new file with INSERT IGNORE to skip duplicates
with open('seed-data-only.sql', 'w', encoding='utf-8') as f:
    f.write('-- Data-only seed file (INSERT IGNORE to skip duplicates)\n')
    f.write('-- Generated from newyear (3).sql\n\n')
    for insert in inserts:
        # Replace INSERT INTO with INSERT IGNORE INTO
        safe_insert = insert.replace('INSERT INTO', 'INSERT IGNORE INTO')
        f.write(safe_insert + '\n\n')

print(f'✅ Extracted {len(inserts)} INSERT IGNORE statements')
print(f'📄 Output file: seed-data-only.sql')
