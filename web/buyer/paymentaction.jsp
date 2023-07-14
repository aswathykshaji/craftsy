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
        String amount=request.getParameter("Amount");
//        out.println(amount);
        String Percent=request.getParameter("twoPercent");
//        out.println(Percent);
        String sellerid = request.getParameter("seller_id");
        String requestid = request.getParameter("id");
        String totalamount = request.getParameter("total_amount");
        String custid = (String) session.getAttribute("login_id");
        Date dNow = new Date();
//        out.println(sellerid);
//        out.println(totalamount);

        SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");
        String sql1 = "insert into sellerpayment(customer_id,request_id,seller_id,date,total_amount,status) values ('" + custid + "','" + requestid + "','" + sellerid + "','" + ft.format(dNow) + "','" + amount + "','Paid')";
//        out.println(sql1);
        st.executeUpdate(sql1);
        String sql2 = "insert into adminpayment(customer_id,request_id,seller_id,payment_date,Amount,Status) values ('" + custid + "','" + requestid + "','" + sellerid + "','" + ft.format(dNow) + "','" + Percent + "','Paid')";
        st.executeUpdate(sql2);

        String sql3 = "update request set status='Paid' where request_id='" + requestid + "'";
        st.executeUpdate(sql3);
//        out.println(sql3);
        
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<script>
    alert("Payment Successful");
    window.location = "buyerhome.jsp";
</script>
