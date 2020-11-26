<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		
		$("#edit").click(function(){
			var ex_name=$("#ex_name").val();
			var price=$("#price").val();
			var cat=$( "#cet option:selected" ).val();
			var date=$("#date").val();
			var qty=$("#qty").val();
			
			if(ex_name=="")
				{
				alert("Please enter Expence name ");
			 	$("#ex_name").focus().css("border-color","red");
				}else if(price=="")
				{
					alert("Please enter Expence price ");
				 	$("#price").focus().css("border-color","red");
					}else if(cat=="Select Category")
					{
						alert("Please Select category ");
					 	$("#cet").focus().css("border-color","red");
						}else if(date=="")
						{
							alert("Please Select Purches date ");
						 	$("#date").focus().css("border-color","red");
							}else if(qty=="")
							{
								alert("Please Enter quantity ");
							 	$("#qty").focus().css("border-color","red");
								}else
								{
								 $.post("product",{
									 name:ex_name,
								 	 price:price,
								 	 cat:cat,
								 	 qty:qty,
								 	 date:date,
								 		opt:1,
								 },function(resp)
								 {
									 alert(resp);
									 $("input:text").val("");
									 $('#cet option:selected').prop('selected', false);
									 $('input[type=number]').val('');
									 $('input[type=date]').val('');
								  });
								}
			
			
			
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
   
   		<p align="center" style=" font-size:xx-large; margin-top: 10px;">Add Expence</p>
   		<hr>
   		<div>
   	<p align="center" style="margin-top: 10px;">
     <img src="images/add.jpg" class="img-rounded" alt="Cinque Terre" width="150" height="200"> 
       </p>
       </div>
   
    <div class="row" style="margin: 0; padding: 0;">
   	<div class="col-sm-2"></div>
   	<div class="col-sm-4">
   	
   	<div class="form-group">
      <label for="ex_name">Expence Name:</label>
      <input type="text" class="form-control" id="ex_name" placeholder="Enter your expence name" name="ex_name">
    </div>
   	</div>
   	<div class="col-sm-4">
   	
   	<div class="form-group">
      <label for="price">Price:</label>
      <input type="number" class="form-control" id="price"  min="1" placeholder="Enter Expence price " name="price">
    </div>
   	
   	</div>
   	<div class="col-sm-2"></div>
    
        
</div>



<div class="row" style="margin: 0; padding: 0;">
   	<div class="col-sm-2"></div>
   	<div class="col-sm-3">
   	<div class="form-group">
      <label for="cet">Cetagory:</label>
      <select class="form-control" id="cet" name="cet">
        <option >Select Category</option>
        <option value="Fruite">Fruite</option>
        <option value="Vegitabel">Vegitabel</option>
        <option value="Cloth_Shoping">Cloth Shoping</option>
         <option value="Grosari_shoping">Grosari shoping</option>
          <option value="Food">Food</option>
           <option value="Other">Other</option>
            
      </select>
    </div>
   	</div>
   	
   	<div class="col-sm-3">
   	
   	<div class="form-group">
      <label for="qty">Quentity:</label>
      <input type="number" class="form-control" id="qty"  min="1" placeholder="Enter Expence Quentity" name="qty">
    </div>
   	
   	</div>
   	<div class="col-sm-2">
   	
   	<div class="form-group">
      <label for="date">Date:</label>
      <input type="date" class="form-control" id="date" name="date">
    </div>
   	
   	</div>
   	<div class="col-sm-2"></div>
    </div>
    <div class="row" style="margin: 0; padding: 0;">
   	<div class="col-sm-2"></div>
   	<div class="col-sm-8">
   	<button type="button" class="btn btn-primary" id="edit" style="width: 100%;">Add Expence</button>
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