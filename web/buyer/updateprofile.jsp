<%@ page import="craftpackage.JavaClass" %>
<%@ page import="java.sql.*" %>
<%
try {
    Connection con = JavaClass.getCon();
    Statement st = con.createStatement();
    String logid = (String) session.getAttribute("login_id");
//    out.println(logid);
    String customer_name = request.getParameter("customer_name");
//        out.println(customer_name);
    String phone = request.getParameter("phone");
//        out.println(phone);
    String address = request.getParameter("address");
//        out.println(address);
    String district = request.getParameter("district");
//        out.println(district);
    String area = request.getParameter("location");
//        out.println(area);
    String email = request.getParameter("email");
//    out.println(email);
    String sql1 = "UPDATE customerreg SET customer_name='" + customer_name + "', phone='" + phone + "', address='" + address + "', district_id='" + district + "', location='" + area + "' WHERE login_id='" + logid + "'";
    String sql2 = "UPDATE login SET username='" + email + "' WHERE login_id='" + logid + "'";

    st.executeUpdate(sql1);
    st.executeUpdate(sql2);

    response.sendRedirect("buyerprofile.jsp");
} catch (Exception e) {
    e.printStackTrace();
}
%>