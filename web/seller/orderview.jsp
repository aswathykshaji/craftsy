<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="sellerheader.jsp" />
<% int slno = 0;%>

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
                        <h4 class="text-center mb-4">Order View</h4>
                        <br>
                        <div class="table-wrap">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr style="background-color: #fe4c50;">
                                        <th>Sl. No</th>     
                                        <th>Product Image</th>
                                        <th>Product Name</th>
                                        <th>Customer Name</th>
                                        <th>Address</th>
                                        <th>Phone</th>                                   
                                        <th>Quantity</th>	
                                        <th>Total Price</th>
                                        <th>Order Date</th>
                                        <th>Processing</th> 
                                        <th>Shipped</th>
                                        <th>Delivered</th>

                                    </tr>
                                </thead>
                                <%
                                    try {
                                        //out.println("hello");
                                        Connection con = JavaClass.getCon();
                                        Statement st = con.createStatement();
                                        String sellerid = (String) session.getAttribute("login_id");

                                        //                                    out.print(catid);
                                        String Query = "SELECT * FROM request r inner join sellerreg s on r.seller_id=s.seller_id inner join customerreg c on r.customer_id=c.login_id inner join product p on r.product_id=p.product_id inner join location l on c.location=l.location_id inner join district d on l.district_id=d.district_id INNER JOIN login log on log.login_id=s.login_id where s.login_id='" + sellerid + "' and r.status='Paid'";
                                        ResultSet rs = st.executeQuery(Query);
                                        while (rs.next()) {

                                %>

                                <tbody>
                                    <tr>
                                        <th><%=++slno%></th>
                                        <td><img src='../admin/assets/img/<%=rs.getString("product_image1")%>' width="100" height="60"></td>
                                        <td><%=rs.getString("product_name")%></td>
                                        <td><%=rs.getString("customer_name")%></td>
                                        <td><%=rs.getString("address")%><br><%=rs.getString("district_name")%><br><%=rs.getString("location_name")%></td>
                                        <td><%=rs.getString("phone")%></td>
                                        <td><%=rs.getString("quantity1")%></td>
                                        <td><%=rs.getString("total_amount")%></td>
                                        <td><%=rs.getString("date")%></td>


                               <td>
    <a href="orderviewaction.jsp?id=<%=rs.getString("request_id")%>&action=Processing" class="btn btn-dark btn-icon-text">
        Processing
    </a>
</td>
<td>
    <a href="orderviewaction.jsp?id=<%=rs.getString("request_id")%>&action=Shipped" class="btn btn-dark btn-icon-text">
        Shipped
    </a>
</td>
<td>
    <a href="orderviewaction.jsp?id=<%=rs.getString("request_id")%>&action=Delivered" class="btn btn-dark btn-icon-text">
        Delivered
    </a>
</td>



                                    </tr>

                                    <%
                                            }
                                        } catch (Exception e) {
                                            //out.println("error");
                                        }

                                    %> 
                                </tbody>

                            </table>
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

<jsp:include page="sellerfooter.jsp" />
