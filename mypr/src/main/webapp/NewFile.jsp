<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@page import="java.util.Stack" %>
<%@page import="mypr.pogo" %>
<body>                           

<jsp:useBean id="ob" class="mypr.mongodbpr"></jsp:useBean>
<a href='NewFile.jsp?name=wi&id=1'>show data</a><br>
<a href='NewFile.jsp?name=up&id=Semester'>store data</a>
<a href='NewFile.jsp?name=upda&id='>store data</a>
<%
   String ta=request.getParameter("name");


   if(ta!=null && ta.equals("wi")){
	int id=Integer.parseInt(request.getParameter("id"));
	if(id>0){
%>
<form action="">
<label>Enter table name</label>
<input type="text" name="n">
<input type="submit" name="su" value="submit">
</form>
<% 		
	}	
}else if(ta!=null && ta.equals("up")){
	String id=request.getParameter("id");
	if(id!=null){
%>
<form action="">
<label>Enter table name</label>
<input type="text" name="n" value="<%=id%>">

<label>zEnter name</label>
<input type="text" name="sn">

<label>Enter Subject</label>
<input type="text" name="su">

<label>Enter Year</label>
<input type="number" name="ye">

<input type="submit" name="sui" value="store">
</form>
<% 		
	}
}else if(ta!=null && ta.equals("upda")){
	String id=request.getParameter("id");
%>
	<form action="">
	<label>Enter Update table name </label>
	<input type="text" name="n" value="<%=id%>">
	<input type="submit" name="s" value="Update">
	</form>
<%
}
String n=request.getParameter("su");
if(n!=null && n.equals("submit")){
	 String s=request.getParameter("n");
	Stack<pogo> st=ob.wuiu(s);
	 out.print("<br>"); 
%>
 <table border='3' align='center' rules='all' callpading='20' width='30%'>
 <tr><th>Name</th><th>Subject</th><th>Year</th><th colspan='2'>Poration</th></tr>
<% 
	for(pogo i:st){
%>
   <tr><td><%=i.getName() %></td><td>i.getSub()</td><td>i.getYear()</td>
   <td><a href='File1.jsp?name=updat&na=<%=s%>&id=<%=i.getName() %>'>Update</a></td><td><a href="">Delete</a></td></tr>
<% 		  
	}
}
%>
</table>
<%
String n1=request.getParameter("sui");
if(n1!=null && n1.equals("store")){
String tbnam=request.getParameter("n");
String name=request.getParameter("sn");
String sub=request.getParameter("su");
int year=Integer.parseInt(request.getParameter("ye"));
int r=ob.store(tbnam, name, sub, year);
out.print("<br>");  
 String cont=((r>0)?"register successfully":"not register");
 out.print(cont);
}

%>
</body>
</html>