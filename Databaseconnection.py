import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="",
    password="",
    database="virtual_art_gallery"
)

# created table:
    
cursor = db.cursor()

create_table_query = """
CREATE TABLE customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    department VARCHAR(50)
)
"""

cursor.execute(create_table_query)

print("Table created successfully.")

# inserting values

insert_query="""insert into customer values (1,"santosh",34,"cse"),(2,"mani",44,"cse")"""

cursor.execute(insert_query)

# # displaying the data

select_query=""" select * from customer"""
cursor.execute(select_query)
for i in cursor:
    print(i)
    
# #ddl command:

# # truncate 

create_table_query = """
CREATE TABLE customer2 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    department VARCHAR(50)
)
"""
cursor.execute(create_table_query)
cursor.execute(create_table_query)
print("table created")

# # inserting values

insert_query="""insert into customer2 values (1,"santosh",34,"cse"),(2,"mani",44,"cse")"""

cursor.execute(insert_query)

trunc="""truncate table customer"""

cursor.execute(trunc)

print("truncated succesfully")

# displaying the data

select_query=""" select * from customer2 """
cursor.execute(select_query)
for i in cursor:
    print(i)
    
    
# # alter table:

cursor.execute("""alter table customer2 add year int """)

select_query=""" select * from customer2 """
cursor.execute(select_query)
for i in cursor:
    print(i)
    
# drop table:

cursor.execute("""drop table customer""")

# Dml commands

# delete:

del_in="""DELETE FROM customer2 WHERE name = 'mani' """
cursor.execute(del_in)
db.commit()

#update:

up="""update  customer2 set  age=21 where age=34"""
cursor.execute(up)
db.commit()


insert_query = """
INSERT INTO customer2 (id, name, age, department) VALUES
(3, 'karthik', 23, 'EEE'),
(4, 'meena', 31, 'IT'),
(5, 'raj', 28, 'MECH')
"""

cursor.execute(insert_query)
db.commit()

# group by
cursor.execute("""
select department, COUNT(*) AS total_customers
FROM customer2
GROUP BY department
""")
for row in cursor:
    print(row)

# having


cursor.execute("""
Select department, COUNT(*) AS total_customers
FROM customer2
GROUP BY department
HAVING total_customers > 1
""")
for row in cursor:
    print(row)
    
# limit
    
print("\nFirst 3 customers by ID (FETCH using LIMIT):")
cursor.execute("""
SELECT * FROM customer2
ORDER BY age desc 
LIMIT 3 offset 1
""")
for row in cursor:
    print(row)