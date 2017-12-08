import MySQLdb

try:
  conn = MySQLdb.connect("back.db1.course.it.uu.se", "fall17_it21", "ZwB4BqQ4", "fall17_project_it21")  # hostname, username, password, database
  conn.autocommit(True)
  cursor = conn.cursor()
except mysql.connector.Error as err:
  if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
    print("Something is wrong with your user name or password")
  elif err.errno == errorcode.ER_BAD_DB_ERROR:
    print("Database does not exist")
  else:
    print(err)
else:
  conn.close()

while True:
    department_id = int(raw_input("Enter department id (0 to exit): "))
    if department_id == 0:
        break
    else if department_id < 0
        print ("Enter a valid input!!!\n ")

    childs = cursor.execute("""
        SELECT id, title
        FROM Department
        WHERE Department.parent_id = %s
    """, (department_id,))
    if (childs > 0):
        for row in cursor:
            print "Child id: %s | Title: %s" % row
    else:
        cursor.execute("""
        SELECT product_id, title, (price_with_tax * discount)
        FROM Product
        WHERE Product.department_id = %s
        """, (department_id,))
        for row in cursor:
            print "ID: %s | Title: %s | Retailed price: %s" % row

cursor.close()
conn.close()
