package com.controllers;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;  
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import com.dao.ProductDao;
@Controller  
public class ProductController {  
     
	@Autowired
	ProductDao productDao;//will inject dao from XML file
	@Autowired
	OrderDao orderDao;//will inject dao from XML file
	
	@Autowired
	private JavaMailSender mailSenderObj;

	static String emailToRecipient, emailSubject, emailMessage;
	static final String emailFromRecipient = "shirowhitte@hotmail.com";

	//when customer wants clicks on different category, they want to view product sort by diff category
   @RequestMapping("/viewProductByCategory/{category}")  
   public String showProductCategory(@PathVariable String category,Model theModel) { 
	   //get the category from url
	   List <Product> plist = productDao.getProductByCategory(category); //ori no sort
	   List <Product> byLatest = productDao.sortProductByLatest(category); //sort by latest product id desc
	   List <Product> byTop = productDao.sortProductByTopSales(category); //sort by product unit sold desc
	   List <Product> byHighestPrice = productDao.sortProductByHighestPrice(category); //sort by product price desc
	   List <Product> byLowestPrice = productDao.sortProductByLowestPrice(category); //sort by product price asc
	   theModel.addAttribute("list", plist);  //display in view
	   theModel.addAttribute("category",category);
	   theModel.addAttribute("byLatest", byLatest);
	   theModel.addAttribute("byTop", byTop);
	   theModel.addAttribute("byHighestPrice", byHighestPrice);
	   theModel.addAttribute("byLowestPrice", byLowestPrice);
       return "viewProductByCategory";  //return this view
   } 
   
   //when customer wants to view details of a specific product
   @RequestMapping("/viewProduct/{id}")  
   public String showProduct(@PathVariable int id,Model theModel) {  
	   //get the product id
	   Product product = productDao.getProductById(id); //get product by product id
	   theModel.addAttribute("product", product);       //display in view   
       return "viewProduct";  //return view product page
   }
   
   //when customer wants to search for a product
   @RequestMapping(value = "/searchProduct", method = RequestMethod.POST)
	public String searchProductForm(@RequestParam("search") String search, Model theModel) {
		//get the string from field
	   	List <Product> searchProduct = productDao.searchProductList(search); //search this string within all product
	   	theModel.addAttribute("searchProduct", searchProduct);  //display the search result 
	   	theModel.addAttribute("product", new Product());  
		return "displaySearchProduct"; //return display search product page
	}
   
   //when vendor wants to manage product
   @RequestMapping("/manageProduct")  
   public String showProductMenu(Model theModel) { 
	   theModel.addAttribute("product", new Product());  
       return "manageProduct";  //display manage product page
   }
   
   //when vendor wants to add product
   @RequestMapping("/addProduct")  
   public String addProduct(Model theModel) { 
	   theModel.addAttribute("product", new Product());  
       return "addProduct";   //display add product page
   }
   
   //when vendor wants to update product
   @RequestMapping("/updateProduct")  
   public String updateProductForm(Model theModel) { 
	   List<Product> plist = productDao.vendorViewProduct(); //display all product
	   theModel.addAttribute("plist", plist); //add to view
       return "updateProduct";   //display update product page
   }
   
   //when vendor wants to update a specific product
   @RequestMapping("/updateThisProduct/{id}")  
   public String updateThisProduct(@PathVariable int id,Model theModel) { 
	   Product p = productDao.getProductById(id);	   //get product by pid
	   theModel.addAttribute("product", p);//display the details of this product
       return "updateThisProduct";  //return update this product page
   } 
   
   //when vendor wants to view product
   @RequestMapping("/viewProductVendor")  
   public String viewProductFormVendor(Model theModel) { 
	   List<Product> plist = productDao.vendorViewProduct(); //get all product from db
	   theModel.addAttribute("plist", plist); //add to view  
       return "viewProductVendor";  //return view product vendor page
   }
   
   //when vendor wants to delete product
   @RequestMapping("/deleteProduct")  
   public String deleteProductForm(Model theModel) { 
	   List<Product> plist = productDao.vendorViewProduct(); //display all product
	   theModel.addAttribute("plist", plist); 
       return "deleteProduct";  
   }
   
