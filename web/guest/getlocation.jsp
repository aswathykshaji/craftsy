<%@page import="java.sql.*" %>
<%@page import="craftpackage.JavaClass" %>
<%
    try{
        Connection con = JavaClass.getCon();
        Statement st = con.createStatement();
        String locid = request.getParameter("id");
        String Query = "select * from location where district_id='" + locid + "'";
        ResultSet rs = st.executeQuery(Query);
    
    %>
    
                            <select name="location_id" id="location_id"  class="form-control">
                                <option value="united states">--select--</option>
                                <%
        while (rs.next()){
            %>
                <option value="<%=rs.getString("location_id")%>"><%=rs.getString("location_name")%></option>

            <%
        }
        %>
        <%
          }
        catch (Exception e) {
        }
              %>  