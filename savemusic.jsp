<%@ page import = "java.io.*,java.util.*, javax.servlet.*, java.sql.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>

<c:set var="song" scope="page" value="${title}" />
<c:set var="talbum" scope="page" value="${album}" />
<%
   File file ;
   int maxFileSize = 5000 * 1024 * 10;
   int maxMemSize = 5000 * 1024 * 10;
   ServletContext context = pageContext.getServletContext();
   String filePath = "/usr/apache-tomcat-8.5.20/webapps/musicshare/";
   String contentType = request.getContentType();
   final String JDBC_DRIVER="com.mysql.jdbc.Driver";
   final String DB_URL="jdbc:mysql://localhost:3306/charan";
   final String USER = "root";
   final String PASS = "arsenal2004";
    Statement stmt=null;
    Connection conn =null;
   Class.forName("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection(DB_URL, USER, PASS);
   if (true) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(maxMemSize);
      factory.setRepository(new File("/tmp/"));
      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setSizeMax( maxFileSize );
      try {
         List fileItems = upload.parseRequest(request);
         Iterator i = fileItems.iterator();
         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");
         out.println("</head>");
         out.println("<body>");
         while ( i.hasNext () )
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )  {
                String fieldName = fi.getFieldName();
                String fileName = fi.getName();
                boolean isInMemory = fi.isInMemory();
                long sizeInBytes = fi.getSize();
                file = new File( filePath + fileName) ;
                fi.write( file ) ;
                out.println("Uploaded Filename: " + filePath + fileName + "<br>");
                String query = "UPDATE music SET file=? WHERE ((song LIKE ?) AND (album LIKE ?))";
               PreparedStatement preparedStmt = conn.prepareStatement(query);
               preparedStmt.setString(1, fileName);
               preparedStmt.setString(2, (String)pageContext.getAttribute("song"));
               preparedStmt.setString(3, (String)pageContext.getAttribute("talbum"));
               preparedStmt.execute();
            }
         }
         out.println("</body>");
         out.println("</html>");
      } catch(Exception ex) {
         System.out.println(ex);
      }
   } else {
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
<c:redirect url="start.jsp" />
