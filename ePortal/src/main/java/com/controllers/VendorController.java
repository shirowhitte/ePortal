package com.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;  
import org.springframework.ui.Model;  
import org.springframework.validation.BindingResult;  
import org.springframework.web.bind.annotation.ModelAttribute;  
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.beans.Customer;
import com.beans.Vendor;
import com.dao.VendorDao;  
 
@Controller  
public class VendorController {  
     
	@Autowired
	VendorDao vendorDao;//will inject dao from XML file

	
   @RequestMapping("/vendorLogin")  
   public String loginForm(Model theModel) {  
         
       theModel.addAttribute("vendor", new Vendor());  
         
       return "vendorLogin";  
   }

   @RequestMapping("/vendorLogout")  
   public String logoutPage(HttpSession session, Model theModel) {  
	   session.invalidate();
	   theModel.addAttribute("vendor", new Vendor());
       return "vendorLogin";  
   }
   
   @RequestMapping("/vendorHome")  
   public String vendorHome() {           
       return "vendorPortal";  
   }
   @RequestMapping(value="/vendorLoginForm", method=RequestMethod.POST)  
   public String processLoginForm(@ModelAttribute("vendor") Vendor vendor, Model theModel,HttpServletRequest request) 
   {  
	   if(vendorDao.login(vendor.getVusername(), vendor.getVpassword())==true)
	   {
		   request.getSession().setAttribute("vendorSession", vendor);
		   theModel.addAttribute("vendor", vendor);
		   return "vendorPortal";
	   }
	   else
	   {
		   theModel.addAttribute("msg", "Invalid Credential. Please try again.");
		   return "vendorLogin";
	   }
   
       
   } 
   
   
   
   
} 