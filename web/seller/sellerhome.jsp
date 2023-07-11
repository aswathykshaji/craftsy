<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="sellerheader.jsp" />


<!-- Slider -->

<div class="main_slider" style="background-image:url(images/sew.jpg)">
    <div class="container fill_height">
        <div class="row align-items-center fill_height">
            <div class="col">
                <div class="main_slider_content">
                    <!--<h6>Spring / Summer Collection 2017</h6>-->
                    <h1>Get up to 30% Off New Arrivals</h1>
                    <div class="red_button shop_now_button"><a href="productview.jsp">View Product</a></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="banner">
    <div class="container">
        <div class="row">
            <%                try {
                    Connection con = JavaClass.getCon();
                    Statement st = con.createStatement();
                    String Query = "select * from category";
                    ResultSet rs = st.executeQuery(Query);
                    int Count = 0;

                    while (rs.next() && Count < 4) {
            %>

            <div class="col-md-3">
                <div class="banner_item align-items-left" style="background-image:url(../admin/assets/img/<%=rs.getString("category_image")%>)" width="500" height="500">
                    <div class="banner_category">
                        <a><%=rs.getString("category_name")%></a>
                    </div>
                </div>
            </div>
            <%
                        Count++;
                    }
                } catch (Exception e) {

                }
            %>



        </div>
    </div>
</div>


<jsp:include page="sellerfooter.jsp" />
