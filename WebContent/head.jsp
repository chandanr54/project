<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Expence Manger</a>
    </div>
     
    <c:choose>
    <c:when test="${sessionScope.user ne null}">
       <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav"> 
        <li class="active"><a href="home.jsp">Home</a></li>
        
        <li><a href="profile.jsp">Profile</a></li>
        <li><a href="addexpence.jsp">Add Expence</a></li>
        <li><a href="product?opt=4">Expence List</a></li>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
        
        <li><a href="user?opt=4"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
    
    
    
    </c:when>
    
    </c:choose> 
    

    </div>
  </div>
</nav>