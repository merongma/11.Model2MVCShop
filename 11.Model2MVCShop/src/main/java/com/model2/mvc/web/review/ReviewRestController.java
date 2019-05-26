package com.model2.mvc.web.review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.review.ReviewService;
import com.model2.mvc.service.user.UserService;

//==> 회원관리 RestController
@RestController
@RequestMapping("/review/*")
public class ReviewRestController {

	/// Field
	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;
	// setter Method 구현 않음

	public ReviewRestController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "json/getReview/{reviewNo}", method = RequestMethod.GET)
	public Review getReview(@PathVariable int reviewNo) throws Exception {

		System.out.println("/review/json/getReview : GET");

		return reviewService.getReview(reviewNo);
	}

}