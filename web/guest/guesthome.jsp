<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="guestheader.jsp" />
<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <%
                try {
                    Connection con = JavaClass.getCon();
                    Statement st = con.createStatement();
                    String subid = request.getParameter("subcategory_id");
                    String Query = "select * from category";
                    ResultSet rs = st.executeQuery(Query);
                    int Count = 0;

                    while (rs.next() && Count < 4) {
            %>
            <!-- shop -->
            <div class="col-md-3 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src='../admin/assets/img/<%=rs.getString("category_image")%>' width="250" height="250">
                    </div>
                    <div class="shop-body">
                        <h3><%=rs.getString("category_name")%></h3>
                    </div>
                </div>
            </div>
            <!-- /shop -->
            <%
                        Count++;
                    }
                } catch (Exception e) {

                }
            %>





        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">New Products</h3>

                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab1" class="tab-pane active">
                            <div class="products-slick" data-nav="#slick-nav-1">
                                <%
                                    try {
                                        Connection con = JavaClass.getCon();
                                        Statement st = con.createStatement();
                                        String Query = "select * from product";
                                        ResultSet rs = st.executeQuery(Query);
                                        while (rs.next()) {
                                %>
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src='../admin/assets/img/<%=rs.getString("product_image1")%>' width="250" height="250" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category"><h4><%=rs.getString("product_name")%></h4></p>

                                        <h4 class="product-price"><%=rs.getString("price")%><del class="product-old-price">$990.00</del></h4>


                                    </div>                        
                                </div>
                                <%
                                        }
                                    } catch (Exception e) {

                                    }
                                %>
                            </div>
                            <div id="slick-nav-1" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>

            <!-- Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- NEWSLETTER -->
<div id="newsletter" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="newsletter">
                    <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                    <form>
                        <input class="input" type="email" placeholder="Enter Your Email">
                        <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                    </form>
                    <ul class="newsletter-follow">
                        <li>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /NEWSLETTER -->
<jsp:include page="guestfooter.jsp" />
