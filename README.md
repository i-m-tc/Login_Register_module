# Login_Register_module
This is a project on python along with mysql, to do login and register in a robust way. I have shared this module so that the reusability properties of function and the process of robustness with python and mysql can visible.
#Database connection details
import mysql.connector

conn_obj=mysql.connector.connect(
    host="localhost",
    user="root",
    password="26Ta1296##",
    database="login_auth_aug")
cur_obj=conn_obj.cursor()

#Define function data_entry_sql
def data_entry_sql(full_name,address,phone_number,user_idl,pwd):

    # Build the query with user-provided name using LIKE operator
    sql = "INSERT INTO cust_details (full_name, address, ph_no, userid, password) VALUES (%s, %s, %s, %s,%s)"
    data = (full_name,address,phone_number,user_idl,pwd)

    try:
        cur_obj.execute(sql, data)
        print("NEW CUSTOMER ENTRY SUCCESSFUL.")
        conn_obj.commit()
    except mysql.connector.Error as e:
        print("Error retrieving data from MySQL:", e)
        conn_obj.rollback()

#Define function data_retrieve
def data_retrieve(user_id):
    # Build the query with user-provided name using LIKE operator
    #select * from students_details WHERE Roll_no=1;
    query = f"select * from cust_details where userid=\'{user_id}\'"
    try:
        cur_obj.execute(query)
        result = cur_obj.fetchone()
        conn_obj.commit()
        return result
    except mysql.connector.Error as e:
        print("Error retrieving data from MySQL:", e)
        conn_obj.rollback()
def user_registration():
    full_name = input("Enter the full name:->").strip().upper()
    address = input("Enter the address:->").strip().upper()
    phone_number = input("Enter the phone number:->").strip().upper()
    user_idl = input("Set your id here:->").strip()
    pwd = input("Enter your password here:->").strip()
    data_entry_sql(full_name, address, phone_number, user_idl, pwd)

def login_f():
    user_id = input("Enter your own user id:").strip()
    pwdl = input("Enter your password here:").strip()
    cust_details_from_db = data_retrieve(user_id)
    # print(cust_details_from_db)
    if cust_details_from_db:
        # print("user id is existing")
        if cust_details_from_db[-1] == pwdl:
            print("access granted, logged in.")
        else:
            print("Access denined, wrong user id or password.")
    else:
        print("Invalid user id and password, please register & login")
        user_registration()
#main program starts here:
cust_choice=input("Choose your options:\n Enter 1 to register for new account\n Existing customer? Enter 2 to login:")
if cust_choice=="1":
    #new-user registration
    user_registration()
    login_f()
elif cust_choice=="2":
    #existing user login
    login_f()

else:
    print("Invalid choice. Please check and try again.")
conn_obj.close() #close the object is important
