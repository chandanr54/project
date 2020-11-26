<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">



$(document).ready(function(){
	
	$("#edit").click(function(){
		var name =$("#name").val();
		var email=$("#email").val();
		var pass=$("#pass").val();
		
		$.post("user",{
			name:name,
			email:email,
			pass:pass,
			opt:3,		
			
		},function(resp)
		{
			alert(resp);
		});
		
		
		
	});
	
	
	
});

</script>

</head>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="p" %>
<p:choose>
    <p:when test="${sessionScope.user ne null}">
<%@include file="head.jsp"%>

 <div class="row" style="margin: 0; padding: 0;">
  <div class="col-sm-2" ></div> 
   <div class="col-sm-8" style="box-shadow:0 4px 8px 0 rgba(0,0,0,0.4); transition: 0.3s;" >
   
   		<p align="center" style=" font-size:xx-large; margin-top: 10px;">Profile Detail</p>
   		<hr>
   		 <p align="center" style="margin-top: 10px;">
     <img src="images/2.jpg" class="img-rounded" alt="Cinque Terre" width="300" height="350"> 
       </p>
   <hr>
   
    <div class="row" style="margin: 0; padding: 0;">
   	<div class="col-sm-2"></div>
   	<div class="col-sm-4">
   	<div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="${sessionScope.user.getEmail()}">
    </div>
   	</div>
   	<div class="col-sm-4">
   	
   	<div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name" value="${sessionScope.user.getName() }">
    </div>
   	
   	</div>
   	<div class="col-sm-2"></div>
    
        
</div>



<div class="row" style="margin: 0; padding: 0;">
   	<div class="col-sm-2"></div>
   	<div class="col-sm-4">
   	<div class="form-group">
      <label for="pass">Password:</label>
      <input type="password" class="form-control" id="pass" placeholder="Enter password" name="pass" value="${sessionScope.user.getPass() }">
    </div>
   	</div>
   	<div class="col-sm-4">
   	
   	<div class="form-group">
      <label for="image">Image:</label>
      <input type="file" class="btn btn-success" id="image" placeholder="Enter password" name="image">
    </div>
   	
   	</div>
   	<div class="col-sm-2"></div>
    </div>
    <div class="row" style="margin: 0; padding: 0;">
   	<div class="col-sm-2"></div>
   	<div class="col-sm-8">
   	<button type="button" class="btn btn-primary" id="edit" style="width: 100%;">Edit</button>
   	<br><br>
   	</div>
   	<div class="col-sm-2"></div>
        
</div>
    <br><br><br>
    
    </div>
   
   
   </div>
  <div class="col-sm-2" ></div>
 
 </div>



<%@include file="foot.jsp"%>
</p:when>
    <p:otherwise>
    <p:redirect url="index.jsp">
    
    </p:redirect>
    
    </p:otherwise>
    </p:choose> 