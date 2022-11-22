import mysql.connector
con=mysql.connector.connect(user="root",password="Expert123/root123",host="localhost",database="dbname")  # He tumach tumi baghun ghya !!! 

print(con)

def create_table():
    res = con.cursor();
    sqldrop = "DROP TABLE IF EXISTS users";
    res.execute(sqldrop)

    sql = "create table users(id int, name varchar(255), age int, city varchar(255))"
    res.execute(sql)
    print("Table created Success !")

def insert(id,name,age,city):
    res=con.cursor()
    sql="insert into users(id,name,age,city)values(%s,%s,%s,%s)"
    user=(id,name,age,city)
    res.execute(sql,user)
    con.commit()
    print("Data Insert Success")

def update(id,name,age,city):
    res=con.cursor()
    sql="update users set name=%s,age=%s,city=%s where id=%s"
    user=(name,age,city,id)
    res.execute(sql,user)
    con.commit()
    print("Data Update Success")

def select():
    res=con.cursor()
    sql="SELECT ID,NAME,AGE,CITY from users"
    res.execute(sql)
    print(res.fetchall())

def delete(id):
    res=con.cursor()
    sql="delete from users where id=%s"
    user=(id,)
    res.execute(sql,user)
    con.commit()
    print("Data Delete Success")

#create_table()
while True:
    print("1.Insert Data")
    print("2.Update Data")
    print("3.Select Data")
    print("4.Delete Data")
    print("5.Exit")
    choice=int(input("Enter your Choice: "))
    if choice==1:
        id=input("Enter id: ")
        name=input("Enter name: ")
        age=input("Enter age: ")
        city=input("Enter city: ")
        insert(id,name, age, city)
    elif choice==2:
        id = input("Enter id: ")
        name = input("Enter name: ")
        age = input("Enter age: ")
        city = input("Enter city: ")
        update(id, name, age, city)
    elif choice==3:
        select()
    elif choice==4:
        id=input("Enter id to delete: ")
        delete(id)
    elif choice==5:
        quit()
    else :
        print("Invalid input")
