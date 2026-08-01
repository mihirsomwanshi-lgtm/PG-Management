🧑‍💻 JSP CRUD Application (User Management System)
A simple and dynamic CRUD (Create, Read, Update, Delete) web application built using JSP, Servlets, JDBC, and MySQL. This project demonstrates basic backend development using Java web technologies and follows a structured approach for handling user data.

🚀 Features
➕ Add new users
📋 View all users
✏️ Edit user details
❌ Delete users
🔄 Real-time database updates
💡 Clean and simple UI
🛠️ Technologies Used
Java (JDK 8+)
JSP (Java Server Pages)
Servlets (Jakarta EE - Tomcat 10)
JDBC (Java Database Connectivity)
MySQL Database
Apache Tomcat 10.1
HTML/CSS
📁 Project Structure
jspCURDdemo/
│
├── src/main/java/com/demo/
│   ├── DBConnection.java
│   └── UserServlet.java
│
├── src/main/webapp/
│   ├── index.jsp
│   ├── adduser.jsp
│   └── edituser.jsp
⚙️ Setup Instructions
1️⃣ Clone Repository
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
2️⃣ Import into Eclipse
Open Eclipse
File → Import → Existing Project
3️⃣ Configure Database
Create MySQL database and table:

CREATE DATABASE your_db_name;

USE your_db_name;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(255)
);
4️⃣ Update DB Credentials
Edit DBConnection.java:

DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/your_db_name",
    "root",
    "your_password"
);
5️⃣ Add MySQL Connector
Add mysql-connector-j.jar to project build path
6️⃣ Run on Server
Configure Apache Tomcat 10.1
Run project
Open:

http://localhost:8080/jspCURDdemo/
📸 Screenshots
Home Page (User List)
Add User Page
Edit User Page
📌 Future Improvements
🔐 Add Login & Authentication
🎨 Improve UI with Bootstrap
🧩 Apply MVC Architecture (DAO Layer)
🔍 Add Search & Pagination
🌐 Deploy on cloud (AWS / Render)
🙋‍♂️ Author
Mihir Somwanshi
