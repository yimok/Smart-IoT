<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>

</head>



<body onload="setTimeout(function() { document.test.submit() }, 100)">
<form action="/cow/01list" method="GET" name="test">
    <input type="hidden" value="" />
</form>
</body>
</html>