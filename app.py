from flask import *
import pymysql
import os

app=Flask(__name__)
app.config['UPLOAD_FOLDER']='static/images'

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
    product_image=request.files['product_image']

    # Get image
    image_name=product_image.filename
    print(image_name)

    # Save images to the images folder
    file_path=os.path.join(app.config['UPLOAD_FOLDER'],image_name)
    print(file_path)
    # To save image
    product_image.save(file_path)
    
    print(product_name,product_description,product_cost,product_category,product_image)
     # connect to db
    connection=pymysql.connect(host="localhost",user="root",password="",database="henry_sokogarden")

    # sql to be executed
    sql="insert into product_details(product_name,product_description,product_cost,product_category,product_image) values(%s,%s,%s,%s,%s)" 
    data=(product_name,product_description,product_cost,product_category,image_name)

    cursor=connection.cursor()
    # Execute query
  
    cursor.execute(sql,data)

    # Save thee data
    connection.commit()
    return jsonify({"message":"product added successfully"})
   
if __name__ == ("__main__"):
    app.run(debug=True,port=5000)
    # port=5000 is optional