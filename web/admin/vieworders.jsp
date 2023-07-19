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
                        <h4 class="text-center mb-4">Order View</h4>
                        <div class="table-wrap">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr style="background-color: #1c1c1d">
                                        <th>Sl. No</th>     
                                        <th>Product Image</th>
                                        <th>Seller </th>                                        
                                        <th>Customer </th>                                                                                                    	
                                        <th>Quantity</th>
                                        <th>Amount</th>
                                        <th>Status</th>	

                                    </tr>
                                </thead>
                                <tbody>
                                    <% try {
                                            Connection con = JavaClass.getCon();
                                            Statement st = con.createStatement();
                                            String Query = "SELECT * FROM request r inner join product p on p.product_id=r.product_id inner join customerreg cr on cr.login_id=r.customer_id inner join sellerreg sr on sr.seller_id=r.seller_id";
                                            ResultSet rs = st.executeQuery(Query);
                                            while (rs.next()) {
                                    %>
                                    <tr>
                                        <th><%=++slno%></th>
                                        <td><img src='../admin/assets/img/<%=rs.getString("product_image1")%>' width="100" height="60"></td>
                                        <td><%=rs.getString("seller_name")%><br><%=rs.getString("phoneno")%></td>
                                        <td><%=rs.getString("customer_name")%><br><%=rs.getString("address")%><br><%=rs.getString("phone")%></td>
                                        <td><%=rs.getString("quantity1")%></td>
                                        <td><%=rs.getString("total_amount")%></td>
                                        <td><%=rs.getString("status")%></td>

                                     

                                    </tr>
                                    <% } 
                                    }
                                    catch (Exception e) {
//                                        out.println();
                                        }%>
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
