# 🧑‍💻 JSP CRUD Application (User Management System)

A simple and dynamic **CRUD (Create, Read, Update, Delete)** web application built using **JSP, Servlets, JDBC, and MySQL**. This project demonstrates the fundamentals of Java web development by performing complete CRUD operations on user data through a clean and structured architecture.

---

## 🚀 Features

* ➕ Add new users
* 📋 View all users
* ✏️ Edit user details
* ❌ Delete users
* 🔄 Real-time database updates
* 💡 Clean and user-friendly interface

---

## 🛠️ Technologies Used

### Backend

* Java (JDK 8+)
* JSP (Java Server Pages)
* Servlets (Jakarta EE)
* JDBC (Java Database Connectivity)

### Database

* MySQL

### Server

* Apache Tomcat 10.1

### Frontend

* HTML
* CSS

---

## 📁 Project Structure

```text
jspCURDdemo/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/demo/
│       │       ├── DBConnection.java
│       │       └── UserServlet.java
│       │
│       └── webapp/
│           ├── index.jsp
│           ├── adduser.jsp
│           └── edituser.jsp
│
└── README.md
```

---

## ⚙️ Setup Instructions

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
```

### 2️⃣ Import into Eclipse

* Open **Eclipse IDE**
* Go to **File → Import**
* Select **Existing Project into Workspace**
* Finish the import

### 3️⃣ Configure MySQL Database

Create a database and the required table.

```sql
CREATE DATABASE your_db_name;

USE your_db_name;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(255)
);
```

### 4️⃣ Update Database Credentials

Modify the database connection in **DBConnection.java**.

```java
DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/your_db_name",
    "root",
    "your_password"
);
```

### 5️⃣ Add MySQL JDBC Driver

Add the **mysql-connector-j.jar** file to your project's build path.

### 6️⃣ Run the Project

* Configure **Apache Tomcat 10.1**
* Start the server
* Open your browser and visit:

```text
http://localhost:8080/jspCURDdemo/
```

---

## 📸 Screenshots

Add screenshots of the following pages:

* 🏠 Home Page (User List)
* ➕ Add User Page
* ✏️ Edit User Page

---

## 📌 Future Improvements

* 🔐 User Login & Authentication
* 🎨 Modern UI using Bootstrap
* 🧩 Implement MVC Architecture (DAO Layer)
* 🔍 Search & Pagination
* ☁️ Cloud Deployment (AWS / Render)

---

## 🙋‍♂️ Author

**Mihir Somwanshi**

---

## ⭐ Support

If you found this project helpful, consider giving it a **⭐ Star** on GitHub!
