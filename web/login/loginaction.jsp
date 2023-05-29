<%@page import="java.sql.*" %>
<%@page import="craftpackage.JavaClass" %>
<%
 try{
 Connection con=JavaClass.getCon();
 Statement st=con.createStatement();
 
 String username=request.getParameter("username");
 String Password=request.getParameter("password");
 //String role="customer";
 //String status="notconfirmed";
 
 
 
String Query="Select * from login WHERE username='"+username+"' and password='"+Password+"'";
 // out.println(Query);
 ResultSet rs = st.executeQuery(Query);
// out.println("...INSERTED..");
 if(rs.next())
 {
 // out.println("he");
 String lid=rs.getString("login_id");
 session.setAttribute("login_id", lid);
// String r="admin";
 // out.println(loginid);
 String role=rs.getString("role").replaceAll("\\s", ""); // replaceAll("\\s", "")
 out.println(role);
 String status=rs.getString("status");
// st.executeUpdate("Update tbl_login set status='confirmed' where username='"+username+"'");
 //out.println("hi");
// if(role=="admin"){
 if(role.equals("admin")){
 out.println("role");
 
 response.sendRedirect("../admin/adminhome.jsp");
 }
 else if(role.equals("customer"))
 
 {
// out.println("role");
 if(status.equals("confirmed"))
 {
  response.sendRedirect("../buyer/buyerhome.jsp");

 }
 else
 {
 
 out.println("please wait");
 
 }
 
 }
 else if(role.equals("seller"))
 {
//     out.println("role");
     if(status.equals("confirmed")){
                  response.sendRedirect("../seller/sellerhome.jsp");

     }
     else{
                           out.println("please wait");


     }
 }
 }
 
 else{
 out.println("invalid username or password");
 
 
} 
 }
 catch(Exception e){
     
 }
 
 %>