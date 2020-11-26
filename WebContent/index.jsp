<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#reg1").click(function(){
			$("#log").css("display","none");
			$("#reg").css("display","block");
		});
	
	$("#log1").click(function(){
		$("#reg").css("display","none");
		$("#log").css("display","block");
	});	
	
	
	$("#logbtn").click(function(){
		 var email=$("#logemail").val();
		 var pass=$("#logpass").val();
		 
		 
		 if(email=="")
		 {
		 	alert("Please enter email");
		 	$("#logemail").focus().css("border-color","red");
		 }
	 else if( pass=="")
		 {
		 alert("Please enter pass");
		 	$("#logpass").focus().css("border-color","red");
		 			 
		 }
	 else{
		 $.post("user",{
			 email:email,
		 	 pass:pass,
			 opt:1,
		 },function(resp)
		 {
			 if(resp=="Invaid email,pass")
				 {
				 alert(resp);
				 }
			 else{
			location.replace('home.jsp') ;
			 }
		  });
		 
		 
	 }
		 
		 
	});	
	
	$("#regbtn").click(function(){
		 var email=$("#regemail").val();
		 var name=$("#regname").val();		 
		 var pass=$("#regpass").val();
		
		 if(email=="")
			 {
			 	alert("Please enter email");
			 	$("#regemail").focus().css("border-color","red");
			 }
		 else if( name=="")
			 {
			 alert("Please enter name");
			 	$("#regname").focus().css("border-color","red");
			 			 
			 }
		 else{
			 $.post("user",{
				 email:email,
			 name:name,
			 pass:pass,
			 opt:2,
			 },function(resp)
			 {
				 alert(resp);
			  });
			 
			 
		 }
		 
	});	
	
	
	
	});
	
	
	

	</script>

</head>




<body style="background-image: url('images/5.jpg'); background-size: cover;">
<%@include file="head.jsp"%>
<div class="container-fluid">
    <div class="row">
    <div class="col-sm-2" ></div>
    
    <div class="col-sm-3" style="box-shadow:0 4px 8px 0 rgba(0,0,0,0.4); transition: 0.3s;">
    <p align="center" style="margin-top: 10px;">
     <img src="images/1.jpg" class="img-rounded" alt="Cinque Terre" width="300" height="350"> 
       </p>
   <hr>
			<p align="center"  style=" font-size: large; margin-top: 50px;" >CHANDAN</p>
			<hr>
 
    </div>
    
    <div class="col-sm-2" ></div>
    
	    <div class="col-sm-3">
	   
	 <!--  Loging code start --> 
	   
	 <div id="log">
	 <hr>
	<p align="center" style=" font-size:xx-large; margin-top: 10px;"> Loging </p>
	<hr>
	    <div class="form-group">
	      <label for="email">Email:</label>
	      <input type="email" class="form-control" id="logemail" placeholder="Enter email" name="logemail">
	    </div>
	    <div class="form-group">
	      <label for="pwd">Password:</label>
	      <input type="password" class="form-control" id="logpass" placeholder="Enter password" name="logpass">
	    </div>
	    <div class="checkbox">
	      <label><input type="checkbox" name="remember"> Remember me</label>
	    </div>
	     
	    		<button type="button" class="btn btn-primary" id="logbtn" style="width: 100%;">Loging</button>
				<div style="width: 100%;">
					<div style="width: 40%; float: left;">
						<hr>
					</div>
					<div
						style="width: 20%; float: left; text-align: center; line-height: 40px;">
						<b>OR</b>
					</div>
					<div style="width: 40%; float: right;">
						<hr>
					</div>
				</div>
				<button type="button" class="btn btn-primary" id="reg1" style="width: 100%; margin-bottom: 50px">For Registaion click here</button>

	 	
	  </div>
	
	    
	   <!--  Loging code end -->  
	   
	   <!--  reg code start --> 
	   
	   <div id="reg" style="display: none;">
	 <hr>
	<p align="center" style=" font-size:xx-large; margin-top: 10px;"> Registaion </p>
	<hr>
	    <div class="form-group">
	      <label for="email">Email:</label>
	      <input type="email" class="form-control" id="regemail" placeholder="Enter email" name="regemail">
	    </div>
	    <div class="form-group">
	      <label for="name">Name:</label>
	      <input type="email" class="form-control" id="regname" placeholder="Enter name" name="regname">
	    </div>
	    <div class="form-group">
	      <label for="pwd">Password:</label>
	      <input type="password" class="form-control" id="regpass" placeholder="Enter password" name="regpass">
	    </div>
	   
	     
	    		<button type="button" class="btn btn-primary" id="regbtn" style="width: 100%;">Registaion</button>
				<div style="width: 100%;">
					<div style="width: 40%; float: left;">
						<hr>
					</div>
					<div
						style="width: 20%; float: left; text-align: center; line-height: 40px;">
						<b>OR</b>
					</div>
					<div style="width: 40%; float: right;">
						<hr>
					</div>
				</div>
				<button type="button" class="btn btn-primary" id="log1"	style="width: 100%; margin-bottom: 50px">For Loging click here</button>
					
	 
	  </div>
	   
	   
	    <!--  reg code end --> 
	    
	    </div>
    
    <div class="col-sm-1" ></div>
    
  </div>
</div>
 


<%@include file="foot.jsp"%>
</body>