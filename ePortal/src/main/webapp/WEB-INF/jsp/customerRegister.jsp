<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<html>
<head>
<style>
.error{
	color:red
	}
	  
body{
	background-image: url('/ePortal/resources/img/register.jfif');
    background-size: cover;
    }
    
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
    background: white;
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

.nav-items a{
    margin-left: 20px;
  	text-decoration:none;  
  	color:orange;
}

.container{
	background-color:white;
	width:400px;
	height:600px;
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
	background-color:orange;
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
</script>
</head>
<body>  

<nav class="navbar">
<div class="nav">
	<a href="./index.jsp">
    <img src="/ePortal/resources/img/dark-logo.png" class="brand-logo" alt="logo">
    </a>
    <div class="nav-items"> 
        <a href="customerLogin"><b>Log In &nbsp;&nbsp;&nbsp;&nbsp;|</b></a>
        <a href="https://www.amazon.com/gp/help/customer/display.html"><b>Need Help?</b></a>
    </div>
</div>
</nav>

<div class="container">
 <h1><center>Sign Up</center></h1> <br>
<form:form action="registerForm" name="register" modelAttribute="customer">    
        <table>    
         <tr  class="spaceUnder">      
          <td><form:input path="username" placeholder="Username" /><form:errors path="username" cssClass="error"/></td>
         </tr> 
         <tr  class="spaceUnder">      
          <td><form:input path="email" placeholder="Email"  /><form:errors path="email" cssClass="error"/></td>  
         </tr>       
         <tr  class="spaceUnder">    
          <td><form:password path="password" placeholder="Password"  /> <form:errors path="password" cssClass="error"/></td>  
         </tr>
          <tr  class="spaceUnder">      
          <td><form:password path="confirmPassword" placeholder="Confirm Password" /> <form:errors path="confirmPassword" cssClass="error"/> </td>  
         </tr>  
         <tr  class="spaceUnder">    
          <td><form:input path="address" placeholder="Address"  /><form:errors path="address" cssClass="error"/></td>  
         </tr>       
         <tr>      
          <td><input type="submit" value="Register" /></td>    
         </tr>    
        </table>    
       </form:form>
       <span style="color: red;" id="msg"><center>${msg}</center></span> 
       <br><br>
       <p><center>Own an account? Log in <a style="text-decoration:none;color:orange;" href="customerLogin">here.</a></center></p>
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
		    <li><a href="./index.jsp">Home</a></li>
		    <li><a href="aboutUs">About Us</a></li>
		    <li><a href="contactUs">Contact Us</a></li>
		 </ul>
		</div>
	</div>
</footer>  
       
</body>
</html>  