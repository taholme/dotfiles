import sqlite3

with sqlite3.connect("db.sqlite") as conn:
    cursor = conn.cursor()

    cursor.execute("INSERT INTO person VALUES (5, 'test', 1);")

    print("Data Inserted in the table: ")
    cursor.execute("SELECT * FROM person;")
    for row in cursor.fetchall():
        print(row)
