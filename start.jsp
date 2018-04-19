<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.concurrent.TimeUnit"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,javax.servlet.http.Cookie"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
  <head>
    <title>MusicShare</title>
    <link rel="stylesheet" type="text/css" href="stylemain.css">
    <link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
  </head>
  <body>
    <h1 class="webTitle">MusicShare</h1>
    <div class="main">
      <a id="logout" href="index.html">Logout, <c:out value="${username}" /></a>
      <center>
        <div class="linkbutton"><a href="search.html">Search</a></div>
        <div class="linkbutton"><a href="upload.html">Upload</a></div>
      </center>
    </div>
  </body>
</html>
