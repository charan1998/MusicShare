<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.concurrent.TimeUnit"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
  <head>
    <title>Success</title>
  </head>
  <body>
    <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
       url = "jdbc:mysql://localhost/charan"
       user = "root"  password = "arsenal2004"/>
    <c:set var="first" scope="page" value="${param.first}" />
    <c:set var="last" scope="page" value="${param.last}" />
    <c:set var="email" scope="page" value="${param.email}" />
    <c:set var="pass" scope="page" value="${param.pass}" />
    <sql:update dataSource="${snapshot}" var="count">
      INSERT INTO users VALUES ('${first}', '${last}', '${email}', '${pass}');
    </sql:update>
    <c:choose>
      <c:when test="${count == 1}">
        <c:redirect url = "login.html"/>
      </c:when>
      <c:otherwise>
        <img height="200" width="200" src="http://images.clipartpanda.com/smiley-face-transparent-background-very_unhappy.png">
				<p>Login failed...<a href="login.html">Try again</a>...</p>
      </c:otherwise>
    </c:choose>
  </body>
</html>
