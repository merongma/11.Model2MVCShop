package com.model2.mvc.web.product;

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
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserService;

//==> 회원관리 RestController
@RestController
@RequestMapping("/product/*")
public class ProductRestController {

	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	// setter Method 구현 않음

	public ProductRestController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "json/getProduct/{prodNo}", method = RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo) throws Exception {

		System.out.println("/product/json/getProduct : GET");

		return productService.getProduct(prodNo);
	}

	@RequestMapping(value = "json/addProduct", method = RequestMethod.POST)
	public Product addProduct(@RequestBody Product product) throws Exception {

		System.out.println("/product/json/addProduct : POST");
		System.out.println("::" + product);

		productService.addProduct(product);

		return product;

	}

	@RequestMapping(value = "json/updateProduct", method = RequestMethod.POST)
	public Product updateProduct(@RequestBody Product product) throws Exception {

		System.out.println("/product/json/updateProduct : POST");

		productService.updateProduct(product);

		Product resProduct = productService.getProduct(product.getProdNo());

		return resProduct;
	}

	@RequestMapping(value = "json/listProduct/{currentPage}/{pageSize}", method = RequestMethod.GET)

	public Map listProduct(@PathVariable String currentPage, @PathVariable String pageSize) throws Exception {

		System.out.println("/product/json/listProduct : GET");

		Search search = new Search();
		search.setCurrentPage(Integer.parseInt(currentPage));
		search.setPageSize(Integer.parseInt(pageSize));

		Map<String, Object> map = productService.getProductList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				search.getPageSize());

		System.out.println(resultPage);

		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);

		return map;
	}

	@RequestMapping(value = "json/listProduct", method = RequestMethod.POST)

	public Map listProduct(@RequestBody Search search) throws Exception {

		System.out.println("/product/json/listProduct : POST");

		Map<String, Object> map = productService.getProductList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);

		return map;
	}

}