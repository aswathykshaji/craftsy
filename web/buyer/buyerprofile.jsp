<%@page import="java.sql.ResultSet"%>
<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>


<jsp:include page="buyerheader.jsp" />

<%
try {
    String lid = (String) session.getAttribute("login_id");
    Connection con = JavaClass.getCon();
    Statement st = con.createStatement();
    String sql = "SELECT * FROM customerreg c "
            + "INNER JOIN login l ON l.login_id=c.login_id "
            + "INNER JOIN location loc ON c.location=loc.location_id "
            + "INNER JOIN district d ON c.district_id=d.district_id "
            + "WHERE c.login_id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, lid);
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
        String districtid = rs.getString("district_id");
        String locid = rs.getString("location_id");
        String locname = rs.getString("location_name");
%>

<br><br>
<form action="updateprofile.jsp" method="post">
    <div class="container rounded bg-white mt-5 mb-5">
        <div class="row">
            <div class="col-md-3 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                    <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                    <span class="font-weight-bold"><%= rs.getString("username") %></span>
                    <span class="text-black-50"></span><span> </span>
                </div>
            </div>
            <div class="col-md-5 border-right">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Profile Settings</h4>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Name</label>
                            <input type="text" class="form-control" id="customer_name" name="customer_name" placeholder="first name" value="<%= rs.getString("customer_name") %>">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Mobile Number</label>
                            <input type="text" class="form-control" placeholder="enter phone number" id="phone" name="phone" value="<%= rs.getString("phone") %>">
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Address Line 1</label>
                            <input type="text" class="form-control" placeholder="enter address line 1" id="address" name="address" value="<%= rs.getString("address") %>">
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Postcode</label>
                            <input type="text" class="form-control" placeholder="enter postcode" id="postcode" name="postcode" value="<%= rs.getString("postcode") %>">
                        </div>
                        <div class="col-md-12">
                            <label class="labels">District</label>
                            <select class="form-control" id="district" name="district" onchange="displaylocation()">
                                <% 
                                try {
                                    String querycat = "SELECT * FROM district";
                                    ResultSet rscat = st.executeQuery(querycat);
                                    while (rscat.next()) {
                                        String district_id = rscat.getString("district_id");
                                        String district_name = rscat.getString("district_name");
                                        boolean isSelected = district_id.equals(districtid);

                                        if (isSelected) {
                                %>
                                <option value="<%= district_id %>" selected><%= district_name %></option>
                                <%
                                } else {
                                %>
                                <option value="<%= district_id %>"><%= district_name %></option>
                                <%
                                        }
                                    }
                                    rscat.close();
                                } catch (Exception e) {
                                    out.println("Exception occurred: " + e.getMessage());
                                }
                                %>                              
                            </select>
                        </div>
                        <div class="col-md-12">
                            <div id="locationDropdown">
                                <label class="labels">Location</label>
                                <select class="form-control" id="location" name="location">
                                    <option selected value="<%= locid %>"><%= locname %></option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Email ID</label>
                            <input type="text" class="form-control" placeholder="enter email id" id="email" name="email" value="<%= rs.getString("username") %>">
                        </div>
                    </div>
                </div>
                <br>
                <div class="mt-5 text-center">
                    <!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
                    <button class="btn profile-button" style="align-item:right ;background-color: #d10024;border-color: #d10024;color: #fff;" type="submit">Save Profile</button>
                </div>
            </div>
        </div>
    </div>
</form>

<%
    }
    rs.close();
    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

<br>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function displaylocation() {
        var val = document.getElementById('district').value;
        $.ajax({
            type: "POST",
            url: "getlocation.jsp",
            data: "id=" + val,
            success: function(data2) {
                $("#locationDropdown").html(data2);
            }
        });
    }
</script>

<jsp:include page="buyerfooter.jsp" />



