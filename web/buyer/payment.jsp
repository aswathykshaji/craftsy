<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.Connection"%>


<jsp:include page="buyerheader.jsp" />
<style>

    .box-2 {
        max-width: 450px;
        padding: 10px 40px;
    }

    .box-2 .box-inner-2 input.form-control {
        font-size: 12px;
        font-weight: 600;
    }

    .box-2 .box-inner-2 .inputWithIcon {
        position: relative;
    }

    .box-2 .box-inner-2 .inputWithIcon span {
        position: absolute;
        left: 15px;
        top: 8px;
    }

    .box-2 .box-inner-2 .inputWithcheck {
        position: relative;
    }

    .box-2 .box-inner-2 .inputWithcheck span {
        position: absolute;
        width: 20px;
        height: 20px;
        border-radius: 50%;
        background-color: green;
        font-size: 12px;
        color: white;
        display: flex;
        justify-content: center;
        align-items: center;
        right: 15px;
        top: 6px;
    }

    .form-control:focus,
    .form-select:focus {
        box-shadow: none;
        outline: none;
        border: 1px solid #7700ff;
    }

    .border:focus-within {
        border: 1px solid #7700ff !important;
    }

    .box-2 .card-atm .form-control {
        border: none;
        box-shadow: none;
    }

    .form-select {
        border-radius: 0;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;

    }

    .address .form-control.zip {
        border-radius: 0;
        border-bottom-left-radius: 10px;

    }

    .address .form-control.state {
        border-radius: 0;
        border-bottom-right-radius: 10px;

    }

    .box-2 .box-inner-2 .btn.btn-outline-primary {
        width: 120px;
        padding: 10px;
        font-size: 11px;
        padding: 0% !important;
        display: flex;
        align-items: center;
        border: none;
        border-radius: 0;
        background-color: whitesmoke;
        color: black;
        font-weight: 600;
    }

    .box-2 .box-inner-2 .btn.btn-primary {
        background-color: #7700ff;
        color: whitesmoke;
        font-size: 14px;
        display: flex;
        align-items: center;
        font-weight: 600;
        justify-content: center;
        border: none;
        padding: 10px;
    }

    .box-2 .box-inner-2 .btn.btn-primary:hover {
        background-color: #7a34ca;
    }

    .box-2 .box-inner-2 .btn.btn-primary .fas {
        font-size: 13px !important;
        color: whitesmoke;
    }

</style>
<div class="container d-lg-flex">

    <div class="box-2">
        <div class="box-inner-2">
            <div>
                <p class="fw-bold">Payment Details</p>
                <p class="dis mb-3">Complete your purchase by providing your payment details</p>
            </div>
            <form action="">
                <%
                    try {
                        Connection con = JavaClass.getCon();
                        Statement st = con.createStatement();
                        String custid = (String) session.getAttribute("login_id");
                        String Query = "SELECT * FROM request r INNER JOIN login l on r.customer_id=l.login_id INNER JOIN product p on r.product_id=p.product_id inner join customerreg cr on cr.login_id=l.login_id inner join location loc on loc.location_id=cr.location inner join district d on d.district_id=loc.district_id"
                                + " where r.customer_id='" + custid + "'";
                        ResultSet rs = st.executeQuery(Query);
                        while (rs.next()) {

                %>
                <div class="mb-3">
                    <p class="dis fw-bold mb-2">Customer Name</p>
                    <input class="form-control" type="text" value="<%=rs.getString("customer_name")%>">
                </div>
                <div class="mb-3">
                    <p class="dis fw-bold mb-2">Email address</p>
                    <input class="form-control" type="email" value="<%=rs.getString("username")%>">
                </div>
                <div>
                    <p class="dis fw-bold mb-2">Card details</p>
                    <div class="d-flex align-items-center justify-content-between card-atm border rounded">
                        <div class="fab fa-cc-visa ps-3"></div>
                        <input type="text" class="form-control" placeholder="Card Details">
                        <div class="d-flex w-50">
                            <input type="text" class="form-control px-0" placeholder="MM/YY">
                            <input type="password" maxlength=3 class="form-control px-0" placeholder="CVV">
                        </div>
                    </div>
                    <div class="my-3 cardname">
                        <p class="dis fw-bold mb-2">Cardholder name</p>
                        <input class="form-control" type="text">
                    </div>
                    <div class="address">
                        <p class="dis fw-bold mb-3">Billing address</p>
                        <input class="form-control" type="text" value="<%=rs.getString("address")%><br><%=rs.getString("location_name")%><br><%=rs.getString("district_name")%>">

                        <div class="d-flex">
                            <input class="form-control zip" type="text" placeholder="ZIP">
                            <input class="form-control state" type="text" placeholder="State">
                        </div>
                        <div class=" my-3">
                            <p class="dis fw-bold mb-2">VAT Number</p>
                            <div class="inputWithcheck">
                                <input class="form-control" type="text" value="GB012345B9">
                                <span class="fas fa-check"></span>

                            </div>
                        </div>
                        <div class="d-flex flex-column dis">
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p>Subtotal</p>
                                <p><span class="fas fa-dollar-sign"></span>33.00</p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p>VAT<span>(20%)</span></p>
                                <p><span class="fas fa-dollar-sign"></span>2.80</p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p class="fw-bold">Total</p>
                                <p class="fw-bold"><span class="fas fa-dollar-sign"></span>35.80</p>
                            </div>
                            <div class="btn btn-primary mt-2">Pay<span class="fas fa-dollar-sign px-1"></span>35.80
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    } catch (Exception e) {

                    }
                %>
            </form>
        </div>
    </div>
</div>

<jsp:include page="buyerfooter.jsp" />