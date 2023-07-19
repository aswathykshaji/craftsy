<%@ page import="craftpackage.JavaClass" %>
<%@ page import="java.sql.*" %>
<%
try {
    Connection con = JavaClass.getCon();
    Statement st = con.createStatement();
    String logid = (String) session.getAttribute("login_id");
//    out.println(logid);
    String seller_name = request.getParameter("seller_name");
        out.println(seller_name);
    String phone = request.getParameter("phone");
//        out.println(phone);
    String gender = request.getParameter("gender");
//        out.println(address);
    String district = request.getParameter("district");
//        out.println(district);
    String area = request.getParameter("location");
//        out.println(area);
    String email = request.getParameter("email");
//    out.println(email);
    String sql1 = "UPDATE sellerreg SET seller_name='" + seller_name + "', gender='" + gender + "', phone='" + phone + "', district='" + district + "', location='" + area + "', WHERE login_id='" + logid + "'";
    String sql2 = "UPDATE login SET username='" + email + "' WHERE login_id='" + logid + "'";
    st.executeUpdate(sql1);
    st.executeUpdate(sql2);
    response.sendRedirect("sellerprofile.jsp");
} catch (Exception e) {
    e.printStackTrace();
}
%>