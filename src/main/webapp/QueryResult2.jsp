<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Query2</title>
</head>
<body>
	<h1>This is the result of query.</h1>
	 <table width="50%" border="2">
  <tr>
   <th>degree names </th>
   <th>levels</th>
  </tr>

<%
	String dbServer = "jdbc:mysql://127.0.0.1:3306/university?useSSL=false&allowPublicKeyRetrieval=true";
	String userName = "cs363";
	String password = "363F2020";
	Connection conn;
	ResultSet rs;
	ResultSetMetaData rsMetaData;
	String sql = "";
	String result1 = "";
	String result2 = "";

	try {

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbServer, userName, password);
		Statement stmt = conn.createStatement();
		sql = "use university;";
		stmt.executeUpdate(sql);
		sql = "select d.name, d.level from departments\r\n"+
				"left join degrees d\r\n"+
				"on departments.code=d.department_code\r\n"+
				"where d.name = 'Computer Science';";
		stmt.executeQuery(sql);
		rs = stmt.getResultSet();
		rsMetaData = rs.getMetaData();
		while (rs.next()) {
			for (int i = 0; i < rsMetaData.getColumnCount(); i++) {
				if (i==0){
				result1 = rs.getString(i+1);}
				
				else if (i==1){
				result2 = rs.getString(i+1);}
			}
			out.println("<tr><td>" + result1+ "</td>\n");
			out.println("<td> " + result2 + "</td></tr>\n");
		}
		conn.close();
	} catch (Exception e) {
		System.out.println("Program terminates due to errors");
		e.printStackTrace();
	}
	%>
</body>
</html>