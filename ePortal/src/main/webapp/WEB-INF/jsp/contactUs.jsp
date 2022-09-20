<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Contact Us</title>
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
  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
        <a href="./index.jsp">
	    	<img src="/ePortal/resources/img/white-logo.png" style="height:60px;width:60px;float:left;"alt="logo">
	    </a>
      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="aboutUs">About Us</a></li>
          <li><a href="contactUs" class="active">Contact Us</a></li>
          <li><a href="customerLogin">Log In</a></li>
          <li><a href="customerRegister">Register</a></li>
        </ul>
      </nav>
    </div>
  </header>
  
    <section id="contact" class="contact">
      <div class="container position-relative" data-aos="fade-up">
        <div class="row gy-4 d-flex justify-content-end">
          <div class="col-lg-5" data-aos="fade-up" data-aos-delay="100">   
          <div class="mapouter"><div class="gmap_canvas"><iframe width="1200" height="369" id="gmap_canvas" src="https://maps.google.com/maps?q=50%20East%20Coast%20Road%20%20&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://2piratebay.org">pirate bay</a><br><style>.mapouter{position:relative;text-align:right;height:369px;width:1080px;}</style><a href="https://www.embedgooglemap.net"></a><style>.gmap_canvas {overflow:hidden;background:none!important;height:369px;width:1200px;}</style></div></div>
            <div class="info-item d-flex mt-5">
              <i class="bi bi-geo-alt flex-shrink-0"></i>
              <div>
                <h4>Location:</h4>
                <p> 50 East Coast Road #01-91 Roxy Square, 68440041,428769 </p>
              </div>
            </div>
            <div class="info-item d-flex">
              <i class="bi bi-envelope flex-shrink-0"></i>
              <div>
                <h4>Email:</h4>
                <p>ecommerceportal@yahoo.com</p>
              </div>
            </div>
            <div class="info-item d-flex">
              <i class="bi bi-phone flex-shrink-0"></i>
              <div>
                <h4>Call:</h4>
                <p>+65 8273 2839</p>
              </div>
            </div>
          </div>
          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="120-" style="margin-top:430px">
            <form action="" method="post" role="form">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                </div>
              </div>
              <div class="form-group mt-3">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
              </div>
              <div class="text-center"><button type="submit" class="btn btn-warning mt-2">Send Message</button></div>
            </form>
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