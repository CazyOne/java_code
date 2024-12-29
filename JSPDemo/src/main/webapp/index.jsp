<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
</head>
<body>
<h2>Currency Converter</h2>
<form action="org.RateConverterServlet" method="post">
    Enter the amount: <input type="text" name="fromAmount" required> (AUD)<br>
<%--    Rate: <input type="text" name="exchangeRate" required><br>--%>
    <input type="submit" value="convert"><br>
<%--    As of November 21, the world exchange rate is as follows:<br>--%>
<%--    1(USD) = 7.24(CNY)<br>--%>
<%--    1(CNY) = 7.65(EUR)<br>--%>
<%--    1(CNY) = 7.24(JPY)<br>--%>
<%--    1(EUR) = 1.07(HKD)<br>--%>
<%--    <p style="color: red">1(MOP) = 0.12(USD)</p>--%>
</form>
</body>
</html>
