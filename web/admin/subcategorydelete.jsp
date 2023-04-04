<%@page import="java.sql.*" %>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/craft_shopping", "root", "");
        Statement st = con.createStatement();
        String id = request.getParameter("id");
//        out.println("hi");
        int num = Integer.parseInt(id);
        String s = "delete from subcategory where subcategory_id='" + num + "'";
        st.executeUpdate(s);
%>

<%
        response.sendRedirect("viewsubcategory.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>