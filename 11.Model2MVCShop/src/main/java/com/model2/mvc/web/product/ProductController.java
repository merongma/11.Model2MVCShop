package com.model2.mvc.web.product;

import java.io.File;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.review.ReviewService;

//==> 회원관리 Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;

	// setter Method 구현 않음

	public ProductController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@Value("#{commonProperties['uploadDir']}")
	String uploadDir;

	@RequestMapping(value = "addProduct", method = RequestMethod.GET)
	public String addProductView() throws Exception {

		System.out.println("/product/addProduct : GET");

		return "forward:/product/addProductView.jsp";
	}

	@RequestMapping(value = "addProduct", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product, @RequestParam("file") MultipartFile file)
			throws Exception {

		System.out.println("/product/addProduct : POST");

		String fileName = file.getOriginalFilename();
		File target = new File(uploadDir, fileName);

		FileCopyUtils.copy(file.getBytes(), target);

		product.setFileName(fileName);
		productService.addProduct(product);

		return "forward:/product/addProduct.jsp";
	}

	@RequestMapping(value = "getProduct", method = RequestMethod.GET)
	public String getProduct(@RequestParam("prodNo") int prodNo, Model model, @RequestParam("menu") String menu,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("/product/getProduct : GET");

		Product product = productService.getProduct(prodNo);
		User user = (User) request.getSession().getAttribute("user");
		Purchase purchase = purchaseService.getPurchase2(prodNo);
		
		model.addAttribute("product", product);
		model.addAttribute("user", user);
		model.addAttribute("purchase", purchase);

		Cookie cookieBox[] = request.getCookies();
		Cookie cookie = null;

		if (cookieBox != null) {
			for (int i = 0; i < cookieBox.length; i++) {
				if (cookieBox[i].getName().equals("history")) {
					cookie = new Cookie("history", cookieBox[i].getValue() + "," + prodNo);
					break;
				}
			}
		} else {
			cookie = new Cookie("history", String.valueOf(prodNo));
		}

		if (cookie == null) {
			cookie = new Cookie("history", String.valueOf(prodNo));
		}

		cookie.setMaxAge(-1);
		cookie.setPath("/");

		// System.out.println("쿠키값 확인 " + cookie.getValue());
		response.addCookie(cookie);

		System.out.println("menu값" + menu);
	
		Search search = new Search();
		System.out.println("getproduct 에서 lsit 들어오나요?");
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println("search 값은 ? : " + search);
		Map<String, Object> map = reviewService.getReviewList(search, prodNo);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println("map 값은? :" + map);
		System.out.println("resultPage 값은? :" + resultPage);
		System.out.println("마지막으로 모델값 : "+model);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		if (menu.equals("manage")) {

			return "forward:/product/updateProductView.jsp";

		} else {

			return "forward:/product/getProduct.jsp";
		}

	}

//	@RequestMapping(value = "getProduct", method = RequestMethod.POST)
//	public String getProduct(@RequestParam("prodNo") int prodNo, Model model, HttpServletRequest request,
//			HttpServletResponse response) throws Exception {
//
//		System.out.println("/product/getProduct : POST");
//
//		Product product = productService.getProduct(prodNo);
//		User user = (User) request.getSession().getAttribute("user");
//		Purchase purchase = purchaseService.getPurchase2(prodNo);
//
//		model.addAttribute("product", product);
//		model.addAttribute("user", user);
//		model.addAttribute("purchase", purchase);
//
//		Cookie cookieBox[] = request.getCookies();
//		Cookie cookie = null;
//
//		if (cookieBox != null) {
//			for (int i = 0; i < cookieBox.length; i++) {
//				if (cookieBox[i].getName().equals("history")) {
//					cookie = new Cookie("history", cookieBox[i].getValue() + "," + prodNo);
//					break;
//				}
//			}
//		} else {
//			cookie = new Cookie("history", String.valueOf(prodNo));
//		}
//
//		if (cookie == null) {
//			cookie = new Cookie("history", String.valueOf(prodNo));
//		}
//
//		cookie.setMaxAge(-1);
//		cookie.setPath("/");
//
//		System.out.println("쿠키값 확인 " + cookie.getValue());
//		response.addCookie(cookie);
//
//		////
//		System.out.println("getproduct 에서 lsit 들어오나요?");
//		Search search = new Search();
//		System.out.println("getproduct 에서 lsit 들어오나요?");
//		if (search.getCurrentPage() == 0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//		System.out.println("search 값은 ? : " + search);
//		Map<String, Object> map = reviewService.getReviewList(search, prodNo);
//
//		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
//				pageSize);
//		System.out.println("map 값은? :" + map);
//		System.out.println("resultPage 값은? :" + resultPage);
//		System.out.println("마지막으로 모델값 : "+model);
//		model.addAttribute("list", map.get("list"));
//		model.addAttribute("resultPage", resultPage);
//		model.addAttribute("search", search);
//
//		////
//
//		return "forward:/product/getProduct.jsp";
//	}

	@RequestMapping(value = "updateProduct", method = RequestMethod.GET)
	public String updateProductView(@RequestParam("prodNo") int prodNo, Model model) throws Exception {

		System.out.println("/product/updateProduct : GET");

		Product product = productService.getProduct(prodNo);
		model.addAttribute("product", product);

		return "forward:/product/updateProductView.jsp";
	}

	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product") Product product, Model model,
			@RequestParam("prodNo") int prodNo, @RequestParam("file") MultipartFile file) throws Exception {

		System.out.println("/product/updateProduct : POST");

		String fileName = file.getOriginalFilename();
		File target = new File(uploadDir, fileName);

		FileCopyUtils.copy(file.getBytes(), target);

		product.setFileName(fileName);

		productService.updateProduct(product);

		Product product2 = productService.getProduct(prodNo);
		product.setRegDate(product2.getRegDate());

		model.addAttribute("product", product);

		return "forward:/product/updateProduct.jsp";

	}

	@RequestMapping(value = "listProduct")
	public String listProduct(@ModelAttribute("search") Search search, Model model) throws Exception {

		System.out.println("/product/listProduct : GET / POST");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = productService.getProductList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);

		System.out.println(resultPage);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/product/listProduct.jsp";
	}

	@RequestMapping(value = "listNew")
	public String listNew(@ModelAttribute("search") Search search, Model model) throws Exception {

		System.out.println("/product/listNew : GET / POST");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = productService.getNewList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);

		System.out.println(resultPage);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/product/listNew.jsp";
	}
}