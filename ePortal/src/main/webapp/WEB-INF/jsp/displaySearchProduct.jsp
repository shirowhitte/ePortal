<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
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
.hello:hover
{
	background-color:#3A3B3C;
	color:white;
	}
	
.section-products {
    padding: 20px 0 20px;
    margin-top:-100px;
}

.section-products .header {
    margin-bottom: 50px;
}

.section-products .header h3 {
    font-size: 1rem;
    color: #fe302f;
    font-weight: 500;
}

.section-products .header h2 {
    font-size: 2.2rem;
    font-weight: 400;
    color: #444444; 
}

.section-products .single-product {
    margin-bottom: 26px;
}

.section-products .single-product .part-1 {
    position: relative;
    height: 290px;
    max-height: 290px;
    margin-bottom: 20px;
}

.section-products .single-product .part-1 ul {
    position: absolute;
    bottom: -41px;
    left: 20px;
    margin: 0;
    padding: 0;
    list-style: none;
    opacity: 0;
    transition: bottom 0.5s, opacity 0.5s;
}

.section-products .single-product:hover .part-1 ul {
    bottom: 30px;
    opacity: 1;
}

.section-products .single-product .part-1 ul li {
    display: inline-block;
    margin-right: 4px;
}

.section-products .single-product .part-1 ul li a {
    display: inline-block;
    width: 40px;
    height: 40px;
    line-height: 40px;
    background-color: #ffffff;
    color: orange;
    text-align: center;
    box-shadow: 0 2px 20px rgb(50 50 50 / 10%);
    transition: color 0.2s;
}


.section-products .single-product .part-2 .product-title {
    font-size: 1rem;
}

.section-products .single-product .part-2 .product-des {
    font-size: 0.7rem;
    color: darkgrayl
}

.section-products .single-product .part-2 h4 {
    display: inline-block;
    font-size: 1rem;
}


.container-2{
	width:100%;
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
<script>

</script>
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
       <form:form action="searchProduct" modelAttribute="product"> 
        <div class="search">
	       <input type="text" id="search" name="search" class="search-box" placeholder="search item....">
	       <input type="submit" class="search-btn" value="search">
        </div>
         </form:form>
        <a href="viewCart"> 
        <i class="fa" style="font-size:24px">&#xf07a;</i>
    	<span class='badge badge-warning' id='lblCartCount'>${sessionScope.totalQty}</span>
        </a>
        <a href="/ePortal/customerLogout">Logout</a>
        <a href="/ePortal/customerHistory">History</a>
    </div>
</div>
</nav>
<div style="height:100px"></div>
<header class="hero-section">
    <h5><a style="color:gray" href="/ePortal/customerPortal">home</a> > </h5><h5 style="color:orange;">&nbsp;search result</h5>
</header>


<section class="section-products">
		<div class="container-2">
				<div class="row">
   					<c:forEach var="pro" items="${searchProduct}"> 
						<div class="col-md-6 col-lg-4 col-xl-3">
								<div class="single-product">
									<a href="/ePortal/viewProduct/${pro.pid}" style="color:orange;">
										<div class="part-1"  style="background: url('/ePortal/resources/img/category/${pro.pimg}'); background-size:cover;">
										</div>
										<div class="part-2">
												<h3 class="product-title">${pro.pname }</h3>
												<p class="product-des">${pro.pdescription }</p>
												<h4 class="product-price">S$${pro.price }</h4>
										</div>
									</a>
								</div>
						</div>
						</c:forEach>
				</div>
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