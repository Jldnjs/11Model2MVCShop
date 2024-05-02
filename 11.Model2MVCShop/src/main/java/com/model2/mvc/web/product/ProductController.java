package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.model2.mvc.service.product.ProductService;

//==> 회원관리 Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ProductController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "addProduct", method = RequestMethod.GET)
	public String addProduct() throws Exception {

		System.out.println("/product/addProductAction:GET");

		return "forward:/product/addProductView.jsp";
	}

	// @RequestMapping("/addProduct.do")
	@RequestMapping(value = "addProduct", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product, Model model) throws Exception {

		System.out.println("/product/addProduct:POST");
		// Business Logic
		product = productService.insertProduct(product);

		// model.addAttribute("product", product);
		System.out.println(product.getProdNo());
		System.out.println(product.getRegDate());
		return "forward:/product/addProduct.jsp";
	}

	// @RequestMapping("/updateProductView.do")
	@RequestMapping(value = "updateProductView", method = RequestMethod.GET)
	public String updateProductView(@RequestParam("prodNo") int prodNo, Model model) throws Exception {
		System.out.println("/product/updateProductView:GET");

		Product product = productService.getProduct(prodNo);

		model.addAttribute("product", product);

		return "forward:/product/updateProductView.jsp";
	}

	// @RequestMapping("/updateProduct.do")
	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product") Product product, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		System.out.println("/product/updateProduct:POST");

		productService.updateProduct(product);
		// GET

		model.addAttribute("product", productService.getProduct(product.getProdNo()));

		return "forward:/product/updateProduct.jsp";
	}

	// @RequestMapping("/getProduct.do")
	@RequestMapping(value = "getProduct", method = RequestMethod.GET)
	public String getProduct(@RequestParam("menu") String menu, Model model, @RequestParam("prodNo") int prodNo,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("/product/getProduct: GET");

		Product product = productService.getProduct(prodNo);

		String history = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if (cookie.getName().equals("history")) {
					history = cookie.getValue();
					break;
				}
			}
		}

		String newProdNo = request.getParameter("prodNo");
		if (newProdNo != null && !newProdNo.isEmpty()) {
			if (history == null) {
				history = ":" + newProdNo;
			} else {
				history += ":" + newProdNo;
			}

			Cookie historyCookie = new Cookie("history", history);
			historyCookie.setPath("/");// root잡음
			response.addCookie(historyCookie);
		}

		model.addAttribute("product", product);

		if (menu.equals("manage")) {
			System.out.println(menu);
			return "forward:/product/updateProductView.jsp";
		}
		return "forward:/product/getProduct.jsp";
	}

	// @RequestMapping("/listProduct.do")
	@RequestMapping(value = "listProduct")
	public String listProduct(@RequestParam("menu") String menu, Model model, @ModelAttribute("search") Search search,
			HttpServletRequest request) throws Exception {

		System.out.println("/product/listProduct: get/post");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = productService.getProductList(search);
		int totalCount = productService.getTotalCount(search);

		Page resultPage = new Page(search.getCurrentPage(), totalCount, pageUnit, pageSize);
		System.out.println(resultPage);

		model.addAttribute("list", map.get("list"));
		System.out.println(map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);

		return "forward:/product/listProduct.jsp";
	}

}