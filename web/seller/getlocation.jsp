<%@page import="java.sql.*" %>
<%@page import="craftpackage.JavaClass" %>
<%
    try {
        Connection con = JavaClass.getCon();
        Statement st = con.createStatement();
        String locid = request.getParameter("id");
        String Query = "select * from location where district_id='" + locid + "'";
        ResultSet rs = st.executeQuery(Query);
%>
<!--<label>Subcategory</label>-->
<label class="labels">location</label>

<select name="location" id="subcategory" class="form-control">
    <option value="location">select location</option>
    <%
        while (rs.next()) {
    %>
    <option value="<%=rs.getString("location_id")%>"><%=rs.getString("location_name")%></option>
    <%
        }
    %>
</select>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
