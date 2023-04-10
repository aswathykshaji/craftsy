<%@page import="craftpackage.JavaClass"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%
try {
Connection con=JavaClass.getCon();
Statement st=con.createStatement();
String category_name=request.getParameter("category_name");
//String category_image=request.getParameter("category_image");
String id = request.getParameter("id");
int num = Integer.parseInt(id);
String sql1 = "update category set category_name='" + category_name + "' where category_id='"+num+"' ";
st.executeUpdate(sql1);
out.println(sql1);
response.sendRedirect("categoryview.jsp");
}
catch (Exception e) {
e.printStackTrace();
}
%>