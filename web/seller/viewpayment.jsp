<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="sellerheader.jsp" />
<% int slno = 0;%>

<!doctype html>
<html lang="en">
    <head>
        <br><br><br><br><br><br><br><br>
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
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="text-center mb-4">Payment Details</h4>
                        <br>
                        <div class="table-wrap">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr style="background-color: #fe4c50;">
                                        <th>Sl. No</th>     
                                        <th>Product Image</th>
                                        <th>Customer Name</th>
                                        <th>Address</th>
                                        <th>Phone</th>
                                        <th>Quantity</th>
                                        <th>Amount</th>
                                        <th>Feedback</th>
                                        <th>Rating</th> 
                                        <th>Status</th>	
                                    </tr>
                                </thead>
                                <%
                                    try {
                                        //out.println("hello");
                                        Connection con = JavaClass.getCon();
                                        Statement st = con.createStatement();
                                        String sellerid = (String) session.getAttribute("login_id");

                                        //                                    out.print(catid);
                                        String Query = "SELECT * FROM sellerpayment sp INNER JOIN request r on r.request_id=sp.request_id INNER JOIN customerreg cr on sp.customer_id=cr.login_id inner join product pd on pd.product_id=r.product_id INNER JOIN location l on cr.location=l.location_id INNER JOIN district d on d.district_id=cr.district_id INNER JOIN feedback f on f.product_id=r.product_id inner join sellerreg sr on sr.seller_id=sp.seller_id where sp.status='paid' and sr.login_id='" + sellerid + "'";
                                        ResultSet rs = st.executeQuery(Query);
//                                        out.println(Query);
                                        while (rs.next()) {
                                %>
                                <tbody>
                                    <tr>
                                        <th><%=++slno%></th>
                                        <td><img src='../admin/assets/img/<%=rs.getString("product_image1")%>' width="100" height="60"></td>

                                        <td><%=rs.getString("customer_name")%></td>
                                        <td><%=rs.getString("address")%><br><%=rs.getString("location_name")%><br><%=rs.getString("district_name")%><br><%=rs.getString("postcode")%></td>
                                        <td><%=rs.getString("phone")%></td>
                                        <td><%=rs.getString("quantity1")%></td>
                                        <td><%=rs.getString("Total_amount")%></td>
                                        <td><%=rs.getString("feedback")%></td>
                                        <td><%=rs.getString("rating")%>&nbsp;Star</td>
                                        <td><%=rs.getString("status")%></td>
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
<br><br>
        <script src="view1/js/jquery.min.js"></script>
        <script src="view1/js/popper.js"></script>
        <script src="view1/js/bootstrap.min.js"></script>
        <script src="view1/js/main.js"></script>

    </body>
</html>

<jsp:include page="sellerfooter.jsp" />
