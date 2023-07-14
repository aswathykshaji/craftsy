<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*,java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.*"%>
<%
    try {
//        out.println("hii");
        Connection con = JavaClass.getCon();
        Statement st = con.createStatement();
        String feedback=request.getParameter("feedback");
//        out.println(amount);
        String rating=request.getParameter("rating");
//        out.println(Percent);
        String customerid = request.getParameter("customer_id");
//        String requestid = request.getParameter("id");
//        String totalamount = request.getParameter("total_amount");
        String productid = (String) session.getAttribute("product_id");
        Date dNow = new Date();
//        out.println(sellerid);
//        out.println(totalamount);

        SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");
        String sql1 = "insert into feedback(rating,feedback,product_id,feedback_date,customer_id) values ('" + rating + "','" + feedback + "','" + productid + "','" + ft.format(dNow) + "','" + customerid + "')";
//        out.println(sql1);
        st.executeUpdate(sql1);
       
        
//        out.println(sql3);
        
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<script>
    alert("Payment Successful");
    window.location = "buyerhome.jsp";
</script>
