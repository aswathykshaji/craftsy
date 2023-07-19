<jsp:include page="adminindex.jsp"/>
<%@page import="java.sql.*"%>
<%@page import="craftpackage.JavaClass"%>
<%
    int slno = 0;
%>  
<!doctype html>
<html lang="en">
    <head>
        <title>Craftsy</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="table/css/style.css">
    </head>
    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="text-center mb-4">Payment View</h4>
                        <div class="table-wrap">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr style="background-color: #1c1c1d">
                                        <th>Sl. No</th>     
                                        <th>Product Image</th>
                                        <th>Customer </th>                                                                                                    	
                                        <th>Quantity</th>
                                        <th>Amount</th>
                                        <th>Date</th>
                                        <th>Status</th>	
                                        <th>Seller </th>                                        
                                         
                                    </tr>
                                </thead>
                                <tbody>
                                    <% try {
                                        Connection con = JavaClass.getCon();
                                        Statement st = con.createStatement();
                                        String Query = "SELECT * FROM adminpayment sp INNER JOIN request r on r.request_id=sp.request_id INNER JOIN customerreg cr on sp.customer_id=cr.login_id inner join product pd on pd.product_id=r.product_id INNER JOIN location l on cr.location=l.location_id INNER JOIN district d on d.district_id=cr.district_id INNER JOIN feedback f on f.product_id=r.product_id inner join sellerreg sr on sr.seller_id=sp.seller_id where sp.status='paid'";
                                        ResultSet rs = st.executeQuery(Query);

                                        while (rs.next()) {
                                    %>
                                    <tr>
                                        <th><%=++slno%></th>
                                        <td><img src='../admin/assets/img/<%=rs.getString("product_image1")%>' width="100" height="60"></td>
                                        <td><%=rs.getString("customer_name")%><br><%=rs.getString("address")%><br><%=rs.getString("location_name")%><br><%=rs.getString("district_name")%><br><%=rs.getString("postcode")%><br><%=rs.getString("phone")%></td>
                                         <td><%=rs.getString("quantity1")%></td>
                                        <td><%=rs.getString("Amount")%></td>
                                        <td><%=rs.getString("status")%></td>
                                        <td><%=rs.getString("payment_date")%></td>
                                        <% try {
                                            String sellerid = rs.getString("seller_id");
                                            String Qr = "SELECT * FROM sellerreg sr INNER JOIN location l ON sr.location = l.location_id INNER JOIN district d ON l.district_id = d.district_id WHERE sr.seller_id = '"+ sellerid +"'";
                                            ResultSet rst = st.executeQuery(Qr);
                                            if (rst.next()) {
                                        %>
                                        <td><%=rst.getString("seller_name")%><br><%=rst.getString("location_name")%><br><%=rst.getString("district_name")%><br><%=rst.getString("postcode")%><br><%=rst.getString("phoneno")%></td>
                                         <% }} catch (Exception e) { 
                                        
                                        } %>
                                       
                                    </tr>
                                    <% } %>
                                    <% } catch (Exception e) {
//                                        out.println();
                                    } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="table/js/jquery.min.js"></script>
        <script src="table/js/popper.js"></script>
        <script src="table/js/bootstrap.min.js"></script>
        <script src="table/js/main.js"></script>
    </body>
</html>