   //when vendor wants to delete a specic product, and click on delete button
   @RequestMapping(value="/deleteProduct/{id}")    
   public String deleteProduct(@PathVariable int id,Model theModel){    
       productDao.deleteProduct(id); //delete product from db
       theModel.addAttribute("msg","Product has been deleted successfully.");//display success message
	   List<Product> plist = productDao.vendorViewProduct(); //display the remaining product
	   theModel.addAttribute("plist", plist); //add to view
       return "deleteProduct";    //return delete product page
   }  
   
  
   //when vendor wants to add a new product 
   @RequestMapping(value="/addProductForm", method=RequestMethod.POST)  
   public String processAddProductForm(@Valid @ModelAttribute("product") Product product,BindingResult br ,@RequestParam("ppimg") MultipartFile img, Model theModel) 
   {
	   		//set the message attribute to empty
		   theModel.addAttribute("msg", "");
	       if (br.hasErrors()) //if validation not pass
	       {
	           return "addProduct";  //return add product page with error message
	       } 
	       else
	       {
	    	   //else if validation pass
	    	  if(!img.isEmpty()) //check whether the img is empty if its not
	    	  {
	    		  try {
	    			  byte[] bytes = img.getBytes(); //change the img to bytes
	    			  String rootPath = "C:\\Users\\SH Chau\\"; //define desktop path
		  			  File dir = new File(rootPath +"eclipse-workspace\\ePortal\\src\\main\\webapp\\resources\\img\\category");//save the uploaded img in this folder
		  			  //this is the eclipse folder 
		  			  if (!dir.exists()) //if this folder is not exits
		  			  {
		  				  dir.mkdirs();//create this folder
		  			  }
		  			  //save this image with ori file name(eg: watch.png)to the folders
					  File serverFile = new File(dir.getAbsolutePath()+ File.separator, img.getOriginalFilename());
					  BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					  stream.write(bytes);
					  stream.close();
					  theModel.addAttribute("msg","Product has been added successfully."); //display success message
					  productDao.addProduct(new Product(product.getPname(), product.getPdescription(),product.getPcategory(),product.getPrice(),product.getPstock(),img.getOriginalFilename()));
	    			  //insert product info into db
	    		  }
	    		  catch(Exception e)
	    		  {
	    			  e.printStackTrace();
	    		  }
	    	  }
	    	  theModel.addAttribute("product", new Product()); 
	    	  return "addProduct";//return add product page
	       }
     }  

   //if vendors want to update product price & stock
   @RequestMapping(value="/updateProductForm", method=RequestMethod.POST)  
   public String processUpdateProductForm(@ModelAttribute("product") Product product,Model theModel) 
   {
		productDao.updateProduct(new Product(product.getPid(),product.getPrice(),product.getPstock()));
		List<Product> plist = productDao.vendorViewProduct();
		theModel.addAttribute("plist", plist);
		theModel.addAttribute("product", new Product()); 
		theModel.addAttribute("msg","Product has been updated successfully.");
		return "updateProduct"; 
	       
     }  
   
   	//check whether the item is already exits in temporay cart
	private int exists(int id, List<Item> temp_cart) {
		for (int i = 0; i < temp_cart.size(); i++) 
		{
			//is the selected product id == id from tempcart
			if(temp_cart.get(i).getProduct().getPid() == id)
			{
				return i;
			}
		}
		return -1; //return -1 if its not exists
	}
	
	//when customer wants to view cart
	@RequestMapping("/viewCart")  
	   public String showCart(Model theModel,HttpServletRequest request) {
		   String username = (String)request.getSession().getAttribute("custSession"); //get username
		   List<Item> temp_cart = productDao.customerViewTempCart(username); //display cart item from database
		   int totalQty = 0;
		   for(int i=0;i<temp_cart.size();i++)
		   {
			   totalQty = totalQty + temp_cart.get(i).getQuantity(); //count the item qtt in temp cart
		   }
		   request.getSession().setAttribute("totalQty", totalQty);//set as attribute
		   theModel.addAttribute("temp_cart", temp_cart);  //supply temp cart to view 
	       return "viewCart";  //return view cart page
	   }
	  
