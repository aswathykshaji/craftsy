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
//        out.println(feedback);
        String rating=request.getParameter("star");
//        out.println(rating);
        String productid = request.getParameter("productid");
//        out.println(productid);
        String customerid = request.getParameter("customerid");
//        out.println(customerid);
        Date dNow = new Date();
//       

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
    alert("Feedback send Successfully");
    window.location = "buyerhome.jsp";
</script>
