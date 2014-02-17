<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="error" items="${errors}">
	<div style="font-size:Large; color:#E6E6E6; align:center"> Error: ${error} </div>
</c:forEach>