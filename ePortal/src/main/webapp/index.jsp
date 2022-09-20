<html>
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
    background-image: url('/ePortal/resources/img/header.png');
    background-size: cover;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 10px;
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

.flash-section h4
{
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


</style>
</head>
<body>
<nav class="navbar">
<div class="nav">
    <a href="index.jsp">
    	<img src="/ePortal/resources/img/white-logo.png" class="brand-logo" alt="logo">
    </a>
    <div class="nav-items">
        <div class="search">
            <input type="text" class="search-box" placeholder="search item....">
            <button class="search-btn"  onclick="location.href='customerLogin';">search</button>
        </div>
        <a href="customerLogin">Log In</a>
        <a href="customerRegister">Register</a>
    </div>
</div>
</nav>

<header class="hero-section">
</header>
<div class="category-section">
	<div class="row">
		<div class="content">
			<a href="customerLogin">
				<img src="/ePortal/resources/img/watch.jpg">
				<h4><center>Watch</center></h4>
		 	</a>
		 </div>
		 <div style="width:60px;"></div>
		 <div class="content">
			<a href="customerLogin">
				<img src="/ePortal/resources/img/mobile.jpg">
				<h4><center>Mobile & Accessories</center></h4>
		 	</a>
		 </div>
		  <div style="width:60px;"></div>
		 <div class="content">
			<a href="customerLogin">
				<img src="/ePortal/resources/img/homeliving.jpg">
				<h4><center>Home & Living</center></h4>
		 	</a>
		 </div>
		  <div style="width:60px;"></div>
		 <div class="content">
			<a href="customerLogin">
				<img src="/ePortal/resources/img/oven.jpg">
				<h4><center>Home Appliances</center></h4>
		 	</a>
		 </div>
		  <div style="width:60px;"></div>
		 <div class="content">
			<a href="customerLogin">
				<img src="/ePortal/resources/img/shoes.webp">
				<h4><center>Shoes</center></h4>
		 	</a>
		 </div>
	</div>
</div>

<div class="flash-sales"><h3>Flash Sales</h3></div>
<div class="flash-section">
	<div class="flex-x">
		<div class="product">
			<a href="customerLogin">
				<img src="/ePortal/resources/img/login/log1.png">
				<h4 style="float:left;"><left>Converse Star 1997</left></h4>
				<h4 style="float:right;">S$83.99</h4>
		 	</a>
		 </div>
		 <div style="width:70px;"></div>
		 <div class="product">
			<a href="customerLogin">
				<img src="/ePortal/resources/img/login/log2.png">
				<h4 style="float:left;"><left>Hermes Collection 96's</left></h4>
				<h4 style="float:right;">S$5193.99</h4>
		 	</a>
		 </div>
		 <div style="width:70px;"></div>
		 <div class="product">
			<a href="customerLogin">
				<img src="/ePortal/resources/img/login/log3.png">
				<h4 style="float:left;"><left>Chanel N5 Cologne Parfum </left></h4>
				<h4 style="float:right;">S$892.99</h4>
		 	</a>
		 </div>
		 <div style="width:70px;"></div>
		 <div class="product">
			<a href="customerLogin">
				<img src="/ePortal/resources/img/login/log4.png">
				<h4 style="float:left;"><left>Macbook Air 2020 256gb</left></h4>
				<h4 style="float:right;">S$1128.99</h4>
		 	</a>
		 </div>
		 <div style="width:70px;"></div>
		 <div class="product">
			<a href="customerLogin">
				<img src="/ePortal/resources/img/login/log5.png">
				<h4 style="float:left;"><left>iPhone 5 Rose Gold</left></h4>
				<h4 style="float:right;">S$499.99</h4>
		 	</a>
			</div>
	</div>
</div>
    
<footer>
	<div class="footer-content">
		<h4>E-commerce Portal</h4>
		<p>The freedom to sell online without being locked into an expensive contract. Keep tabs on your total site costs by only spending on features you want. Secure Online Payment. Download Our Mobile App. Services: Payments, Shipping, Themes, Custom Products.</p>
	</div>
	<div class="footer-bottom">
  		<p>copyright &copy;2022 <a href="#">E-commerce Portal</a>  </p>
		<a href="vendorLogin" style="text-decoration:none;color:orange">Vendor Login</a>
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