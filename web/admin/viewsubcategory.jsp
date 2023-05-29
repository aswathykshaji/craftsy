<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% int slno = 0;%>

   <div class="table-responsive pt-3">

 <table class="table table-bordered">
 <thead>
 <tr>
 <th>Slno </th>
<th>Subcategory Name</th>
<th>Image</th>
 <th>Action</th>
 <!-- <th>Delete</th>-->
 </tr>
 </thead>
 <tbody>
 <%
 try
 {
 // out.println("hello");
 Connection con=JavaClass.getCon();
 Statement st=con.createStatement();

 String catid=request.getParameter("id");
// out.print(catid);
 String Query="select * from subcategory where category_id='"+catid+"'";
// String Query1="select * from subcategory where category_id='1'";
//  out.println(Query);
 ResultSet rs=st.executeQuery(Query);
 // out.println("hello1");

 while(rs.next()){
 %>



 <tr>

 <td><%=++slno%></td>
 <td><%=rs.getString("subcategory_name")%></td>
 <td><img src='../admin/assets/img/<%=rs.getString("subcategory_image")%>' width="100" height="60"></td>
 <td></td>
 </tr>
 <%
 }
 } catch (Exception e) {
 }

%>
 </table>