<jsp:include page="guestheader.jsp"/>
<%@page import="java.sql.*" %>
<%@page import="craftpackage.JavaClass" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Registration</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- MATERIAL DESIGN ICONIC FONT -->
        <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

        <!-- STYLE CSS -->
        <link rel="stylesheet" href="register/css/style.css">
        <style>
            .button{background-color: #A70D2A;}
        </style>
    </head>

    <body>

        <div class="wrapper" style="background-image: url('register/images/image1.jpg');">
            <div class="inner">
                <form action="buyerregaction.jsp" onsubmit="return validateForm()">
                    <h3>Registration Form</h3>
                    <div class="form-group">
                        <div class="form-wrapper">
                            <label for="">Username:</label>
                            <div class="form-holder">
                                <i class="zmdi zmdi-account-o"></i>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                        </div>
                        <div class="form-wrapper">
                            <label for="">Address</label>
                            <div class="form-holder">
                                <i style="font-style: normal; font-size: 15px;"></i>
                                <input type="text" class="form-control" name="address" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-wrapper">
                            <label for="">District</label>
                            <div>
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
                            <label for="">Location</label>
                            <div id="loc">
                                <select name="location_id" id="location_id" class="form-control" required>
                                    <option value="united states">--select--</option>
                                    
                                </select>
                                <i class="zmdi zmdi-pin"></i>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">

                        <div class="form-wrapper">
                            <label for="">Email:</label>
                            <div class="form-holder">
                                <i style="font-style: normal; font-size: 15px;">@</i>
                                <input type="text" class="form-control"name="email" required>
                            </div>
                        </div>
                        <div class="form-wrapper">
                            <label for="">Phone:</label>
                            <div class="form-holder">
                                <i class="zmdi zmdi-lock-outline"></i>
                                <input type="text" class="form-control" name="phone" required>
                            </div>
                        </div>
                    </div>
                                 <div class="form-group">
                    <div class="form-wrapper">
                        <label for=""> Password:</label>
                        <div class="form-holder">
                            <i class="zmdi zmdi-lock-outline"></i>
                            <input type="password" class="form-control" placeholder="********" name="password" required>
                        </div>
                    </div>
            </div>
            
            <div class="form-end">

                <div class="button-holder">
                    <button class="button">Register</button>
                </div>

            </div>
        </form>
    </div>
</div>

</body>
</html>
<div id="loc"></div>
<script>
     function validateForm() {
        var name = document.getElementById("name").value;
        var address = document.getElementById("address").value;
        var email = document.getElementById("email").value;
        var phone = document.getElementById("phone").value;
        var password = document.getElementById("password").value;
          var districtId = document.getElementById("district_id").value;
        var locationId = document.getElementById("location_id").value;


        if (name.trim() === "") {
            alert("Username must be filled out");
            return false;
        }

        if (address.trim() === "") {
            alert("Address must be filled out");
            return false;
        }

        if (email.trim() === "") {
            alert("Email must be filled out");
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
        var val=document.getElementById('district_id').value;
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