		//when customer click on add this product to cart
		@RequestMapping(value = "buy/{id}", method = RequestMethod.POST)
		public String buy(@PathVariable("id") int id, @RequestParam("quantity") int qty, Model theModel,HttpServletRequest request) {
			//get product id, get quantity from form
			Product product = productDao.getProductById(id); //get product by pid
			String uid = (String)request.getSession().getAttribute("custSession");//get username
			List<Item> temp1 = productDao.customerViewTempCart(uid);//display cart item
			Customer c = new Customer();
			c.setUsername(uid); //set customer as this customer
			int old_punitsold = product.getPunitSold(); //get the original product unit sold from db
			int new_punitsold = old_punitsold + qty; //add new qty from form
			product.setPunitSold(new_punitsold); //set new p unit sold
			Item i = new Item(product,qty,c); 
			int exist = exists(id,temp1);//check whether this product id is exits in temp cart
			if(exist==-1) //if no
			{
				//add the product into temp cart
				productDao.addProductIntoTempCart(i);
			}
			else
			{
				//if yes, for each product in cart
				for(int j=0; j<temp1.size();j++)
				{
					//get the item quantity from temp cart db (****not product stock!!!!****)
					int oriQty = temp1.get(j).getQuantity();
					int newQty = oriQty + qty; //add new quantity eg(customer go back to view this product and add the product to cart agn)
					int oldUnitSold = temp1.get(j).getProduct().getPunitSold(); //get original product unit sold
					int newUnitSold = oldUnitSold - oriQty + newQty; //new unit sold //this is becuase we already store the ori qty up there, need to remove it to get the amount tally
					temp1.get(j).getProduct().setPunitSold(newUnitSold); //set new unit sold 
					Item itemExist = new Item(temp1.get(j).getProduct(),newQty,c); //get the newest info
					productDao.updateProductFromTempCart(itemExist); //update the temp cart
				}
			}
			List<Item> temp = productDao.customerViewTempCart(uid); //get the temp cart from db
			theModel.addAttribute("temp_cart",temp); //display temp cart to view
			int totalQty = (Integer)request.getSession().getAttribute("totalQty"); 
			request.getSession().setAttribute("totalQty", totalQty);  
			return "viewCart"; //display view cart page
		}
		
		//when customer wants to remove item from cart
	   @RequestMapping(value = "remove/{id}", method = RequestMethod.GET)
		public String remove(@PathVariable("id") int id,HttpServletRequest request,Model theModel) {
		   String uid = (String)request.getSession().getAttribute("custSession"); //get username
			productDao.removeProductFromTempCart(id,uid); //remove item from temp cart
			List<Item> temp_cart = productDao.customerViewTempCart(uid); //view remaing item in cart
			theModel.addAttribute("temp_cart",temp_cart); //display remaining item in cart to view
			int totalQty = (Integer)request.getSession().getAttribute("totalQty");
			request.getSession().setAttribute("totalQty", totalQty);
			return "viewCart"; //display view cart page
		}

	   //when customer wants to change the quantity of the item in cart
		@RequestMapping(value = "update/{id}", method = RequestMethod.POST)
		public String update(@PathVariable("id") int id, @RequestParam("quantity") int qty,  Model theModel,HttpServletRequest request) {
			Product product = productDao.getProductById(id); //get the product by pid
			String uid = (String)request.getSession().getAttribute("custSession"); //get username
			Customer c = new Customer();
			c.setUsername(uid); //set this customer
			int old_punitsold = product.getPunitSold(); //get product unit sold from the database
			int new_punitsold = old_punitsold + qty; //add the qty
			product.setPunitSold(new_punitsold);//set new product unit sold
			Item i = new Item(product,qty,c);
			productDao.updateProductFromTempCart(i); //update this item in cart in db
			 List<Item> temp_cart = productDao.customerViewTempCart(uid); //display all item from temporary cart
			theModel.addAttribute("temp_cart",temp_cart);
			int totalQty = (Integer)request.getSession().getAttribute("totalQty");
			request.getSession().setAttribute("totalQty", totalQty);
			return "viewCart"; //display view cart page
		}
		
