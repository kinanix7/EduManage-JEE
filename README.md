# EduManage - Student and Course Management System

## Description
EduManage is a web-based internal application designed for efficient student and course management. The system provides administrators with an intuitive interface to manage student records and course information through CRUD operations (Create, Read, Update, Delete).

## Architecture
The project follows the MVC (Model-View-Controller) architecture pattern to ensure:
- Clear separation of concerns
- Maintainable and scalable codebase
- Organized business logic, data handling, and user interface components

## Technologies

### Backend
- Java EE (Servlets, JSP)
- JDBC for database connectivity
- Maven for dependency management

### Frontend
- HTML5
- CSS3
- Bootstrap framework
- JavaScript

### Database
- MySQL

### Development Environment
- Application Server: Apache Tomcat
- IDE: Eclipse or IntelliJ
- UML Modeling tools for system design

## Key Features

### Student Management
- Create new student profiles with:
  - First Name
  - Last Name
  - Email
  - Date of Birth
- View and search student listings with filtering capabilities
- Update existing student information
- Delete student records with confirmation

### Course Management
- Create new courses with:
  - Course Name
  - Course Description
- View complete course catalog
- Update course information
- Delete courses with confirmation
- Associate multiple students with multiple courses

## System Design

### UML Diagrams
The project includes two main UML diagrams:
1. Class Diagram: Illustrates the system's class structure and relationships
2. Use Case Diagram: Shows system functionality and user interactions

## Project Structure
```
edumanage/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── controllers/
│   │   │   ├── models/
│   │   │   └── services/
│   │   ├── resources/
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       ├── css/
│   │       ├── js/
│   │       └── views/
│   └── test/
├── pom.xml
└── README.md
```

## Setup Instructions

### Prerequisites
1. JDK 8 or higher
2. Maven
3. MySQL
4. Apache Tomcat
5. Eclipse or IntelliJ IDEA

### Installation Steps
1. Clone the repository
2. Import as Maven project in your IDE
3. Configure MySQL connection in `application.properties`
4. Run `mvn clean install`
5. Deploy to Tomcat server

## Database Schema
The system uses a relational database with the following main tables:
- `students`: Stores student information
- `courses`: Stores course information
- `student_courses`: Junction table for student-course relationships

## Contributing
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

