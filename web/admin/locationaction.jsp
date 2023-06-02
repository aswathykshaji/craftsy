<%-- 
    Document   : locationaction
    Created on : Mar 28, 2023, 9:00:42 PM
    Author     : ASWATHY SHAJI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="craftpackage.JavaClass" %>
<%@page import="java.sql.*" %>

<%
    try{
        Connection con=JavaClass.getCon();
        Statement st=con.createStatement();
        String district_id=request.getParameter("district_id");
        String location_name=request.getParameter("location_name");
        st.executeUpdate("insert into location (location_name,district_id) values('"+location_name+"','"+district_id+"')");
       %>
       <script>
    alert("Location added Successfully");
    window.location = "locationregister.jsp";
</script>
<%
    }
    catch(Exception e){
        e.printStackTrace();
    }
    
%>