package com.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;  
import org.springframework.ui.Model;  
import org.springframework.validation.BindingResult;  
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.beans.Customer;
import com.beans.Item;
import com.beans.Product;
import com.dao.CustomerDao; 
import com.dao.ProductDao; 
 
@Controller  
public class CustomerController {  
     
	@Autowired
	CustomerDao customerDao;
	@Autowired
	ProductDao productDao;

	//mapping for customer registration page
   @RequestMapping("/customerRegister")  
   public String showForm(Model theModel) {  
       theModel.addAttribute("customer", new Customer());  
       return "customerRegister";  
   } 
   
   //mapping for customer login page
   @RequestMapping("/customerLogin")  
   public String loginForm(Model theModel) {  
       theModel.addAttribute("customer", new Customer());    
       return "customerLogin";  
   }
  
   //mapping for about us page
   @RequestMapping("/aboutUs")  
   public String aboutUsPage() {           
       return "aboutUs";  
   }
   
   //mapping for contact us page
   @RequestMapping("/contactUs")  
   public String contactUsPage() {           
       return "contactUs";  
   }
   
   //mapping for customer logout page
   @RequestMapping("/customerLogout")  
   public String logoutPage(HttpSession session, Model theModel) {           
	   session.invalidate(); //kill the session
	   theModel.addAttribute("customer", new Customer());  //refresh the model attribute
       return "customerLogin";  
   }
   
   //mapping for customer portal
   @RequestMapping("/customerPortal")  
   public String customerPortal(Model theModel,HttpServletRequest request) {
	   request.getSession().getAttribute("custSession"); //get the customer session
	   List<Product> plist = customerDao.customerPortalViewProduct(); //display product from db
	   theModel.addAttribute("plist", plist); //supply plist attribute to the view
	   theModel.addAttribute("customer", new Customer()); //supply customer attribute to the view
       return "customerPortal";  
   }
   
   //mapping when customer filled in register form and press register button
   @RequestMapping("/registerForm")  
   public String processForm( @Valid @ModelAttribute("customer") Customer customer, BindingResult br, Model theModel) {  
             
	   theModel.addAttribute("msg", ""); //supply empty message to the view
       if (br.hasErrors()) //check validation, if validation not pass
       {
           return "customerRegister";  //return customer register page
       } 
       else 
       {  
    	   //check if this customer username and email is already exist in the db ( must be unique )
    	   if(customerDao.checkUnique(customer.getUsername(), customer.getEmail())==true) 
    	   {
    		   //if exist
    		   theModel.addAttribute("msg", "Username or Email has already exist."); //supply error message to the view
    		   return "customerRegister"; //to this view
    	   }
    	   else
    	   {
    		   //if not ex
    		   theModel.addAttribute("msg", "Account has been registered successfully, please log in."); //supply error message to the view
	    	   theModel.addAttribute("customer", customer); //and add this customer as model attribute
	    	   customerDao.register(customer); //save the customer info into db
	           return "customerLogin"; //return customer login page
    	   }
    	   
       }  
   }  
   
   //when customer wants to login
   @RequestMapping(value="/loginForm", method=RequestMethod.POST)  
   public String processLoginForm(@ModelAttribute("customer") Customer customer, Model theModel,HttpServletRequest request) 
   { 
	   //check if this customer and password is exist in the database
	   if(customerDao.login(customer.getUsername(), customer.getPassword())==true)
	   {
		   //if exist
		   request.getSession().setAttribute("custSession", customer.getUsername()); //set username as the session attribute
		   List<Product> plist = customerDao.customerPortalViewProduct(); //get product from db to show customer
		   String username = (String)request.getSession().getAttribute("custSession"); //get the session attribute
		   List<Item> temp_cart = productDao.customerViewTempCart(username);  //get the temporary cart for this specific user
		   int totalQty = 0;
		   for(int i=0;i<temp_cart.size();i++)
		   {
			   totalQty = totalQty + temp_cart.get(i).getQuantity(); //count the total quantity in cart
		   }
		   request.getSession().setAttribute("totalQty", totalQty);//set the total quantity as session attribute
		   theModel.addAttribute("temp_cart", temp_cart);  //supply tempory cart to the view
		   theModel.addAttribute("plist", plist);  //supply product list to the view
		   theModel.addAttribute("customer", customer); //supply this customer to the view
		   return "customerPortal"; //return to the customer portal page
	   }
	   else
	   {
		   //not exist
		   theModel.addAttribute("msg", "Invalid Credential. Please try again."); //supply error message
		   return "customerLogin";//to customer login page
	   }
 
   }  
   
   //mapping for customer when they want to change their address
   @RequestMapping(value="/updateAddress/{username}")    //path variable to get the username
   public String updateAddress(@PathVariable String username,Model theModel){ 
	   Customer c = customerDao.getCustomerByUsername(username); //get customer by username 
	   String address = c.getAddress(); //get customer address
	   String email = c.getEmail(); //get customer email
	   theModel.addAttribute("email",email);//display customer email
	   theModel.addAttribute("address",address); //display customer address
       //customerDao.updateAddress(c);
       theModel.addAttribute("customer",  new Customer());
       return "updateAddress";  //return update address page  
   }  
   
   //mapping for customer when they enter the new address and click on submit button
   @RequestMapping(value = "/updateAddressForm",method=RequestMethod.POST)
	public String updateOrderStatusForm(@RequestParam("username") String username, @RequestParam("address") String address, Model theModel,HttpServletRequest request) {
	   	//request param to get the value from form 
		Customer c = new Customer(); //call beans
		c.setUsername(username); //set username
		c.setAddress(address); //set address
		customerDao.updateAddress(c); //update address where username = this.username
		Customer cu = customerDao.getCustomerByUsername(username); //get customer by username
		String add = cu.getAddress(); //get new address
		String email = cu.getEmail(); //get customer email
		theModel.addAttribute("email",email); //display email
		theModel.addAttribute("address",add); //display new address
	    theModel.addAttribute("customer",  new Customer());
	    theModel.addAttribute("msg",  "Your address has been updated successfully."); //display success message.
		return "updateAddress";//return update address page
	}
   

}  