			//when customer click on pay now button
		   @RequestMapping("/customerConfirmOrder")  
		   public String customerConfirmOrder(Model theModel, HttpServletRequest request) { 
			   String username = (String)request.getSession().getAttribute("custSession"); //get username
			   List<Item> temp_cart = productDao.customerViewTempCart(username); //display temp cart to user
			   Customer c = productDao.getAddressByUsername(username); //get user's address
			   theModel.addAttribute("address", c.getAddress());  //display user address in view
			   theModel.addAttribute("temp_cart", temp_cart); //display temp cart in view
		       return "customerConfirmOrder";  //return customer confirm order page
		   }
		   
		   	//when customer click on confirm button
			@RequestMapping(value = "/confirmOrder")
			public String Confirm(Model theModel,HttpServletRequest request,@RequestParam("totalPrice") double totalPrice) {
				//get the total price from form
				String uid = (String)request.getSession().getAttribute("custSession"); //get username
				List<Item> temp_cart = productDao.customerViewTempCart(uid); //display tmep cart to user
				String odate = new java.util.Date().toLocaleString(); //get current date and time
				Customer c = productDao.getAddressByUsername(uid); //get address by username
				String address = c.getAddress(); //get address
				Order order = new Order(odate,uid,address,temp_cart,"Received",totalPrice); //store this as new order
				productDao.addOrder(order); //add new order to database
				productDao.removeProductFromCart(uid); //remove all item from temporary cart
				
				//this is the session to update stock and product unit sold in db
				//for each item in temporary cart, it contains product beans and quantity
				for(int i=0;i<temp_cart.size();i++)
				{
					Customer customer = new Customer();
					customer.setUsername(uid);
					int pid = temp_cart.get(i).getProduct().getPid(); //get product id
					int old_stock = temp_cart.get(i).getProduct().getPstock();//this is the initial stock from table product
					int totalQty = temp_cart.get(i).getQuantity(); //this is the quantity purchased by customer for the particular product
					int new_stock = old_stock - totalQty; //this is the new stock, must update table product
					Product product = productDao.getProductById(pid); //get the product by pid
					int old_punitsold = product.getPunitSold(); //this is the initial product unit sold from table product
					int new_punitsold = old_punitsold+totalQty; //this is the new unit sold, must update table product and item
					product.setPstock(new_stock); //set new stock in table product
					product.setPunitSold(new_punitsold); //set new p unit sold in table product
					product.setPid(pid); //set this product id
					productDao.updateProductStockAndPunitsold(product); //update table product
					Item items = new Item(product,totalQty,customer);
					productDao.addProductIntoItemTable(items,uid,odate);
					//for every successful order, will update order table(store oid,odate..) and item table(store oid, pid, pname, quantity...)
				}
				
				String msg = "Your order has been confirmed!\n" 
						+ "Order Date: " + odate + "\n" + "Recipent Name: " 
						+ uid + "\nDelivery Address: " + address + "\nPrice: S$" + totalPrice
						+ "\nPlease prepare exact amount. Thank you for shopping with us.";
			
						emailSubject = "Order Confirmation From E-Commerce Portal";
						emailMessage = msg;
						emailToRecipient = c.getEmail();
						
						System.out.println("\nReceipient?= " + emailToRecipient + ", Subject?= " + emailSubject + ", Message?= " + emailMessage + "\n");

						mailSenderObj.send(new MimeMessagePreparator() {
							public void prepare(MimeMessage mimeMessage) throws Exception {

								MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");				
								mimeMsgHelperObj.setTo(emailToRecipient);
								mimeMsgHelperObj.setFrom(emailFromRecipient);				
								mimeMsgHelperObj.setText(emailMessage);
								mimeMsgHelperObj.setSubject(emailSubject);
								
								FileSystemResource file = new FileSystemResource(new File("c:/thankyou.png"));
								mimeMsgHelperObj.addAttachment("thankyou.png", file);
							}
						});
				request.getSession().setAttribute("totalQty", 0); //set the totalqty as 0 as nothing is inside the cart
				theModel.addAttribute("msg", "Your order has been added successfully."); //set the success message
				List <Order> orderList= orderDao.customerViewOrderHistory(uid); //display order list to customer
				theModel.addAttribute("orderList", orderList); 
				return "customerHistory";
			}

}