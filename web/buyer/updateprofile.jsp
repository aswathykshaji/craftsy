<%@page import="craftpackage.JavaClass"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%
    try {
        Connection con = JavaClass.getCon();
        Statement st = con.createStatement();
//String category=request.getParameter("category_name");
        String logid = (String) session.getAttribute("login_id");

        String customer_name = request.getParameter("customer_name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String district = request.getParameter("district");
        String area = request.getParameter("area");
        String email = request.getParameter("email");

//out.println("category_name");
        String id = request.getParameter("id");
//out.println(id);
        int num = Integer.parseInt(id);
//out.println("hi");
        String sql1 = "update customerreg set customer_name='" + customer_name + "', phone='" + phone + "',address='" + address + "' where login_id='" + logid + "'";
out.println(sql1);
        String sql2 = "update login set username='" + email + "'  where login_id='" + logid + "'";

out.println(sql2);
        st.executeUpdate(sql1);
        st.executeUpdate(sql2);

//        out.println(sql1);
//out.println("hi");
        response.sendRedirect("buyerprofile.jsp");
    } catch (Exception e) {
        e.printStackTrace(); 
    }
%>