<%@page import="craftpackage.JavaClass"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%
    try {
        String id = request.getParameter("id");
//        out.println(id);
        int num = Integer.parseInt(id);
        Connection con = JavaClass.getCon();
        Statement st = con.createStatement();
        String category = request.getParameter("category");
        String subcategory_name = request.getParameter("subcategory");
        String product_name = request.getParameter("name");
        String description = request.getParameter("description");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");

//out.println("hi");
        String sql1 = "update product set category_id='" + category + "', subcategory_id='" + subcategory_name + "', product_name='" + product_name + "',description='" + description + "',quantity='" + quantity + "',price='" + price + "' where product_id='" + num + "'";
//out.println("hi");
//out.println(sql1);
        st.executeUpdate(sql1);
        out.println(sql1);
%>
<script>
    alert("Updated Successfully");
    window.location = "productview.jsp";
</script>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>