<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		
		$("#search").on("keyup",function(){
			var v= $(this).val().toLowerCase();
			$("table tbody .tr").filter(function(){
				$(this).toggle($(this).text().toLowerCase().indexOf(v) > -1)
			});
		} );
		
		var id;
		$("table tbody .tr td").click(function() {
			
			var text=$(this).find("button").text();
			if(text!="")
				{
					id=$(this).closest(".tr").find('td.id').text();
									
					if(text=="Edit")
						{
						
							$("#ex_name").val($(this).closest(".tr").find('td.name').text());
							$("#price").val($(this).closest(".tr").find('td.price').text());
							$("#cet").val($(this).closest(".tr").find('td.cat').text());
							$("#qty").val($(this).closest(".tr").find('td.qty').text());
							$("#date").val($(this).closest(".tr").find('td.date').text());
							$('#myModal').modal('show');
							}else {
								var r=confirm("Are you want to Delete");
								if (r == true) {
									  $.post("product",{
										  id:id,
										  opt:3,
										  
										  
									  },function(resp){
										  
										  alert(resp);
										  location.reload();
									  });
									  
									} 
								
						}
				}
			
		});
		
		$("#Update").click(function() {
			
			var name=$("#ex_name").val();
			var price=$("#price").val();
			var cet=$("#cet").val();
			var qty=$("#qty").val();
			var date=$("#date").val();
			if(name=="")
			{
			alert("Please enter Expence name ");
		 	$("#ex_name").focus().css("border-color","red");
			}else if(price=="")
			{
				alert("Please enter Expence price ");
			 	$("#price").focus().css("border-color","red");
				}else if(cet=="Select Category")
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
								 id:id,
								 name:name,
							 	 price:price,
							 	 cat:cet,
							 	 qty:qty,
							 	 date:date,
							 		opt:2,
							 },function(resp)
							 {
								 alert(resp);
								 $('#myModal').modal('hide');
								 
								 location.reload();
								 
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
	<div class="col-sm-2">
	
	</div>
	<div class="col-sm-8"
		style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.4); transition: 0.3s;">

		<div class="row">
			<div class="col-sm-4">
				<p align="center" style="font-size: xx-large; margin-top: 10px;">Expence List</p>

			</div>
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<p align="center">
					<input type="text" class="form-control"  id="search" name="search" style="margin-top: 30px" placeholder="Search.....">
				</p>
			</div>

		</div>
		<hr>
		
		<div class="row" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.4); transition: 0.3s;">
			<div class="col-sm-4">	<h4> Total Expence  </h4>
			 <i class="fa fa-rupee" style="font-size:24px; margin-left: 20px;margin-bottom: 10px; font-weight: bold;color:red"> ${sessionScope.total}</i> 	</div>
			<div class="col-sm-4"> 
			
			</div>
			<div class="col-sm-4">
				<a href="product?opt=5"  ><i class="fa fa-download" style="font-size:24px;color:SteelBlue;margin-top: 20px "> Download Expence</i></a>
					
				</p>
			</div>

		</div>



		<div class="table-responsive" style="width: 100%;" align="center">
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>PICE</th>
						<th>QUENTY</th>
						<th>TOTAL AMOUNT</th>
						<th>CATEGORY</th>
						<th>DATE</th>
						<th>EDIT</th>
						<th>DELETE</th>
					</tr>
				</thead>
				<tbody>
					<p:forEach items="${sessionScope.list}" var="x">

						<tr class="tr">
							<td class="id">${x.id}</td>
							<td class="name">${x.name}</td>
							<td class="price">${x.price}</td>
							<td class="qty">${x.quntity}</td>
							<td class="tot">${x.price*x.quntity}</td>
							<td class="cat">${x.category}</td>
							<td class="date	">${x.date}</td>
							<td><button class="btn btn-primary">Edit</button></td>
							<td><button class="btn btn-danger">Delete</button></td>
						</tr>
					</p:forEach>
				</tbody>
			</table>
		</div>


	</div>



</div>

<div class="container">



	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" align="center">Update Expence</h4>
				</div>
				<div class="modal-body">
				
				
				
					
   	
   	<div>
   	<p align="center" style="margin-top: 10px;">
     <img src="images/add.jpg" class="img-rounded" alt="Cinque Terre" width="150" height="200"> 
       </p>
       </div>
   
    <div class="row" style="margin: 0; padding: 0;">
   
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
   	<div class="col-sm-4">
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
   	
    
        
</div>

<div class="row" >
   
   	
   	
   	<div class="col-sm-4">
   	
   	<div class="form-group">
      <label for="qty">Quentity:</label>
      <input type="number" class="form-control" id="qty"  min="1" placeholder="Enter Expence Quentity" name="qty">
    </div>
   	
   	</div>
   	<div class="col-sm-4">
   	
   	<div class="form-group">
      <label for="date">Date:</label>
      <input type="date" class="form-control" id="date" name="date">
    </div>
   	
   	</div>
   	<div class="col-sm-4">
   	<br>
   	<button type="button"  class="btn btn-primary" id="Update" style="width: 100%;">Update</button>
   	
   	</div>
   	
    </div>
    	</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

</div>



</div>



<%@include file="foot.jsp"%>

</p:when>
    <p:otherwise>
    <p:redirect url="index.jsp">
    
    </p:redirect>
    
    </p:otherwise>
    </p:choose> 