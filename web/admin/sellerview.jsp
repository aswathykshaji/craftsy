<jsp:include page="adminindex.jsp"/>
<%@page import="java.sql.*"%>
<%@page import="craftpackage.JavaClass"%>
<% int slno = 0;%>  
<!doctype html>
<html lang="en">
    <head>
        <title>Table 03</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="table/css/style.css">

    </head>
    <body>
        <section class="ftco-section">
            <div class="container">
                <a href="sellerrequest.jsp">   <button class="button" style="background-color: #6807f9;color: whitesmoke; ">Request</button></a>
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="text-center mb-4">Seller View</h4>
                        <div class="table-wrap">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr style="background-color: #1c1c1d">
                                        <th>SL. NO</th>	
                                        <th>Seller Name</th>
                                        <th>Gender</th>
                                        <th>Phone</th>
                                        <th>District</th>
                                        <th>Location</th>
                                        <th>Email</th>

                                     

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        try {
                                            Connection con = JavaClass.getCon();
                                            Statement st = con.createStatement();
                                            String Query = "SELECT * FROM sellerreg s inner join login l on s.login_id=l.login_id INNER join district d on s.district=d.district_id INNER JOIN location loc on loc.location_id=s.location where l.status='confirmed'";
                                            ResultSet rs = st.executeQuery(Query);
                                            while (rs.next()) {
                                    %>
                                    <tr>
                                        <td><%=++slno%></td>
                                        <td><%=rs.getString("seller_name")%></td>
                                        <td><%=rs.getString("gender")%></td>                       
                                        <td><%=rs.getString("phoneno")%></td>
                                        <td><%=rs.getString("district_name")%></td>
                                        <td><%=rs.getString("location_name")%></td>
                                        <td><%=rs.getString("username")%></td>
                                        
                                                        
                                            </button></td>


                                        <!--<button type="button" class="btn btn-dark btn-icon-text">Edit</button></a>-->
                                        <!--<button type="button" class="btn btn-dark btn-icon-text">Delete</button></a>-->



                                    </tr>
                                    <%
                                            }
                                        } catch (Exception e) {
                                            out.println("exception");
                                        }
                                    %> 

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

