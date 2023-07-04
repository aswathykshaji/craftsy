<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.*"%>
<%
try {
Connection con=JavaClass.getCon();
Statement st=con.createStatement();
String name = request.getParameter("name");
String address = request.getParameter("address");
String district = request.getParameter("district_id");
String location = request.getParameter("location_id");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String password = request.getParameter("password");
 
 String sql1="insert into login(username,password,role,status)values('" + email + "','" + password + "','customer','notconfirmed')";
 out.println(sql1);
 st.executeUpdate(sql1);
 out.println(sql1);
 //get login id
 
 String sql3="select max(login_id) as 'lid' from login";
// out.println(sql3);
 ResultSet rs1 = st.executeQuery(sql3);
 if(rs1.next())
 {
 String lid=rs1.getString("lid");
 String sql4 = "insert into customerreg(customer_name,address,district_id,location,phone,login_id)values('" + name + "','" + address + "','" + district + "','" + location + "','" + phone + "',"+lid+")";
 st.executeUpdate(sql4);
 
 response.sendRedirect("../login/loginindex.jsp");

 }
 
 } catch (Exception e) {
 e.printStackTrace();
 }
%>