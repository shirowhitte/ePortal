<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<html>
<head>
<style>
.error
{
	color:orange;
	}
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'roboto', sans-serif;
}

.navbar-1{
    position: sticky;
    top: 0;
    left: 0;
    width: 100%;
    background: white;
}

.nav-1{
    padding: 10px 10vw;
    display: flex;
    justify-content: space-between;
}

.brand-logo{
    height: 60px;
}

.nav-items-1{
    display: flex;
    align-items: center;
}

.nav-items-1 a{
    margin-left: 20px;
  	text-decoration:none;  
  	color:#3290D0;
  	margin-top:5px;
}

.container{
	background-color:white;
	width:400px;
	height:400px;
	margin:auto;
	padding:50px;
	margin-top:30px;
	border-radius:10px;
	}
	
.container input{
	width:300px;
	height:40px;
	padding:10px;
	border-radius:10px;
	border:0.5px solid gray;
	}	
	
.container input[type=submit]{
	background-color:#3290D0;
	color:white;
	width:300px;
	height:40px;
	border:none;
	}
	
tr.spaceUnder>td {
  padding-bottom: 1em;
}

footer{
    bottom: 0;
    left: 0;
    right: 0;
    background: #3a3b3c;
    height: auto;
    width: 100vw;
    margin-top:50px;
    padding-top: 30px;
    color: white;
}

.footer-content{
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    text-align: center;
}

.footer-content h3{
    font-size: 2.1rem;
    font-weight: 500;
    text-transform: capitalize;
    line-height: 3rem;
}

.footer-content p{
    max-width: 500px;
    margin: 10px auto;
    line-height: 28px;
    font-size: 14px;
    color: #cacdd2;
}

.footer-bottom{
    background: #3a3b3c;
    width: 100vw;
    padding: 20px;
    padding-bottom: 40px;
    text-align: center;
}

.footer-bottom p{
   float: left;
   font-size: 14px;
   word-spacing: 2px;
   text-transform: capitalize;
}
.footer-bottom p a{
  color:#44bae8;
  font-size: 16px;
  text-decoration: none;
}
.footer-bottom span{
    text-transform: uppercase;
    opacity: .4;
    font-weight: 200;
}

.footer-menu{
  float: right;
}

.footer-menu ul{
  display: flex;
}

.footer-menu ul li{
padding-right: 10px;
display: block;
}

.footer-menu ul li a{
  color: #cfd2d6;
  text-decoration: none;
}

.footer-menu ul li a:hover{
  color: #27bcda;
}
</style>
<script>
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result)
                .width(300)
                .height(300);
        };

        reader.readAsDataURL(input.files[0]);
    }
    document.getElementById("blah").style.display = "block";
}


</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>  

<nav class="navbar navbar-expand-lg navbar-light bg-light">
 <a href="vendorHome" class="pl-1">
    	<img src="/ePortal/resources/img/blue-logo.png" class="brand-logo" alt="logo">
    </a>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item pl-5">
        <a class="nav-link" href="/ePortal/vendorHome">Home</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Manage Product
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="/ePortal/addProduct">Add Product</a>
          <a class="dropdown-item" href="/ePortal/viewProductVendor">View Product</a>
          <a class="dropdown-item" href="/ePortal/updateProduct">Update Product</a>
          <a class="dropdown-item" href="/ePortal/deleteProduct">Delete Product</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Manage Order
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="/ePortal/viewOrder">View Order</a>
          <a class="dropdown-item" href="/ePortal/updateOrderStatus">Update Order Status</a>
          <a class="dropdown-item" href="/ePortal/orderHistory">Order History</a>
        </div>
      </li>
    </ul>
  </div>
  <div class="nav-items-1 pr-2"> 
        <a href="/ePortal/vendorLogout"><b>Logout</b></a>
    </div>
</nav>
<form:form action="/ePortal/updateProductForm" name="updateProductForm" modelAttribute="product"  class="tm-edit-product-form" enctype="multipart/form-data">   
    <div class="container tm-mt-big tm-mb-big h-100 bg-light">
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
                <h2 class="tm-block-title d-inline-block  mt-5">Update Product</h2>
              </div>
            </div>
            <div class="row tm-edit-product-row">
              <div class="col-xl-6 col-lg-6 col-md-12">
                  <div class="form-group mb-3">
                    Product Name
                    <form:input path="pname" class="form-control validate" readonly="true"/>
                    <form:input path="pid" value="${product.pid }" type="hidden" />
                  </div>
                  <div class="form-group mb-3">
                    Category
                     <form:input path="pcategory" class="form-control validate" readonly="true"/>
                  </div>
                  <div class="form-group mb-3">
                    Description
                    <form:textarea path="pdescription" class="form-control validate" rows="3" readonly="true"/>
                  </div>
                  <div class="form-group mb-3">
                    Price (S$)
                   	<form:input path="price" class="form-control validate"/>
                   	<form:errors path="price" cssClass="error"/>
                  </div>
                  <div class="row">
                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                          Units In Stock
                          <form:input path="pstock" class="form-control validate"/>
                          <form:errors path="pstock" cssClass="error"/>
                        </div>
                  </div>
              </div>
              <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                <div class="mt-3 mb-3">
                <img id="blah" src="/ePortal/resources/img/category/${product.pimg}" alt="images" height="400px" width="400px">
                </div>
              </div>
              <div class="col-12">
                <input type="submit" class="btn btn-primary btn-block text-uppercase" value="Update Product"/>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </form:form>
    
    

<footer>
	<div class="footer-content">
		<h4>E-commerce Portal</h4>
		<p>The freedom to sell online without being locked into an expensive contract. Keep tabs on your total site costs by only spending on features you want. Secure Online Payment. Download Our Mobile App. Services: Payments, Shipping, Themes, Custom Products.</p>
	</div>
	<div class="footer-bottom">
  		<p>copyright &copy;2022 <a href="#">E-commerce Portal</a>  </p>
  		<div class="footer-menu">
		 <ul class="f-menu">
		    <li><a href="./index.jsp">Home</a></li>
		    <li><a href="aboutUs">About Us</a></li>
		    <li><a href="contactUs">Contact Us</a></li>
		 </ul>
		</div>
	</div>
</footer>  
</body>
</html>