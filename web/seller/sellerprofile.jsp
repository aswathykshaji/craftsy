<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="sellerheader.jsp" />

<style>
    .gradient-custom-2 {
        /* fallback for old browsers */
        background: #fbc2eb;

        /* Chrome 10-25, Safari 5.1-6 */
        background: -webkit-linear-gradient(to right, rgba(251, 194, 235, 1), rgba(166, 193, 238, 1));

        /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        background: linear-gradient(to right, rgba(251, 194, 235, 1), rgba(166, 193, 238, 1));
    }
</style>
<section class="h-100 gradient-custom-2">
    <%
        try {
            String lid = (String) session.getAttribute("login_id");
            Connection con = JavaClass.getCon();
            Statement st = con.createStatement();
            String sql = "SELECT * FROM sellerreg c inner JOIN login l on l.login_id=c.login_id inner join location loc on c.location=loc.location_id inner join district d on c.district=d.district_id  inner join product p on p.seller_id=c.login_id where c.login_id='" + lid + "'";
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                String sellerName = rs.getString("seller_name");
                String districtName = rs.getString("district_name");
                String gender = rs.getString("gender");
                String locationName = rs.getString("location_name");
                String phone = rs.getString("phone");
                String districtid = rs.getString("district_id");
                String locid = rs.getString("location_id");
                String email = rs.getString("username");

    %>
    <div class="container py-5 h-100">      
        <form action="updatesellerprofile.jsp" method="post">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-lg-9 col-xl-7">
                    <div class="card">
                        <div class="rounded-top text-white d-flex flex-row" style="background-color: #000; height:200px;">
                            <div class="ms-4 mt-5 d-flex flex-column" style="width: 150px;">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp" alt="Generic placeholder image" class="img-fluid img-thumbnail mt-4 mb-2" style="width: 150px; z-index: 1">
                            </div>
                            <div class="ms-3" style="margin-top: 130px;">
                                <h5><%= sellerName%></h5>
                                <p><%= districtName%></p>
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="card-body p-4 text-black">

                            <div class="mb-5">
                                <p class="lead fw-normal mb-1" style="text-align: center;">About</p>
                                <div class="p-4" style="background-color: #f8f9fa;">
                                    <div class="col-md-12">
                                        <label class="labels">Name</label>
                                        <input type="text" class="form-control" name="seller_name" id="seller_name" placeholder="enter phone number" value="<%= sellerName%>">
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Gender</label>
                                        <input type="text" class="form-control" name="gender" id="gender" placeholder="enter phone number" value="<%= gender%>">
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">District</label>
                                        <select class="form-control" id="district" name="district" onchange="displayLocation()">
                                            <%
                                                String querycat = "SELECT * FROM district";
                                                ResultSet rscat = st.executeQuery(querycat);
                                                while (rscat.next()) {
                                                    String district_id = rscat.getString("district_id");
                                                    String district_name = rscat.getString("district_name");
                                                    boolean isSelected = district_id.equals(districtid);

                                                    if (isSelected) {
                                            %>
                                            <option value="<%= district_id%>" selected><%= district_name%></option>
                                            <%
                                            } else {
                                            %>
                                            <option value="<%= district_id%>"><%= district_name%></option>
                                            <%
                                                    }
                                                }
                                                rscat.close();
                                            %>                              
                                        </select>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels" style="color: black;">Location</label>
                                        <select class="form-control" id="location" name="location">
                                            <option selected value="<%= locid%>"><%= locationName%></option>
                                        </select>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Mobile Number</label>
                                        <input type="text" class="form-control" name="phone" id="phone" placeholder="enter phone number" value="<%= phone%>">
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Email</label>
                                        <input type="text" class="form-control" name="email" id="email" placeholder="enter email" value="<%= email%>">
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-outline-dark" data-mdb-ripple-color="dark" style="z-index: 1;">Edit profile</button>

                            </div>
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <p class="lead fw-normal mb-0">Your Products</p>
                                <p class="mb-0"><a href="#!" class="text-muted">Show all</a></p>
                            </div>

                            <div class="row g-2">
                                <div class="col mb-2">
                                    <img src="../admin/assets/img/<%=rs.getString("product_image1")%>" width="100" height="60" alt="image 1" class="w-100 rounded-3">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </form>

    </div>

    <%}
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</section>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function displayLocation() {
        var districtVal = document.getElementById('district').value;
        $.ajax({
            type: "POST",
            url: "getlocation.jsp",
            data: {id: districtVal},
            success: function(data) {
                $("#location").html(data);
            }
        });
    }
</script>
<jsp:include page="sellerfooter.jsp" />
