
<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.*"%> 
<%
    try {
       
        Connection con = JavaClass.getCon();
        Statement st = con.createStatement();
 String id = request.getParameter("id");
        
         st.executeUpdate("update request set status='rejected' where request_id='"+id+"'");
          %>
         <script>
        alert("Updated Successfully");
                       window.location = "requestview.jsp";

</script>
<%
     
 
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
       