<%@page import="craftpackage.JavaClass"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%
try {
Connection con=JavaClass.getCon();
Statement st=con.createStatement();
String subcategory_name=request.getParameter("subcategory_name");
//String category_image=request.getParameter("category_image");
String id = request.getParameter("id");
int num = Integer.parseInt(id);
String sql1 = "update subcategory set subcategory_name='" + subcategory_name + "' where subcategory_id='"+num+"' ";
st.executeUpdate(sql1);
out.println(sql1);
response.sendRedirect("subcategoryview.jsp");
}
catch (Exception e) {
e.printStackTrace();
}
%>