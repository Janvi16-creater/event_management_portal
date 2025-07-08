# Event Management Portal

A web-based Event Management Portal built using Java Servlets, JSP, JDBC, and MySQL. This application allows users to view and register for events while providing administrators with tools to manage event listings.

---

## 🌐 Features

### 👥 User
- View upcoming events
- Register for events
- View registration history

### 🔐 Admin
- Login with secure credentials
- Add new events
- Edit or delete existing events
- View list of registered participants

---

## 🧰 Tech Stack

- **Frontend**: HTML, CSS, JSP
- **Backend**: Java (Servlets, JSP)
- **Database**: MySQL
- **Server**: Apache Tomcat (v10+)
- **IDE**: Apache NetBeans 25

---

## ⚙️ Setup Instructions

### Prerequisites
- Java JDK 17+
- Apache Tomcat 10+
- MySQL Server
- Apache NetBeans (recommended)

### Steps

1. Clone the repository
   ```bash
   git clone https://github.com/yourusername/event_management_portal.git
  ```
2. Import project into NetBeans
   ```bash
     Open NetBeans
     File → Open Project → Select the unzipped folder
  ```
3. Set up the MySQL Database
   ```bash
   Create a database named event_portal
   Run the provided SQL script (if any) to generate tables
  ```
4. Configure Database Connection
   ```bash
      Open DBConnection.java
      Update MySQL username, password, and database URL
  ```
5. Deploy to Apache Tomcat
   ```bash
   Right-click the project → Run
   Access the application at http://localhost:8080/event_management_portal
  ```
