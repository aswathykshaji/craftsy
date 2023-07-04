`<%@page import="java.sql.ResultSet"%>
<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<jsp:include page="buyerheader.jsp" />
<style>
    body {
        background: rgb(99, 39, 120)
    }

    .form-control:focus {
        box-shadow: none;
        border-color: #BA68C8
    }

    .profile-button {
        background: rgb(99, 39, 120);
        box-shadow: none;
        border: none
    }

    .profile-button:hover {
        background: #682773
    }

    .profile-button:focus {
        background: #682773;
        box-shadow: none
    }

    .profile-button:active {
        background: #682773;
        box-shadow: none
    }

    .back:hover {
        color: #682773;
        cursor: pointer
    }

    .labels {
        font-size: 11px
    }

    .add-experience:hover {
        background: #BA68C8;
        color: #fff;
        cursor: pointer;
        border: solid 1px #BA68C8
    }
    .btn-primary {
    color: #fff;
    background-color: #d10024;
    border-color: #d10024;
</style>
<form action="updateprofile.jsp" method="post">
<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <%
            try {
                String lid = (String) session.getAttribute("login_id");
//                String id = request.getParameter("id");
//                int num = Integer.parseInt(id);
                Connection con = JavaClass.getCon();
                Statement st = con.createStatement();
                String sql = ("SELECT * FROM customerreg c inner JOIN login l on l.login_id=c.login_id inner join location loc on c.location=loc.location_id inner join district d on c.district_id=d.district_id where c.login_id='" + lid + "'");
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
        %>
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold"><%=rs.getString("username")%></span><span class="text-black-50"></span><span> </span></div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">Name</label><input type="text" class="form-control" id="customer_name" name="customer_name" placeholder="first name" value="<%=rs.getString("customer_name")%>"></div>

                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Mobile Number</label><input type="text" class="form-control" placeholder="enter phone number" id="phone" name="phone" value="<%=rs.getString("phone")%>"></div>
                    <div class="col-md-12"><label class="labels">Address Line 1</label><input type="text" class="form-control" placeholder="enter address line 1"  id="address" name="address" value="<%=rs.getString("address")%>"></div>
                    <div class="col-md-12"><label class="labels">Postcode</label><input type="text" class="form-control" placeholder="enter postcode"  id="postcode" name="postcode"value="<%=rs.getString("postcode")%>"></div>
                    <div class="col-md-12"><label class="labels">District</label><input type="text" class="form-control" placeholder="enter district"  id="district" name="district" value="<%=rs.getString("district_name")%>"></div>
                    <div class="col-md-12"><label class="labels">Area</label><input type="text" class="form-control" placeholder="enter location"  id="area" name="area" value="<%=rs.getString("location_name")%>"></div>
                    <div class="col-md-12"><label class="labels">Email ID</label><input type="text" class="form-control" placeholder="enter email id"  id="email" name="email" value="<%=rs.getString("username")%>"></div>
                </div>
                <br>
                <div class="mt-5 text-center">
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                   <button class="btn profile-button" style="background-color: #d10024;border-color: #d10024;color: #fff;" type="button"><a href="updateprofile.jsp"> Save Profile</a></button></div>
                
            </div>

        </div>

        <%
                }
            } catch (Exception e) {

            }

        %>
    </div>
</div>
</form>
    <br>

<jsp:include page="buyerfooter.jsp" />
