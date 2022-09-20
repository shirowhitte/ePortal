<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  <html>
<head>
<style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'roboto', sans-serif;
}

.navbar{
    position: sticky;
    top: 0;
    left: 0;
    width: 100%;
    background: #FCAC35;
}

.nav{
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
    width: 80%;
    height: 600px;
    margin-top:20px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 10px;
}

.hero-section img{
	background-size: cover;
}

.flash-sales{
	margin:auto;
    width: 40%;
    height: 100px;
    margin-top:10px;
    background-color:orange;
    color:white;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 10px;
}

.category-section{
	margin:auto;
	margin-top:10px;
    width: 90%;
    height: 300px;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color:#FDF8C6;
}

.flash-section{
	margin:auto;
	margin-top:-10px;
    width: 90%;
    height: 500px;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color:orange;
    border-radius: 10px;
}

.flash-section h4{
	margin-top:20px;
}

.category-container{
    padding: 0 10vw;
    display: flex;
    overflow-x: auto;
    scroll-behavior: smooth;
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
	margin-right:10px;
}
.product img
{
	width:300px;
	height:300px;
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
var i = 0; 	
var images = [];
var time = 3000;
	 
images[0] = "/ePortal/resources/img/2.png";
images[1] = "/ePortal/resources/img/1.png";
images[2] = "/ePortal/resources/img/3.png";

function changeImg(){
	document.slide.src = images[i];

	if(i < images.length - 1)
	{
	  i++; 
	} else 
	{ 
		i = 0;
	}

	setTimeout("changeImg()", time);
}
window.onload=changeImg;
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<nav class="navbar">
<div class="nav">
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
        <a href="/ePortal/viewCart"> 
        <i class="fa" style="font-size:24px">&#xf07a;</i>
    	<span class='badge badge-warning' id='lblCartCount'>${sessionScope.totalQty}</span>
        </a>
        <a href="customerLogout">Logout</a>
        <a href="customerHistory">History</a>
    </div>
</div>
</nav>

<header class="hero-section">
    <img name="slide" width="1200" height="600" />
</header>

<div class="category-section">
	<div class="row">
		<div class="content">
			<a href="viewProductByCategory/watch">
				<img src="/ePortal/resources/img/watch.jpg">
				<h4><center>Watch</center></h4>
		 	</a>
		 </div>
		 <div style="width:60px;"></div>
		 <div class="content">
			<a href="viewProductByCategory/mobile">
				<img src="/ePortal/resources/img/mobile.jpg">
				<h4><center>Mobile & Accessories</center></h4>
		 	</a>
		 </div>
		  <div style="width:60px;"></div>
		 <div class="content">
			<a href="viewProductByCategory/homeliving">
				<img src="/ePortal/resources/img/homeliving.jpg">
				<h4><center>Home & Living</center></h4>
		 	</a>
		 </div>
		  <div style="width:60px;"></div>
		 <div class="content">
			<a href="viewProductByCategory/homeapp">
				<img src="/ePortal/resources/img/oven.jpg">
				<h4><center>Home Appliances</center></h4>
		 	</a>
		 </div>
		  <div style="width:60px;"></div>
		 <div class="content">
			<a href="viewProductByCategory/shoes">
				<img src="/ePortal/resources/img/shoes.webp">
				<h4><center>Shoes</center></h4>
		 	</a>
		 </div>
	</div>
</div>

<div class="flash-sales"><h3>Flash Sales</h3></div>
<div class="flash-section">
	<div class="flex-x">
		<c:forEach var="pro" items="${plist}"> 
		<div class="product">
			<a href="viewProduct/${pro.pid }">
				<img src="/ePortal/resources/img/category/${pro.pimg}">
				<h4>${pro.pname}</h4>
				<h4>S$${pro.price}</h4>
		 	</a>
		 </div>
		 <div style="width:70px;"></div>
		 </c:forEach>
	</div>
</div>
    
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