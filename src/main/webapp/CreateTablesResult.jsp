<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CreateTablesResult</title>
</head>
<body>
	<h1>Your tables have successfully been created.</h1>
	<%
	String dbServer = "jdbc:mysql://127.0.0.1:3306/university?useSSL=false&allowPublicKeyRetrieval=true";
	String userName = "cs363";
	String password = "363F2020";
	Connection conn;
	String sql = "";
	try {

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbServer, userName, password);
		Statement stmt = conn.createStatement();
		sql = "create table students (snum integer, ssn integer, name varchar(10), gender varchar(1), dob datetime, "
				+ "c_addr varchar(20), c_phone varchar(10), p_addr varchar(20), p_phone varchar(10), UNIQUE (snum) ,primary key (ssn));";
		stmt.executeUpdate(sql);
		System.out.println("Created table students in University database");

		sql = "create table departments (code integer, name varchar(50), phone varchar(10), college varchar(20), UNIQUE (name),primary key (code));";
		stmt.executeUpdate(sql);
		System.out.println("Created table departments in University database");

		sql = "create table degrees (name varchar(50), level varchar(5), department_code integer,"
				+ "primary key (name, level), foreign key (department_code) references departments (code));";
		stmt.executeUpdate(sql);
		System.out.println("Created table degrees in University database");

		sql = "create table courses (number integer, name varchar(50), description varchar(50), credithours integer, level varchar(20), department_code integer,"
				+ "unique (name), primary key (number), foreign key (department_code) references departments (code));";
		stmt.executeUpdate(sql);
		System.out.println("Created table courses in University database");

		sql = "create table register (snum integer, course_number integer, regtime varchar(20), grade integer,"
				+ "primary key (snum, course_number), foreign key (snum) references students (snum));";
		stmt.executeUpdate(sql);
		System.out.println("Created table register in University database");

		sql = "create table major (snum integer, name varchar(50), level varchar(5), primary key (snum, name, level), foreign key (snum) references students (snum),"
				+ "foreign key (name,level) references degrees (name,level));";
		stmt.executeUpdate(sql);
		System.out.println("Created table major in University database");

		sql = "create table minor (snum integer, name varchar(50), level varchar(5), primary key (snum, name, level), foreign key (snum) references students (snum),"
				+ "foreign key (name,level) references degrees (name,level));";
		stmt.executeUpdate(sql);
		System.out.println("Created table minor in University database");
		conn.close();
	} catch (Exception e) {
		System.out.println("Program terminates due to errors");
		e.printStackTrace();
	}
	%>


</body>
</html>