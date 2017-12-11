
import MySQLdb

# Note: This is just a small example.
# Your code should also handle exceptions (if you are a X student you can ignore it)

#Create a Java or a Python program which connects to the database, asks the user for a department ID (i.
#e. the value of the primary key) and lists all its child departments (outputting the ID and the title) or its
#products (outputting the ID, the title and the retail price after the discount).
#Create another program which asks for a product ID, shows the current discount and allows the user to
#change it.

conn = MySQLdb.connect("back.db1.course.it.uu.se", "fall17_it21", "ZwB4BqQ4", "fall17_project_it21")  # hostname, username, password, database
conn.autocommit(True)
cursor = conn.cursor()

while True:

    try:
        department_id = int(raw_input("Enter department id (0 to exit): "))
        if department_id == 0:
            break
        if department_id == 1 or department_id == 2:
            
            cursor.execute("""
                SELECT id, title
                FROM Department
                WHERE parent_id = %s
            """, (department_id,))  
    
            for row in cursor :
                print "Id: %s |Title: %s " % row


        else:
            
            cursor.execute("""
                SELECT product_id, title, price_without_tax*discount
                FROM Product
                WHERE department_id = %s
            """, (department_id,))  
    
            for row in cursor :
                print "product_id: %s |Title: %s |Price %s" % row

    except ValueError:
        print "Invalid input"

cursor.close()
conn.close()
