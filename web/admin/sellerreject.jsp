

<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.*"%> 
<%
    try {
       
        Connection con = JavaClass.getCon();
        Statement st = con.createStatement();
 String id = request.getParameter("id");
        
         st.executeUpdate("update login set status='rejected' where login_id='"+id+"'");
          %>
         <script>
        alert("Updated Successfully");
                       window.location = "sellerview.jsp";

</script>
<%
 
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
       