package com.model2.mvc.web.review;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

	@Value("#{commonProperties['uploadDir']}")
	String uploadDir;

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
			@RequestParam("tranNo") int tranNo, HttpServletRequest request, @RequestParam("file") MultipartFile file)
			throws Exception {

		System.out.println("/review/addReview : POST");

		User user = (User) request.getSession().getAttribute("user");
		Product product = productService.getProduct(prodNo);
		Purchase purchase = purchaseService.getPurchase(tranNo);

		review.setReUser(user);
		review.setReProduct(product);
		review.setRePurchase(purchase);

		String fileName = file.getOriginalFilename();
		File target = new File(uploadDir, fileName);

		FileCopyUtils.copy(file.getBytes(), target);

		review.setReviewFile(fileName);

		reviewService.addReview(review);

		return "forward:/product/getProduct";
	}

	// @RequestMapping(value = "getReview")
	// public String getReview(@RequestParam("reviewNo") int reviewNo, Model model)
	// throws Exception {
	//
	// System.out.println("/review/getReview : GET / POST");
	//
	// Review review = reviewService.getReview(reviewNo);
	//
	// model.addAttribute("review", review);
	//
	// return "forward:/purchase/getPurchaseView.jsp";
	//
	// }

	// @RequestMapping(value = "listReview")
	// public String listReview(@ModelAttribute("search") Search search, Model
	// model, HttpServletRequest request,
	// @RequestParam("prodNo") int prodNo) throws Exception {
	//
	// System.out.println("/review/listReview : GET / POST");
	//
	// if (search.getCurrentPage() == 0) {
	// search.setCurrentPage(1);
	// }
	// search.setPageSize(pageSize);
	//
	// User user = (User) request.getSession().getAttribute("user");
	// String buyerId = user.getUserId();
	//
	// System.out.println("session buyerid : " + buyerId);
	//
	// Map<String, Object> map = reviewService.getReviewList(search, prodNo);
	//
	// Page resultPage = new Page(search.getCurrentPage(), ((Integer)
	// map.get("totalCount")).intValue(), pageUnit,
	// pageSize);
	// System.out.println(resultPage);
	//
	// model.addAttribute("list", map.get("list"));
	// model.addAttribute("resultPage", resultPage);
	// model.addAttribute("search", search);
	//
	// System.out.println("model :" + model);
	//
	// return "forward:/review/listReview.jsp";
	// }

	@RequestMapping(value = "updateReviewView", method = RequestMethod.GET)
	public String updateReviewView(@RequestParam("reviewNo") int reviewNo, Model model) throws Exception {

		System.out.println("/review/updateReviewView : GET");

		Review review = reviewService.getReview(reviewNo);
		int prodNo = review.getReProduct().getProdNo();
		Product product = productService.getProduct(prodNo);
		review.setReProduct(product);

		model.addAttribute("review", review);
		System.out.println("model값 : " + model);

		return "forward:/review/updateReviewView.jsp";
	}

	@RequestMapping(value = "updateReview", method = RequestMethod.POST)
	public String updateReview(@ModelAttribute("Review") Review review, @RequestParam("reviewNo") int reviewNo,
			@RequestParam("prodNo") int prodNo, @RequestParam("userId") String userId,
			@RequestParam("tranNo") int tranNo, Model model, @RequestParam("file") MultipartFile file)
			throws Exception {

		System.out.println("/review/updateReview : POST");
		System.out.println("들어오는 리뷰값 " + review);
		// System.out.println("상품명은? "+prodName);

		Product product = productService.getProduct(prodNo);
		review.setReProduct(product);
		Purchase purchase = purchaseService.getPurchase(tranNo);
		review.setRePurchase(purchase);
		User user = userService.getUser(userId);
		review.setReUser(user);
		
		String fileName = file.getOriginalFilename();
		File target = new File(uploadDir, fileName);

		FileCopyUtils.copy(file.getBytes(), target);

		review.setReviewFile(fileName);
		reviewService.updateReview(review);

		model.addAttribute("review", review);

		return "forward:/product/getProduct";
	}

}
