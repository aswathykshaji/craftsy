<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="buyerheader.jsp" />
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-4" style="padding-left: 10%">
                <%
                    try {
                        String id = request.getParameter("id");
                        int num = Integer.parseInt(id);
                        Connection con = JavaClass.getCon();
                        Statement st = con.createStatement();
                        String sql = ("Select * from product where product_id='" + num + "'");
                        ResultSet rs = st.executeQuery(sql);
                        while (rs.next()) {

                %>
                <!-- product -->
                <div class="product" >
                    <div class="product-img">
                        <img src="../admin/assets/img/<%=rs.getString("product_image1")%>" alt="">
<!--                        <div class="product-label">
                            <span class="new">NEW</span>
                        </div>-->
                    </div>
                    <div class="product-body">
                        <p class="product-category"></p>
                        <h3 class="product-name"><%=rs.getString("product_name")%></h3>
                        <h4 class="product-price"><p>&#8377; <%=rs.getString("price")%></p> <del class="product-old-price"><p> &#8377;990.00</p></del></h4>
                        <h4 class="product-price"> <%=rs.getString("description")%> </h4>

<!--                        <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>-->
<!--                        <div class="product-btns">
                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                        </div>-->
                    </div>
                    <div class="add-to-cart">
                        <a onclick="return confirm('Do u want to book now?')" href="buynow.jsp?id=<%=rs.getString("product_id")%>"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>   Buy Now</button></a>
                    </div>
                </div>

            </div>
            <%
                    }
                } catch (Exception e) {

                }
            %>
        </div>
    </div>
</div>

<!-- /product -->
<jsp:include page="buyerfooter.jsp" />
