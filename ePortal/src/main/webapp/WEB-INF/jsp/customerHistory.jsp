<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<html>
<head>
<style>
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
    background: #FCAC35;
    position: fixed;
    z-index: 1;
}

.nav-1{
    padding: 10px 10vw;
    display: flex;
    justify-content: space-between;
}

.brand-logo{
    height: 60px;
}

.nav-items{
    display: flex;
    align-items: center;
}

.search{
    width: 900px;
    display: flex;
}

.search-box{
    width: 100%;
    height: 40px;
    padding: 10px;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
    border: 1px solid #d1d1d1;
    text-transform: capitalize;
    background: white;
    outline: none;
}

.search-btn{
    width: 20%;
    height: 40px;
    padding: 10px 20px;
    border: none;
    outline: none;
    cursor: pointer;
    background: #383838;
    color: #fff;
    font-size: 15px;
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
}

.search-box::placeholder{
    color: #a9a9a9;
}

.nav-items a{
    margin-left: 20px;
  	text-decoration:none;  
  	color:white;
}

.hero-section{
	margin:auto;
    width: 100%;
    height: 50px;
    display: flex;
    justify-content: left;
    align-items: center;
    border-radius: 10px;
    padding-left:20px;
}

.hero-section img{
	background-size: cover;
}

.row{
	display: flex;
  	margin: 10px 16px;
}

.flex-x{
	display: flex;
  	margin: 10px 16px;
  	overflow-x: auto;
}

.row,
.row > .column {
  padding: 100px;
}

.column {
  float: left;
  width: 40%;
  display: none; 
  margin:auto;
}

.content img{
	border-radius:50%;
	width:150px;
	heigh:150px;
}

.content a{
	text-decoration:none;
	color:orange;
	margin-top:20px;
}
.product{
	margin-right:10px;}
	
.product img{
	width:300px;
	height:350px;
}

.product a{
	text-decoration:none;
	color:white;
	background-color:orange;
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

.container-2{
	width:100%;
}
	
.wrapper{ 
    width:90%;
    overflow-y:scroll; 
    position:relative;
    height: 800px;
    margin:auto;
    margin-top:-50px;
}

#lblCartCount {
    font-size: 12px;
    background: #DB5908;
    color: #fff;
    padding: 0 5px;
    vertical-align: top;
    margin-left: -10px;
}
.badge {
  padding-left: 9px;
  padding-right: 9px;
  -webkit-border-radius: 9px;
  -moz-border-radius: 9px;
  border-radius: 9px;
}

.label-warning[href],
.badge-warning[href] {
  background-color: #c67605;
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<nav class="navbar-1">
<div class="nav-1">
    <a href="/ePortal/customerPortal"><img src="/ePortal/resources/img/white-logo.png" class="brand-logo" alt="logo"></a>
    <div class="nav-items">
       	<form:form action="/ePortal/searchProduct" modelAttribute="product"> 
	        <div class="search">
		       <input type="text" id="search" name="search" class="search-box" placeholder="search item....">
		       <input type="submit" class="search-btn" value="search">
	        </div>
       	</form:form>
       	<a href="viewCart"><i class="fa" style="font-size:24px">&#xf07a;</i><span class='badge badge-warning' id='lblCartCount'>${sessionScope.totalQty}</span></a>
        <a href="customerLogout">Logout</a>
        <a href="customerHistory">History</a>
    </div>
</div>
</nav>

<div style="margin-top:100px"></div>
<header class="hero-section">
<h5><a  class="text-dark" href="/ePortal/customerPortal">home ></a></h5><h5 class="text-warning">&nbsp;view order history</h5></header>
<h4><center>${msg}</center></h4>
<section class="w-100" style="overflow-y:auto;margin-top:-100px">
  <div class="container h-100">
  <c:forEach var="order" items="${orderList}"> 
    <div class="row d-flex justify-content-center align-items-center" style="height:50px;">
      <div class="col">
        <div class="card mx-2" style="height:200px;">
          <div class="card-body p-2" style="height:200px;">
            <div class="row align-items-center"  style="margin-top:-70px;">
              <div class="col-md-2">
                <img src="/ePortal/resources/img/login/${order.ostatus}.png"
                  class="img-fluid w-100 h-100">
              </div>
              <div class="col-md-1 d-flex justify-content-center">
                 <div>
                  <p class="small text-muted">Order ID</p>
                  <p class="medium mb-0">${order.oid }</p>
              	 </div>
              </div>
              <div class="col-md-5 d-flex justify-content-center">
                <div>
                  <p class="small text-muted">Order Date</p>
                  <p class="medium mb-0">${order.odate }</p>
                </div>
              </div>
              <div class="col-md-2 d-flex justify-content-center">
                <div>
                  <p class="small text-muted">Order Status</p>
                  <p class="medium mb-0">${order.ostatus }</p>
                </div>
              </div>
              <div class="col-md-2 d-flex justify-content-center">
                <div>
                  <p class="small text-muted">Total Price</p>
                  <p class="medium mb-0">S$${order.totalPrice}</p>
                </div>
              </div>
              <div class="col-md-12">
                <div>
					<a href="/ePortal/viewOrderHistoryDetail/${order.oid}" class="btn text-light float-right mt-2 w-25" style="background-color:#DB5908">View More</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </c:forEach>

  </div>
</section>



<footer>
	<div class="footer-content">
		<h4>E-commerce Portal</h4>
		<p>The freedom to sell online without being locked into an expensive contract. Keep tabs on your total site costs by only spending on features you want. Secure Online Payment. Download Our Mobile App. Services: Payments, Shipping, Themes, Custom Products.</p>
	</div>
	<div class="footer-bottom">
  		<p>copyright &copy;2022 <a href="#">E-commerce Portal</a>  </p>
  		<div class="footer-menu">
		 <ul class="f-menu">
		    <li><a href="index.jsp">Home</a></li>
		    <li><a href="aboutUs">About Us</a></li>
		    <li><a href="contactUs">Contact Us</a></li>
		 </ul>
		</div>
	</div>
</footer>  
</body>
</html>