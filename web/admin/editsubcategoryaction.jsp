<%@page import="craftpackage.JavaClass"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%
try {
Connection con=JavaClass.getCon();
Statement st=con.createStatement();
//String category=request.getParameter("category_name");

String subcategory_name=request.getParameter("subcategory_name");
//out.println("category_name");
String id = request.getParameter("id");
//out.println(id);
int num = Integer.parseInt(id);
//out.println("hi");
String sql1 = "update subcategory set subcategory_name='" + subcategory_name +"' where subcategory_id='"+num+"'";
//out.println("hi");
//out.println(sql1);
st.executeUpdate(sql1);
out.println(sql1);
//out.println("hi");
response.sendRedirect("viewsubcategory.jsp");
}
catch (Exception e) {
e.printStackTrace();
}
%>