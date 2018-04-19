<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.concurrent.TimeUnit"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="javax.servlet.http.*" %>

<html>
  <head>
    <title>File Selection</title>
    <link rel="stylesheet" type="text/css" href="fail.css">
    <link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
  </head>
  <body>
  	<h1 class="webTitle">MusicShare</h1>
    <div class="main">
      <center>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
				   url = "jdbc:mysql://localhost/charan"
				   user = "root"  password = "arsenal2004"/>
				<c:set var="title" scope="session" value="${param.title}" />
				<c:set var="album" scope="session" value="${param.album}" />
        <c:set var="artist" scope="page" value="${param.artist}" />
        <c:set var="year" scope="page" value="${param.year}" />
        <sql:update dataSource="${snapshot}" var="count">
          INSERT INTO music(song, album, artist1, year, file) VALUES ('${title}', '${album}', '${artist}', ${year}, '');
        </sql:update>
        <c:redirect url="fileselect.html" />
      </center>
    </div>
  </body>
</html>
