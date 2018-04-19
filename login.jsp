<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.concurrent.TimeUnit"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
  <head>
    <title>Failed</title>
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
				<c:set var="email" scope="page" value="${param.email}" />
				<c:set var="pass" scope="page" value="${param.pass}" />
				<sql:query dataSource="${snapshot}" var="result">
				  SELECT * FROM users WHERE email LIKE '${email}';
				</sql:query>
				<c:choose>
				  <c:when test="${result.rows[0] == NULL || result.rows[0].password != pass}">
				    <img src="http://images.clipartpanda.com/smiley-face-transparent-background-very_unhappy.png">
				    <p>Login failed...<a href="login.html">Try again</a>...<p>
				  </c:when>
				  <c:otherwise>
            <c:set var="username" scope="session" value="${result.rows[0].first}" />
				    <c:redirect url="start.jsp"/>
				  </c:otherwise>
				</c:choose>
      </div>
    </center>
  </body>
</html>
