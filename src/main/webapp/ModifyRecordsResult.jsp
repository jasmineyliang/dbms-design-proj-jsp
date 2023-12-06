<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ModifyRecordsResult</title>
</head>
<body>
	<h1>Your data record has successfully been modified.</h1>
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
		sql = "Update students\r\n" + "SET name = 'Scott'\r\n" + "where students.ssn = 746897816;";
		stmt.executeUpdate(sql);
		System.out.println("success");
		conn.close();
	} catch (Exception e) {
		System.out.println("Program terminates due to errors");
		e.printStackTrace();
	}
	%>


</body>
</html>