<%@ page import="java.io.*,java.util.*,java.sql.*,java.net.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
  <head>
    <title>Selection</title>
    <link rel="stylesheet" type="text/css" href="fail.css">
    <link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
    <style>
      .music {
        border: 2px solid #76ff03;
        padding: 2px;
        margin: 2px;
        border-radius: 10px;
      }

      .music .stitle {
        font-size: 20px;
      }

      .music .album {
        font-size: 15px;
      }

      .music .artist {
        font-size: 15px;
      }

      .music:hover {
        background-color : #E0E0E0;
        cursor : pointer;
      }

      a {
        text-decoration: none;
        color: #76ff03;
      }
    </style>
  </head>
  <body>
  	<h1 class="webTitle">MusicShare</h1>
    <div class="main">
      <center>
        <h1>Results</h1>
        <%
            final String JDBC_DRIVER="com.mysql.jdbc.Driver";
            final String DB_URL="jdbc:mysql://localhost:3306/charan";
            final String USER = "root";
            final String PASS = "arsenal2004";
            Statement stmt=null;
            Connection conn =null;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();
            String key = request.getParameter("title");
            String sql = new String();
            if(key.equals("")) {
              sql = "SELECT * FROM music ORDER BY song ASC";
            }
            else {
              sql = "SELECT * FROM music WHERE song LIKE '%" + key + "' OR song LIKE '" + key + "%' OR song LIKE '%" + key + "%' ORDER BY song ASC";
            }
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()) {
              String title = rs.getString("song");
              String album = rs.getString("album");
              String artist = rs.getString("artist1");
              int year = rs.getInt("year");
              String file = rs.getString("file");
              try {
                out.println("<a href=\"play.jsp?file=" + URLEncoder.encode(file, "UTF-8") + "\">" +
                            "<div class=\"music\">" +
                            "<p class=\"stitle\">" + title + "</p>" +
                            "<p class=\"album\">" + album  + "(" + year + ")" + "</p>" +
                            "<p class=\"artist\">" + artist  + "</p>" +
                            "<input type=\"hidden\" name=\"file\" value=\"" + file + "\" />" +
                            "</a></div>");
          		}
          		catch(Exception e) {
          		  out.println("Error");
          		}
            }
            conn.close();
        %>
      </center>
    </div>
  </body>
</html>
