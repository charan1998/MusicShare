<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.concurrent.TimeUnit"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
  <head>
    <meta charset="utf-8">
    <title>Play</title>
    <link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
    <style>
      body {
        font-family : 'Pacifico', cursive;
        color : green;
        padding 10px;
      }
    </style>
  </head>
  <body>
    <center>
      <%
        String source = request.getParameter("file");
        out.println("<audio controls autoplay><source src=\"" + source + "\"> </audio>");
      %>
      <br><br>
      <a href="search.html">Return to search</a>
    </center>
  </body>
</html>
