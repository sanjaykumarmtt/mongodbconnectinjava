<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%@page import="java.util.Stack" %>
<%@page import="mypr.pogo"%>
<body>
<jsp:useBean id="ob" class="mypr.mongodbpr"></jsp:useBean>
<% 
String n2=request.getParameter("name");
if(n2!=null && n2.equals("updat")){
	String na=request.getParameter("na");
	String id=request.getParameter("id");
		Stack<pogo> st=ob.shoudta(na, id);
		 out.print("<br>"); 
%>
<table>
<% 
	for(pogo i: st){
%>
	<tr><td><label>Name</label></td>
	<td><input type="text" name="l" value="<%=i.getName()%>"></td></tr>
	<tr><td><label>Subject</label></td>
	<td><input type="text" name="l" value="<%=i.getSub()%>"></td></tr>
	<tr><td><label>Year</label></td>
	<td><input type="text" name="l" value="<%=i.getYear()%>"><br></td></tr>
<% 
    }
 }
%>
</table>
</body>
</html>