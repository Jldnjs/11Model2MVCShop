package com.model2.mvc.web.purchase;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;

//==> 회원관리 Controller
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public PurchaseController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	// @RequestMapping("/addPurchaseView.do")
	@RequestMapping(value = "addPurchaseView", method = RequestMethod.GET)
	public String addPurchaseView(@RequestParam("prod_no") int prodNo, Model model) throws Exception {

		System.out.println("/addPurchaseView.do");
		System.out.println("prodnononono: " + prodNo);
		Product product = productService.getProduct(prodNo);

		model.addAttribute("product", product);

		System.out.println(product);

		return "forward:/purchase/addPurchaseView.jsp";
	}

	@RequestMapping(value = "addPurchase", method = RequestMethod.POST)
	public String addPurchase(@ModelAttribute("purchase") Purchase purchase, HttpSession session,
			@RequestParam("prodNo") int prodNo, Model model) throws Exception {

		System.out.println("/addPurchase.POST");
		// Business Logic
		Product product = productService.getProduct(prodNo);
		purchase.setPurchaseProd(product);

		User user = (User) session.getAttribute("user");
		purchase.setBuyer(user);

		purchaseService.addPurchase(purchase);
		System.out.println("\\\\\\\\\\\\\\");
		model.addAttribute("purchase", purchase);

		return "forward:/purchase/addPurchase.jsp";
	}

	// @RequestMapping("/updatePurchaseView.do")
	@RequestMapping(value = "updatePurchaseView", method = RequestMethod.GET)
	public String updatePurchaseView(@RequestParam("tranNo") int tranNo, Model model) throws Exception {
		System.out.println("/updateProductView.GET");

		Purchase purchase = purchaseService.getPurchase(tranNo);

		model.addAttribute("purchase", purchase);

		return "forward:/purchase/updatePurchaseView.jsp";
	}

	@RequestMapping(value = "updatePurchase", method = RequestMethod.POST)
	public String updatePurchase(@ModelAttribute("purchase") Purchase purchase, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		System.out.println("/updatePurchase.POST");

		purchaseService.updatePurchaseVO(purchase);
		// GET

		model.addAttribute("purchase", purchaseService.getPurchase(purchase.getTranNo()));

		return "forward:/purchase/updatePurchase.jsp";
	}

	// @RequestMapping("/getPurchase.do")
	@RequestMapping(value = "getPurchase", method = RequestMethod.GET)
	public String getPurchase(@RequestParam("userId") String userId, Model model, @RequestParam("tranNo") int tranNo,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("/getPurchase.get");

		Purchase purchase = purchaseService.getPurchase(tranNo);

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
			response.addCookie(historyCookie);
		}

		model.addAttribute("purchase", purchase);

		if (userId.equals("manager") || userId.equals("admin")) {
			System.out.println(userId);
			return "forward:/purchase/updatePurchaseView.jsp";
		}
		return "forward:/purchase/getPurchase.jsp";
	}

	// @RequestMapping("/listPurchase.do")
	@RequestMapping(value = "listPurchase")
	public String listPurchase(Model model, @ModelAttribute("search") Search search, HttpServletRequest request,
			HttpSession session) throws Exception {

		User user = (User) session.getAttribute("user");
		System.out.println("userId 왜 안넘어와:" + user + "\n\n");
		System.out.println("/listPurchase.do" + "\n");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println("1111111" + user.getUserId());
		Map<String, Object> map = purchaseService.getPurchaseList(search, user.getUserId());
		int totalCount = purchaseService.getTotalCount(user.getUserId());

		Page resultPage = new Page(search.getCurrentPage(), totalCount, pageUnit, pageSize);
		System.out.println(resultPage);

		System.out.println("list{{{{{{{{{{{" + map.get("list") + "\n");

		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/purchase/listPurchase.jsp";
	}

	// @RequestMapping("/updateTranCode.do")
	@RequestMapping(value = "updateTranCode", method = RequestMethod.GET)
	public String updateTranCode(Model model, @RequestParam("tranNo") int tranNo,
			@RequestParam("tranCode") String tranCode, @RequestParam("menu") String menu) throws Exception {

		System.out.println("updatetran :::::::::::::" + menu);
		Purchase purchase = purchaseService.getPurchase(tranNo);

		System.out.println(purchase);
		System.out.println(((Integer.parseInt(purchase.getTranCode().trim()) + 1) + "").getClass().getName());
		purchase.setTranCode((Integer.parseInt(purchase.getTranCode().trim()) + 1) + "");

		purchaseService.updatePurchaseVO(purchase);

		if (menu != null && menu.equals("purchase")) {
			return "forward:/purchase/listPurchase";
		} else {
			return "forward:/product/listProduct";
		}
	}

}