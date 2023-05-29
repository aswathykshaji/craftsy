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

String category_name=request.getParameter("category_name");
//out.println("category_name");
String id = request.getParameter("id");
//out.println(id);
int num = Integer.parseInt(id);
//out.println("hi");
String sql1 = "update category set category_name='" + category_name +"' where category_id='"+num+"'";
//out.println("hi");
//out.println(sql1);
st.executeUpdate(sql1);
out.println(sql1);
//out.println("hi");
response.sendRedirect("categoryview.jsp");
}
catch (Exception e) {
e.printStackTrace();
}
%>