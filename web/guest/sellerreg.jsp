<jsp:include page="guestheader.jsp"/>

<%@page import="java.sql.*" %>
<%@page import="craftpackage.JavaClass" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Seller Registration</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- MATERIAL DESIGN ICONIC FONT -->
        <link rel="stylesheet" href="seller/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

        <!-- STYLE CSS -->
        <link rel="stylesheet" href="seller/css/style.css">
    </head>

    <body>

        <div class="wrapper" style="background-image: url('seller/images/bg-registration-form-1.jpg'); ">
            <div class="inner" style="padding-top: 6px;">
                <div class="image-holder">
                    <img src="seller/images/registration-form-1.jpg" alt="" style="max-height:100%">
                </div>
                <form action="sellerregaction.jsp"method="post" onsubmit="return validateForm()">
                    <h3>Registration Form</h3>

                    <div class="form-wrapper">
                        <label>Name</label>
                        <input type="text" placeholder="Name" name="name" class="form-control" required>
                    </div>

                    <div class="form-wrapper">
                        <label>Email</label>
                        <input type="text" placeholder="Email " name="email" class="form-control" required>
                        <i class="zmdi zmdi-email"></i>
                    </div>
                    <div class="form-wrapper">
                        <label>Gender</label>
                        <select name="gender" id="" class="form-control" required>
                            <option value="" disabled selected>Gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Other</option>
                        </select>
                        <i class="zmdi zmdi-caret-down" style="font-size: 10px"></i>
                    </div>
                    <div class="form-wrapper">
                        <label>Phone</label>
                        <input type="text" placeholder="Phone" name="phone" class="form-control" required>

                    </div>
                    <div class="form-wrapper">
                        <label for="">District:</label>
                        <div class="form-holder select">
                            <select name="district_id" id="district_id" onchange="displayloc()" class="form-control" required>
                                <option value="united states">--select--</option>
                                <!--									<option value="united kingdom"></option>
                                                                                                        <option value="viet nam"></option>-->
                                <%
                                    try {
                                        Connection con = JavaClass.getCon();
                                        Statement st = con.createStatement();
                                        String Query = "select * from district";
                                        ResultSet rs = st.executeQuery(Query);
                                        while (rs.next()) {
                                %>
                                <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                                <%
                                        }
                                    } catch (Exception e) {

                                    }
                                %>
                            </select>
                            <i class="zmdi zmdi-pin"></i>
                        </div>
                    </div>
                    <div class="form-wrapper">
                        <label>Location</label>
                        <div class="form-holder select" id="loc">
                            <select name="location_id" id="location_id"  class="form-control">
                                <option value="united states">--select--</option>

                            </select>
                            <i class="zmdi zmdi-pin"></i>
                        </div>
                    </div>

                    <div class="form-wrapper">
                        <label>Password</label>
                        <input type="password" placeholder="Password"  name="password" class="form-control" required>
                        <i class="zmdi zmdi-lock"></i>
                    </div>

                            <button class="btn" style="color:white">Register
                        <i class="zmdi zmdi-arrow-right"></i>
                    </button>
                </form>
            </div>
        </div>

    </body>
</html>
<div id="loc"></div>
<script>
    function validateForm() {
        var name = document.getElementById("name").value;
        var email = document.getElementById("email").value;
        var gender = document.getElementById("gender").value;
        var phone = document.getElementById("phone").value;
        var password = document.getElementById("password").value;
        var districtId = document.getElementById("district_id").value;
        var locationId = document.getElementById("location_id").value;

        if (name.trim() === "") {
            alert("Username must be filled out");
            return false;
        }

        if (email.trim() === "") {
            alert("Email must be filled out");
            return false;
        }

        if (gender.trim() === "") {
            alert("Gender must be filled out");
            return false;
        }

        if (phone.trim() === "") {
            alert("Phone must be filled out");
            return false;
        }

        if (password.trim() === "") {
            alert("Password must be filled out");
            return false;
        }

        if (districtId === "united states") {
            alert("Please select a district");
            return false;
        }

        if (locationId === "united states") {
            alert("Please select a location");
            return false;
        }

        return true;
    }
    function displayloc()
    {
        var val = document.getElementById('district_id').value;
        $.ajax({
            type: "POST",
            url: "getlocation.jsp",
            data: "id=" + val,
            success: function(data2)
            {
                $("#loc").html(data2);
            }
        })
    }
</script>
<jsp:include page="guestfooter.jsp"/>
