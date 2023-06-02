<%@page import="craftpackage.JavaClass" %>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    File file;

    ArrayList<String> fileset = new ArrayList();
    ArrayList<String> details = new ArrayList();
    int maxFileSize = 50000 * 1024;
    int maxMemSize = 50000 * 1024;
    String localpath = "D:/JSP/CRAFT_SHOPPING/web/admin/assets/img/";
    String filePath = localpath;
    File folder = new File(filePath);
    folder.mkdir();
    // Verify the content type
    String contentType = request.getContentType();
//  out.println(contentType);
    if ((contentType.indexOf("multipart/form-data") >= 0)) {

        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("c:\temp"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);
        try {
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);
            // Process the uploaded file items
            //out.println("<br/>"+fileItems);
            Iterator i = fileItems.iterator();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>JSP File upload</title>");
            out.println("</head>");
            out.println("<body>");
            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();

                out.println("<br/>" + fi);
                if (!fi.isFormField()) {
                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    // Write the file
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    fi.write(file);

                    String fname = fileName.substring(fileName.lastIndexOf("\\") + 1);
                    out.println("<br/>file:  " + fname);
                    fileset.add(fname);
                } else {
                    String key = fi.getString();

                    details.add(key);
                }

            }

            try {
                 
//                out.println("hiiii");
                String category = details.get(0);
                out.println(category);
                String subcategory = details.get(1);
                String name = details.get(2);
                String description = details.get(3);
                String quantity = details.get(4);
                String price = details.get(5);
//                String  product_id = details.get(6);

                String file_name = fileset.get(0);
                out.println(file_name);
                 out.println("hi1");

//                String category_image= fileset.get(0);
                Connection con = JavaClass.getCon();
                Statement st = con.createStatement();
                
//                out.println("hiiii");
           
            
                String lid = (String) session.getAttribute("login_id");
                out.println(lid);
                String s = "insert into product(category_id,subcategory_id,product_name,product_image1,description,quantity,price,seller_id) "
                        + "values('" + category + "','" + subcategory + "','" + name + "','" + file_name + "','" + description + "','" + quantity + "','" + price + "','" + lid + "')";
//                out.println(s);
             st.executeUpdate(s);
              String sql3="select max(product_id) as pid from product";
            ResultSet rs1=st.executeQuery(sql3);
             if (rs1.next()){
                String pid=rs1.getString("pid");
             String query7= "insert into stock(stock,product_id)values('"+quantity+"','"+pid+"')"; 
//                out.println(query7);
                st.executeUpdate(query7);
             
             
             
                  
            }
            
//
//    String sql="select max(product_id) as 'pid' from stock";
//            ResultSet rs=st.executeQuery(sql);
//            if (rs1.next()){
//                String pid=rs.getString("pid");
//              
//               String query5="SELECT * FROM stock where product_id='"+pid+"'";
//               out.println(pid);
//               
//                 ResultSet rs2=st.executeQuery(query5);
//             out.println(query5);
//             if(rs2.next())
//                {
//                  
//                 
//               String stock1=rs2.getString("stock");
////                 out.println(stock);
//               int st3=Integer.parseInt(stock1);
//               int quan=Integer.parseInt(quantity);
//              
//               st3=st3+quan;
////                stock='"+stock+"' + '"+quantity+"';
//
//                //out.println(stock);
//                String query6= "UPDATE stock SET stock='"+st3+"' WHERE product_id='"+pid+"'";                  
//           out.println(query6);
//                st.executeUpdate(query6);
//                }
//             else
//             {
//                
//             }  
//                
//            }
               
        st.close();
        con.close();
        out.println("closed");
        // response.sendRedirect("vehsubreg.jsp");
    }catch (Exception e) {
            out.println(e);
            }
%>
<script>
    alert("Product Added Successfully");
    window.location = "productreg.jsp";
</script>
<%
            out.println("</body>");
            out.println("</html>");
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }else {
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet upload</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<p>No file uploaded</p>");
        out.println("</body>");
        out.println("</html>");
    }
%>