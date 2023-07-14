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
    
    <form method="post" action="rating.jsp">
        <div class="rating">
            <input type="radio" id="star5" name="rating" value="5" /><label for="star5"></label>
            <input type="radio" id="star4" name="rating" value="4" /><label for="star4"></label>
            <input type="radio" id="star3" name="rating" value="3" /><label for="star3"></label>
            <input type="radio" id="star2" name="rating" value="2" /><label for="star2"></label>
            <input type="radio" id="star1" name="rating" value="1" /><label for="star1"></label>
        </div>
        <br>
    </form>
    <h3><center>Provide Feedback</center></h3>
     <br>
    <form method="post" action="feedback.jsp">
        <center><textarea name="feedback" rows="4" cols="50" placeholder="Enter your feedback here"></textarea><center>
        <br>
       <div>
                            <button class="button2" id="payment" type="submit"><a>SUBMIT</a></button>
                        </div>
    </form>
</body>
</html>
<jsp:include page="buyerfooter.jsp" />
