<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%
try {
Connection con=JavaClass.getCon();
Statement st=con.createStatement();
String name = request.getParameter("name");
String email = request.getParameter("email");
String gender = request.getParameter("gender");
String phone = request.getParameter("phone");
String district_id = request.getParameter("district_id");
String location_id = request.getParameter("location_id");
String password = request.getParameter("password");
 
 String sql1="insert into login(username,password,role,status)values('" + email + "','" + password + "','seller','notconfirmed')";
 out.println(sql1);
 st.executeUpdate(sql1);
 out.println(sql1);
 //get login id
 
 String sql3="select max(login_id) as 'lid' from login";
 out.println(sql3);
 ResultSet rs1 = st.executeQuery(sql3);
 if(rs1.next())
 {
 String lid=rs1.getString("lid");
 out.println("lid");
 String sql4 = "insert into sellerreg(seller_name,gender,phone,district,location,login_id)values('" + name + "','" + gender + "','" + phone + "','" + district_id + "','" + location_id + "',"+lid+")";
 st.executeUpdate(sql4);
 
 response.sendRedirect("../login/loginindex.jsp");
 }
 
 } catch (Exception e) {
 e.printStackTrace();
 }

// Set up SMTP server details
String host = "smtp.gmail.com"; // Replace with your SMTP server
String port = "587"; // Replace with the SMTP port of your server
final String senderEmail = "aswathy082000@gmail.com"; // Replace with the sender email address
final String senderPassword = "byuhybnskwooeegg"; // Replace with the sender email password
String recipientEmail = request.getParameter("email"); // Use request.getParameter to get the recipient email address

// Set up email message properties
Properties props = new Properties();
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.host", host);
props.put("mail.smtp.port", port);

// Create a session with authentication
Session sessions = Session.getInstance(props, new javax.mail.Authenticator() {
    protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
        return new javax.mail.PasswordAuthentication(senderEmail, senderPassword);
    }
});

try {
    // Create a new message
    Message message = new MimeMessage(sessions);

    // Set the sender and recipient addresses
    message.setFrom(new InternetAddress(senderEmail));
    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));

    // Set the subject and content of the email
    message.setSubject("Craftsy");
    message.setText("Thank you for registering. Continue with us.");

    // Send the email
    Transport.send(message);

    out.println("Email sent successfully!");
} catch (Exception e) {
    out.println("An error occurred while sending the email: " + e.getMessage());
}

%>