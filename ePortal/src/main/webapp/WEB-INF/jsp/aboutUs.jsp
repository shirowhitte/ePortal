<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html lang="en">
<head>
<title>About Us</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
<link href="/ePortal/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/ePortal/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/ePortal/resources/vendor/aos/aos.css" rel="stylesheet">
<link href="/ePortal/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="/ePortal/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link href="/ePortal/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/ePortal/resources/css/main.css" rel="stylesheet">
<style>
footer{
  	position:sticky;
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
<body class="page-index">
  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
      <a href="./index.jsp"><img src="/ePortal/resources/img/white-logo.png" style="height:60px;width:60px;float:left;"alt="logo"></a>
      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="aboutUs" class="active">About Us</a></li>
          <li><a href="contactUs">Contact Us</a></li>
          <li><a href="customerLogin">Log In</a></li>
          <li><a href="customerRegister">Register</a></li>
        </ul>
      </nav>
    </div>
  </header>

  <section id="hero" class="hero d-flex align-items-center">
    <div class="container">
      <div class="row">
        <div class="col-xl-4">
          <h2 data-aos="fade-up">We are in Business to Improve Lives</h2>
          <blockquote data-aos="fade-up" data-aos-delay="100">
            <p>Join us today to improve your Shopping Experience </p>
          </blockquote>
          <div class="d-flex" data-aos="fade-up" data-aos-delay="200">
            <a href="customerRegister" class="btn-get-started">Get Started</a>
          </div>
        </div>
      </div>
    </div>
  </section>
   <section id="services-list" class="services-list">
      <div class="container" data-aos="fade-up">
        <div class="section-header">
          <h2>Our Services</h2>
        </div>
        <div class="row gy-5">
          <div class="col-lg-4 col-md-6 service-item d-flex" data-aos="fade-up" data-aos-delay="100">
            <div class="icon flex-shrink-0"><i class="bi bi-briefcase" style="color: #f57813;"></i></div>
            <div>
              <h4 class="title"><a href="#" class="stretched-link">Fast Delivery</a></h4>
              <p class="description">Cooperate with more than 10+ courier services.</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 service-item d-flex" data-aos="fade-up" data-aos-delay="200">
            <div class="icon flex-shrink-0"><i class="bi bi-card-checklist" style="color: #15a04a;"></i></div>
            <div>
              <h4 class="title"><a href="#" class="stretched-link">Cash On Delivery</a></h4>
              <p class="description">The first e-commerce platform that provide COD services.</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 service-item d-flex" data-aos="fade-up" data-aos-delay="300">
            <div class="icon flex-shrink-0"><i class="bi bi-bar-chart" style="color: #d90769;"></i></div>
            <div>
              <h4 class="title"><a href="#" class="stretched-link">Variety of Product </a></h4>
              <p class="description">More than 10++ categories with us!</p>
            </div>
          </div>
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
		    <li><a href="./index.jsp">Home</a></li>
		    <li><a href="aboutUs">About Us</a></li>
		    <li><a href="contactUs">Contact Us</a></li>
		 </ul>
		</div>
	</div>
</footer>  

<script src="/ePortal/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/ePortal/resources/vendor/aos/aos.js"></script>
<script src="/ePortal/resources/vendor/glightbox/js/glightbox.min.js"></script>
<script src="/ePortal/resources/vendor/swiper/swiper-bundle.min.js"></script>
<script src="/ePortal/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="/ePortal/resources/vendor/php-email-form/validate.js"></script>
<script src="/ePortal/resources/js/main.js"></script>
</body>
</html>