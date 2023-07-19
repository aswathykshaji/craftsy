<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="buyerheader.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Rating Page</title>
    <style>
        .rating {
            unicode-bidi: bidi-override;
            direction: rtl;
            text-align: center;
        }
        .rating input {
            display: none;
        }
        .rating label {
            display: inline-block;
            font-size: 30px;
            color: #888;
            cursor: pointer;
        }
        .rating label:before {
            content: "\2605";
        }
        .rating input:checked ~ label,
        .rating input:checked ~ label:before {
            color: #d10024;
        }

        .button2 {
            background-color: #d10024; /* Green */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<br>
<h3><center>Rate This Item</center></h3>
<br>
<%
    try {
        Connection con = JavaClass.getCon();
        Statement st = con.createStatement();
        String custid = (String) session.getAttribute("login_id");
        String Query = "SELECT * FROM request r INNER JOIN login l on r.customer_id=l.login_id INNER JOIN product p on r.product_id=p.product_id  where r.customer_id='"+ custid +"'";
        ResultSet rs = st.executeQuery(Query);
        while (rs.next()) {
%>
<form method="post" action="feedback.jsp">
    <div class="rating" id="star" name="star">
        <input type="radio" id="star5" name="star" value="5" /><label for="star5"></label>
        <input type="radio" id="star4" name="star" value="4" /><label for="star4"></label>
        <input type="radio" id="star3" name="star" value="3" /><label for="star3"></label>
        <input type="radio" id="star2" name="star" value="2" /><label for="star2"></label>
        <input type="radio" id="star1" name="star" value="1" /><label for="star1"></label>
    </div>
    <br>
    <h3><center>Provide Feedback</center></h3>
    <br>
    <center><textarea name="feedback" rows="4" cols="50" placeholder="Enter your feedback here"></textarea><center>
    <br>
    <input type="hidden" value="<%=rs.getString("product_id")%>" name="productid">
    <input type="hidden" value="<%=custid%>" name="customerid">
    <div>
        <button class="button2" type="submit">SUBMIT</button>
    </div>
</form>
<%
    }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>

<jsp:include page="buyerfooter.jsp" />
