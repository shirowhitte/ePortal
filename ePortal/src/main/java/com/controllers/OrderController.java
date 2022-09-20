package com.controllers;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;  
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.beans.Customer;
import com.beans.Item;
import com.beans.Order;
import com.beans.Product;
import com.dao.OrderDao;  
 
@Controller  
public class OrderController {  
     
	@Autowired
	OrderDao orderDao;//will inject dao from XML file

	//mapping when customer wants to view purchase history
	@RequestMapping("/customerHistory")  
	public String customerHistory(Model theModel,HttpServletRequest request) { 
		String username = (String)request.getSession().getAttribute("custSession"); //get their username
		List <Order> orderList= orderDao.customerViewOrderHistory(username); //get the order history from db
		theModel.addAttribute("orderList", orderList); //supply to view
	    return "customerHistory";  //return customer history page
	   }

	//mapping for customer when they want to view details of one particular order history
   @RequestMapping("/viewOrderHistoryDetail/{id}")  
   public String viewOrderHistoryDetail(@PathVariable int id,Model model,HttpServletRequest request) { 
	   //path variable to get the particular order id
	   String username = (String)request.getSession().getAttribute("custSession"); //get their username
	   Order o1 = orderDao.getOrderById(id, username); //get the order by orderid and username
	   List <Order> orderDetailList= orderDao.customerViewOrderHistoryDetails(id); //get the order details list (including item and qtt)
	   model.addAttribute("o1", o1); //supply the order (order id, address,order date) to view
	   model.addAttribute("orderDetailList", orderDetailList);  //supply the order details list(item name, item qtt)*its list* to view)
       return "viewOrderHistoryDetail"; //return view order history details page
   }
   
   //mapping for vendor when vendor wants to manage order
   @RequestMapping("/manageOrder")  
   public String showOrderManagement(Model model) {  
	   model.addAttribute("order", new Order()); //supply order to the view
       return "manageOrder";  //return manage order view
   }
   
   //mapping for vendor when vendor wants to view new order ordered by customer(***status="received"***)
   @RequestMapping("/viewOrder")  
   public String viewOrder(Model model) {  
	   List<Order> orderList = orderDao.vendorViewNewOrder(); //get the new order list
	   model.addAttribute("orderList", orderList); //supply new order list to view
       return "viewOrder";  //return view order page
   }
   
   //mapping when vendors wants to view the order detail for the new order
   @RequestMapping("/vendorViewOrderDetail/{id}")  //this id refers to order id
   public String vendorViewOrderDetail(@PathVariable int id,Model model,HttpServletRequest request) 
   { 
	   Order o1 = orderDao.getOrderById(id); //get the order by order id
	   List <Order> orderDetailList= orderDao.customerViewOrderHistoryDetails(id); //get the item by order id
	   model.addAttribute("o1", o1); //supply order to the view
	   model.addAttribute("orderDetailList", orderDetailList);  //supply item to the view 
       return "vendorViewOrderDetail";  //return view
   }

   //mapping when vendor wants to update order status
   @RequestMapping("/updateOrderStatus")  
   public String updateOrderStatus(Model model) { 
	   List<Order> orderList = orderDao.vendorViewNewOrder();//get all new order
	   model.addAttribute("orderList", orderList); //add to view
	   model.addAttribute("order", new Order());
       return "updateOrderStatus";  //return view 
   }
   
   //mapping when vendor select another status and click on submit button
   @RequestMapping(value = "/updateOrderStatusForm") //this id is order id
	public String updateOrderStatusForm(@RequestParam("orderID") int orderID, @RequestParam("status") String status, Model theModel,HttpServletRequest request) {
		Order order = orderDao.getOrderById(orderID); //get the order id //it was sent using form input=hidden
		order.setOid(orderID); //set the orderid
		order.setOstatus(status); //set the new status
	   	orderDao.updateOrderStatus(order); //update status where orderid= this.orderid
	   	List<Order> orderList = orderDao.vendorViewNewOrder(); //view other new order
		theModel.addAttribute("orderList", orderList); //display other new order
	   	theModel.addAttribute("msg", "Order has been updated successfully.");  //display success message
		return "updateOrderStatus"; //return to update order status view
	}
   
   //mapping when vendor wants to view order history
   @RequestMapping("/orderHistory")  
   public String orderHistory(Model model) {  
	   List<Order> orderList = orderDao.vendorViewOldOrder(); //get the order from db where status="delivered"
	   model.addAttribute("orderList", orderList);//add them to display in view
       return "orderHistory";  //return order history
   }
   
   


   

    
}