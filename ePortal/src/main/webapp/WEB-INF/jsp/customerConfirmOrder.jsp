<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ page import="java.util.*" %>
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

.hero-section img
{
	background-size: cover;
}

.row {
	display: flex;
  	margin: 10px 16px;
}

.flex-x {
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

.content img
{
	border-radius:50%;
	width:150px;
	heigh:150px;
}

.content a
{
	text-decoration:none;
	color:orange;
	margin-top:20px;
}
.product
{
	margin-right:10px;}
.product img
{
	width:300px;
	height:350px;
}

.product a
{
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
	
@media (min-width: 1025px) {
.h-custom {
height: 100vh !important;
}
}

.horizontal-timeline .items {
border-top: 2px solid #ddd;
}

.horizontal-timeline .items .items-list {
position: relative;
margin-right: 0;
}

.horizontal-timeline .items .items-list:before {
content: "";
position: absolute;
height: 8px;
width: 8px;
border-radius: 50%;
background-color: #ddd;
top: 0;
margin-top: -5px;
}

.horizontal-timeline .items .items-list {
padding-top: 15px;
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
    <a href="/ePortal/customerPortal">
    	<img src="/ePortal/resources/img/white-logo.png" class="brand-logo" alt="logo">
    </a>
    <div class="nav-items">
        <form:form action="/ePortal/searchProduct" modelAttribute="product"> 
        <div class="search">
	       <input type="text" id="search" name="search" class="search-box" placeholder="search item....">
	       <input type="submit" class="search-btn" value="search">
        </div>
         </form:form>
       	<a href="viewCart"> 
        <i class="fa" style="font-size:24px">&#xf07a;</i>
    	<span class='badge badge-warning' id='lblCartCount'>${sessionScope.totalQty}</span>
        </a>
        <a href="customerLogout">Logout</a>
        <a href="customerHistory">History</a>
    </div>
</div>
</nav>
<div style="margin-top:100px"></div>
<header class="hero-section">
<h5><a style="color:gray" href="/ePortal/customerPortal">home ></a><a  class="text-dark" href="/ePortal/viewCart">&nbsp;view cart ></a></h5><h5 class="text-warning">&nbsp;confirm order details</h5></header>
</header>


<div class="card" style="overflow-y:auto;height:500px">
  <div class="card-body">
    <div class="container mb-5 mt-3">
      <div class="container">
        <div class="row"  style="margin-top:-50px;">
          <div class="col-xl-8">
            <ul class="list-unstyled">
              <li class="text-muted"><span style="color:#8f8061 ;"><b>Order Details</b></span></li>
               <li class="text-muted"><span
                  class="me-1 fw-bold">Order Date: </span><%= (new java.util.Date()).toLocaleString()%></li>
                  <li class="text-muted"><span
                  class="me-1 fw-bold">Payment Type: </span>Cash On Delivery</li>
            </ul>
          </div>
          <%String username= (String)request.getSession().getAttribute("custSession");%>
          <div class="col-xl-4">
            <ul class="list-unstyled">
            		<li class="text-muted"><span style="color:#8f8061 ;"><b>Customer Details</b></span></li>
                   <li class="text-muted"> <span
                  class="me-1 fw-bold">Username: </span>
                 	<%=username %>
                  </li>
                   <li class="text-muted"> <span class="me-1 fw-bold">Address: </span>${address}
                  </li>
                  <a href="/ePortal/updateAddress/<%=username %>">Update Address</a>
            </ul>
          </div>
        </div>
        <c:set var="total" value="0"></c:set>
        <c:forEach var="item" items="${temp_cart}">
        <c:set var="total" value="${total+(item.product.price* item.quantity) }"></c:set>
        <div class="row justify-content-center" style="margin-top:-180px;">
          <div class="col-md-2 mb-2 mb-md-0">
            <div class="bg-image ripple rounded-5 mb-4 overflow-hidden d-block" data-ripple-color="light">
              <img src="/ePortal/resources/img/category/${item.product.pimg }" width="100px" height="100px" />
            </div>
          </div>
          <div class="col-md-7 mb-2 mb-md-0">
            <p class="fw-bold">${item.product.pname }</p>
            <p class="mb-1">
              <span class="text-muted me-2">Quantity: </span><span>${item.quantity }</span>
            </p>
          </div>
          <div class="col-md-3 mb-2 mb-md-0">
          <span class="text-muted me-2">Price:</span>
            <h5 class="mb-2"><span class="align-middle">S$${item.product.price }</span> </h5>
          </div>
        </div>
        </c:forEach>
        <!-- SUBTOTAL -->
        <hr style="margin-top:-100px">
        <div class="row" style="height:200px;margin-top:-50px">
         <div class="col-md-9 float-left">
          	<a href="/ePortal/viewCart">Back</a>
          </div>
          <div class="col-md-3 float-right">
            <ul class="list-unstyled">
              <li class="text-muted"><span class="text-black">SubTotal </span> S$${Math.round(total * 100.0) / 100.0}</li>
              <li class="text-muted"><span class="text-black">Shipping</span> S$0.00</li>
            </ul>
            <p class="text-black float-start"><span class="text-black me-3"> Total Amount </span><span
                style="font-size: 25px;">S$${Math.round(total * 100.0) / 100.0}</span></p>
				<form action="confirmOrder"  method="POST">
                <input name="totalPrice" type="hidden" value="${Math.round(total * 100.0) / 100.0}"/>
                <input type="submit" class="btn btn-warning text-white w-100" value="Confirm Order"><br>
                </form>
                <br>
          </div>
          <br>
        </div>
      </div>
    </div>
  </div>
</div>

<footer>
	<div class="footer-content" >
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