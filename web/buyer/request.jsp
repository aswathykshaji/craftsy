<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@page import="java.util.Date"%>
<%@page import="craftpackage.JavaClass" %>
<%@page import="java.sql.*" %> 

<%
    try {
        Connection con = JavaClass.getCon();
        Statement st = con.createStatement();
        String Quantity = request.getParameter("qty");
        out.println(Quantity);
        String Totalamount = request.getParameter("totalprice1");
        out.println(Totalamount);
        String productid = request.getParameter("productid");
        out.println(productid);
        String sellerid = request.getParameter("sellerid");
        out.println(sellerid);
//        String lid = (String) session.getAttribute("login_id");
        String customerid = request.getParameter("customerid");
        out.println(customerid);
        Date dNow = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");

        String query = ("insert into request(product_id,seller_id,customer_id,quantity1,date,total_amount,status) values('" + productid + "','" + sellerid + "','" + customerid + "','" + Quantity + "','" + ft.format(dNow) + "','" + Totalamount + "','Requested')");
        out.println(query);
        st.executeUpdate(query);
//        
%>
<script>
    alert("Request Sended");
    window.location = "buyerhome.jsp";
</script>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }

%>