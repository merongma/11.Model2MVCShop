package com.model2.mvc.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;

//==> 회원관리 RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {

	/// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	// setter Method 구현 않음

	public UserRestController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "json/getUser/{userId}", method = RequestMethod.GET)
	public User getUser(@PathVariable String userId) throws Exception {

		System.out.println("/user/json/getUser : GET");

		// Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping(value = "json/login", method = RequestMethod.POST)
	public User login(@RequestBody User user, HttpSession session) throws Exception {

		System.out.println("/user/json/login : POST");
		// Business Logic
		System.out.println("::" + user);
		User dbUser = userService.getUser(user.getUserId());

		if (user.getPassword().equals(dbUser.getPassword())) {
			session.setAttribute("user", dbUser);
		}

		return dbUser;
	}

	@RequestMapping(value = "json/addUser", method = RequestMethod.POST)
	public User addUser(@RequestBody User user) throws Exception {

		System.out.println("/user/json/addUser : POST");
		System.out.println("::" + user);

		userService.addUser(user);

		return userService.getUser(user.getUserId());

	}

	@RequestMapping(value = "json/updateUser", method = RequestMethod.POST)
	public User updateUser(@RequestBody User user) throws Exception {

		System.out.println("/user/json/updateUser : POST");

		userService.updateUser(user);

		User resUser = userService.getUser(user.getUserId());

		return resUser;
	}

	@RequestMapping(value = "json/checkDuplication", method = RequestMethod.POST)
	public Map checkDuplication(@RequestBody User user) throws Exception {

		System.out.println("/user/json/checkDuplication : POST");

		System.out.println("user값 확인 : " + user);

		boolean result = userService.checkDuplication(user.getUserId());

		System.out.println("중복체크 값입니다!" + result);

		Map map = new HashMap();
		map.put("result", result);
		map.put("userId", user.getUserId());

		return map;
	}

	@RequestMapping(value = "json/listUser/{currentPage}/{pageSize}", method = RequestMethod.GET)

	public Map listUser(@PathVariable String currentPage, @PathVariable String pageSize) throws Exception {

		System.out.println("/user/json/listUser : GET");

		Search search = new Search();
		search.setCurrentPage(Integer.parseInt(currentPage));
		search.setPageSize(Integer.parseInt(pageSize));

		Map<String, Object> map = userService.getUserList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				search.getPageSize());

		System.out.println(resultPage);

		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);

		return map;
	}

	@RequestMapping(value = "json/listUser", method = RequestMethod.POST)

	public Map listUser(@RequestBody Search search) throws Exception {

		System.out.println("/user/json/listUser : POST");

		Map<String, Object> map = userService.getUserList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);

		return map;
	}
}