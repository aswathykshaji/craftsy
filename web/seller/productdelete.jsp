<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.*" %>
<%
    try {
        Connection con = JavaClass.getCon();
        Statement st = con.createStatement();
        String id = request.getParameter("id");
//        out.println("hi");
        int num = Integer.parseInt(id);
        String s = "delete from product where product_id='" + num + "'";
        st.executeUpdate(s);
%>

<%
        response.sendRedirect("productview.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>