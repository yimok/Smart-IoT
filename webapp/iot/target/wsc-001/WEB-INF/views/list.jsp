<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

<head>

    <script
            src="https://code.jquery.com/jquery-2.2.4.min.js"
            integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
            crossorigin="anonymous"></script>



    <script type="text/javascript" src="js/canvasjs.min.js"></script>
</head>


<body onload="setTimeout(function() { document.test.submit() }, 5000)">
<form action="/cow/list" method="GET" name="test">
    <input type="hidden" name="q" value="Hello world" />

    ${users}




    <script>

        <c:forEach var="u" items="${users}">
        var test = ${fn:substring(u.con , 9,11)}
        var test2 =${fn:substring(u.con , 12,14)}

        ${fn:substring(u.con , 12,14)}

        </c:forEach>
    </script>

    ${fn:substring(users , 104,106)}
    ${fn:substring(users , 107,109)}
</form>




</body>
</html>
