package com.model2.mvc.web.review;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;
import com.model2.mvc.service.review.ReviewService;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.impl.UserServiceImpl;

//==> 회원관리 Controller
@Controller
@RequestMapping("/review/*")
public class ReviewController {

	/// Field
	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	// setter Method 구현 않음

	public ReviewController() {
		System.out.println(this.getClass());
	}

	// ==> classpath:config/common.properties , classpath:config/commonservice.xml
	// 참조 할것
	// ==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	@RequestMapping(value = "addReview", method = RequestMethod.GET)
	public String addReview(@RequestParam("prodNo") int prodNo, Model model, HttpServletRequest request)
			throws Exception {

		System.out.println("/review/addReview : GET");

		Product product = productService.getProduct(prodNo);

		User user = (User) request.getSession().getAttribute("user");
		String buyerId = user.getUserId();

		Purchase purchase = purchaseService.getPurchase2(prodNo);

		model.addAttribute("product", product);
		model.addAttribute("user", user);
		model.addAttribute("purchase", purchase);

		System.out.println(model);

		return "forward:/review/addReview.jsp";
	}

	@RequestMapping(value = "addReview", method = RequestMethod.POST)
	public String addReview(@ModelAttribute("review") Review review, @RequestParam("prodNo") int prodNo,
			@RequestParam("tranNo") int tranNo, HttpServletRequest request) throws Exception {

		System.out.println("/review/addReview : POST");

		User user = (User) request.getSession().getAttribute("user");
		Product product = productService.getProduct(prodNo);
		Purchase purchase = purchaseService.getPurchase(tranNo);

		review.setReUser(user);
		review.setReProduct(product);
		review.setRePurchase(purchase);

		reviewService.addReview(review);

		return "forward:/product/getProduct";
	}

	@RequestMapping(value = "getReview")
	public String getReview(@RequestParam("reviewNo") int reviewNo, Model model) throws Exception {

		System.out.println("/review/getReview : GET / POST");
		
		Review review = reviewService.getReview(reviewNo);

		model.addAttribute("review",review);


		return "forward:/purchase/getPurchaseView.jsp";

	}

//	@RequestMapping(value = "listReview")
//	public String listReview(@ModelAttribute("search") Search search, Model model, HttpServletRequest request,
//			@RequestParam("prodNo") int prodNo) throws Exception {
//
//		System.out.println("/review/listReview : GET / POST");
//
//		if (search.getCurrentPage() == 0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//
//		User user = (User) request.getSession().getAttribute("user");
//		String buyerId = user.getUserId();
//
//		System.out.println("session buyerid : " + buyerId);
//
//		Map<String, Object> map = reviewService.getReviewList(search, prodNo);
//
//		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
//				pageSize);
//		System.out.println(resultPage);
//
//		model.addAttribute("list", map.get("list"));
//		model.addAttribute("resultPage", resultPage);
//		model.addAttribute("search", search);
//
//		System.out.println("model :" + model);
//
//		return "forward:/review/listReview.jsp";
//	}

//	@RequestMapping(value = "updatePurchase", method = RequestMethod.POST)
//	public String updatePurchase(@ModelAttribute("Purchase") Purchase purchase, @RequestParam("tranNo") int tranNo,
//			Model model) throws Exception {
//
//		System.out.println("/purchase/updatePurchase : POST");
//
//		purchase.setTranNo(tranNo);
//		purchaseService.updatePurchase(purchase);
//
//		model.addAttribute("purchase", purchase);
//
//		return "forward:/purchase/getPurchase";
//	}
//
//	@RequestMapping(value = "updatePurchaseView", method = RequestMethod.GET)
//	public String updatePurchaseView(@ModelAttribute("Purchase") Purchase purchase, @RequestParam("tranNo") int tranNo,
//			Model model) throws Exception {
//
//		System.out.println("/purchase/updatePurchaseView : GET");
//
//		purchase = purchaseService.getPurchase(tranNo);
//
//		model.addAttribute("purchase", purchase);
//
//		return "forward:/purchase/updatePurchaseView.jsp";
//
//	}
}