
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
    <c:when test="${sessionScope.user ne null}">
<body style="background-image: url('images/2.jpg'); background-size: cover;">
<%@include file="head.jsp" %>


    

<%@include file="foot.jsp" %>
</body>
</c:when>
    <c:otherwise>
    <c:redirect url="index.jsp">
    
    </c:redirect>
    
    </c:otherwise>
    </c:choose> 