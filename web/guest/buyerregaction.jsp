<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="craftpackage.JavaClass" %>

<%
try {
    Connection con = JavaClass.getCon();
    PreparedStatement stmt1 = con.prepareStatement("INSERT INTO login (username, password, role, status) VALUES (?, ?, 'customer', 'confirmed')");
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String district = request.getParameter("district_id");
    String location = request.getParameter("location_id");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String password = request.getParameter("password");
 
    stmt1.setString(1, email);
    stmt1.setString(2, password);
    stmt1.executeUpdate();
 
    ResultSet rs1 = stmt1.executeQuery("SELECT MAX(login_id) AS lid FROM login");
    if (rs1.next()) {
        String lid = rs1.getString("lid");
        PreparedStatement stmt2 = con.prepareStatement("INSERT INTO customerreg (customer_name, address, district_id, location, phone, login_id) VALUES (?, ?, ?, ?, ?, ?)");
        stmt2.setString(1, name);
        stmt2.setString(2, address);
        stmt2.setString(3, district);
        stmt2.setString(4, location);
        stmt2.setString(5, phone);
        stmt2.setString(6, lid);
        stmt2.executeUpdate();
 
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
    message.setText("Thank you for registering. Wish you a cheerful shopping experience.");

    // Send the email
    Transport.send(message);

    out.println("Email sent successfully!");
} catch (Exception e) {
    out.println("An error occurred while sending the email: " + e.getMessage());
}
%>
