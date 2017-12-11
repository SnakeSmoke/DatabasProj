import MySQLdb
import string

#Create a Java or a Python program which connects to the database, asks the user for a department ID (i.
#e. the value of the primary key) and lists all its child departments (outputting the ID and the title) or its
#products (outputting the ID, the title and the retail price after the discount).
#Create another program which asks for a product ID, shows the current discount and allows the user to
#change it.

conn = MySQLdb.connect("back.db1.course.it.uu.se", "fall17_it21", "ZwB4BqQ4", "fall17_project_it21")  # hostname, username, password, database
conn.autocommit(True)
cursor = conn.cursor()



def changeDiscount(product_id, new_discount):
    
    aux = float(100-new_discount)/100
    print aux

    cursor.execute("""
        UPDATE Product 
        SET discount=%s 
        WHERE product_id=%s
    """, (aux, product_id))


while True:

    try:
        product_id = int(raw_input("Enter product id to get discount (0 to exit): "))
        if product_id == 0:
            break
        if product_id > 0 and product_id <= 10:
            
            cursor.execute("""
                SELECT product_id, title, round(100-discount*100)
                FROM Product
                WHERE product_id = %s
            """, (product_id,))  

            for row in cursor :
                print "Id: %s |Title: %s |Current discount: %s percent " % row
       
        else:
            print "Enter a value from 1-10\n"


        while True:
        
            userInput = raw_input("Do you wish to change a prouducts discount rate? (Y/N): ")
            if len(userInput) > 1:
                print "Please enter only one (1) character\n"
            if len(userInput) < 1:
                print "Invalid Input\n"
            
            if userInput == "y" or userInput == "Y":

                    selected_product = int(raw_input("Enter the selected product_ID (1-10): "))
                    if selected_product < 1 or selected_product > 10:
                        print "Invalid number\n"
                        break
                    else:

                        new_Discount  = int(raw_input("Enter new Discount in percent (i.e 10, 50, 89 etc): "))

                    if new_Discount < 1 or new_Discount > 100:
                        print "Invalid value\n"
                    else:
                        changeDiscount(selected_product, new_Discount)
                    
            if userInput == "n" or userInput == "N":
                break

    except ValueError:
        print "ValueError: Invalid input\n"
        

cursor.close()
conn.close()
