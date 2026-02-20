from flask import *
import pymysql


app=Flask(__name__)

@app.route("/api/signup",methods=["POST"])
def signup():
    # code to execute
    username=request.form['username']
    email=request.form['email']
    phone=request.form['phone']
    password=request.form['password']

    print(username,email,phone,password)
    # create db connection
    connection=pymysql.connect(host="localhost",user="root",password="",database="henry_sokogarden")

    # create cursor
    cursor=connection.cursor()
    # create sql query
    sql="insert into users (username,email,phone,password) values (%s,%s,%s,%s)"
    data=(username,email,phone,password)

    # excecute the query
    cursor.execute(sql,data)
    # save the data
    connection.commit()

    # return response
    return jsonify({"message":"Sign Up API"})

@app.route("/api/signin",methods=["POST"])
def sign_in():
    email=request.form['email']
    password=request.form['password']
    print(email,password)

    # create database connection
    connection=pymysql.connect(host="localhost",user="root",password="",database="henry_sokogarden")

    # create cursor
    cursor=connection.cursor()

    # create query
    sql="select user_id,username,email,phone from users where email=%s and password=%s"
    data=(email,password)

    cursor.execute(sql,data)

    if cursor.rowcount==0:
        return jsonify({"message":"invalid credentials"})
    else:
        # Get user data                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        user=cursor.fetchone() 
        return jsonify({"message":"login successful","user":user})
    
@app.route("/api/add_product",methods=["POST"])
def addproduct():
    product_name=request.form['product_name']
    product_description=request.form['product_description']
    product_category=request.form['product_category']
    product_cost=request.form['product_cost']
    product_image=request.files[0]

    print(product_name,product_description,product_cost,product_category,product_image)
if __name__ == ("__main__"):
    app.run(debug=True,port=5000)
    # port=5000 is optional