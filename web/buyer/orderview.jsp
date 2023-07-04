<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="buyerheader.jsp" />
<% int slno = 0;%>
<style>
    .button2 {
        background-color: #d10024; /* Green */
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
    }
</style>
<!doctype html>
<html lang="en">
<head>
    <title>Craftsy</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="view1/css/style.css">
</head>
<body>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h2 class="heading-section">Craftsy</h2>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-12">
                <h4 class="text-center mb-4">Your Products</h4>
                <br>
                <div class="table-wrap">
                    <table class="table">
                        <thead class="thead-primary">
                        <tr style="background-color: #fe4c50;">
                            <th>Sl. No</th>
                            <th>Product Image</th>
                            <th>Product Name</th>
                            <th>Description</th>
                            <th>Quantity</th>
                            <th>Total Amount</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <%
                            try {
                                Connection con = JavaClass.getCon();
                                Statement st = con.createStatement();
                                String custid = (String) session.getAttribute("login_id");
                                String Query = "SELECT * FROM request r INNER JOIN login l on r.customer_id=l.login_id INNER JOIN product p on r.product_id=p.product_id  where r.customer_id='"+ custid +"'";
                                ResultSet rs = st.executeQuery(Query);
                                while (rs.next()) {
                                    String status = rs.getString("status");
                                    boolean isAccepted = status.equals("accepted");
                        %>
                        <tbody>
                        <tr>
                            <th><%=++slno%></th>
                            <td><img src='../admin/assets/img/<%=rs.getString("product_image1")%>' width="100" height="60"></td>
                            <td><%=rs.getString("product_name")%></td>
                            <td><%=rs.getString("description")%></td>
                            <td><%=rs.getString("quantity1")%></td>
                            <td><%=rs.getString("total_amount")%></td>
                            <td><%=status%></td>
                        </tr>
                        </tbody>
                       
                    </table>
                     <%
                        boolean showPaymentButton = false;
                        rs.beforeFirst();
                        while (rs.next()) {
                            String status1 = rs.getString("status");
                            if (status1.equals("accepted")) {
                                showPaymentButton = true;
                                break;
                            }
                        }
                        if (showPaymentButton) { %>
                        <div style="padding-left:47%">
                            <button class="button2" id="payment" type="submit"><a href="payment.jsp?id=<%=rs.getString("product_id")%>">Payment</a></button>
                        </div>
                     <%  }}}catch(Exception e){
                                }%>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="view1/js/jquery.min.js"></script>
<script src="view1/js/popper.js"></script>
<script src="view1/js/bootstrap.min.js"></script>
<script src="view1/js/main.js"></script>
</body>
</html>

<jsp:include page="buyerfooter.jsp" />
