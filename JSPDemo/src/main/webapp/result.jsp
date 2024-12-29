<%--
  Created by IntelliJ IDEA.
  User: 29630
  Date: 2024/11/21
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.RateBean" %>
<%@ page import="org.RateBean" %>
<!DOCTYPE html>
<html>
<head>
    <title>Converter Result</title>
</head>
<body>
<h2>Converter Result</h2>
<%
    RateBean rateBean = (RateBean) request.getAttribute("rateBean");
%>
    Input the amount: <%= rateBean.getFromAmount() %> (AUD)<br>
    Converted Amount: <%= rateBean.getToAmount() %> (USD)<br>
<a href="index.jsp">return index.jsp</a>
</body>
</html>
