package game.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import game.entity.Shopcar;
import game.service.IShopCarService;

@Controller
public class ShopCarController {

	@Autowired
	private IShopCarService scs;

	// 添加
	@RequestMapping(value = "/insertShopCar")
	@ResponseBody
	public ModelAndView insertShopCar(int gameid, double price, HttpSession session, HttpServletResponse response)
			throws IOException {
		String username = (String) session.getAttribute("username");
		Shopcar shopcar = new Shopcar();
		shopcar.setGameid(gameid);
		shopcar.setGameprice(price);
		shopcar.setUsername(username);

		Shopcar shopcar1 = scs.selectGame(shopcar);
		if (shopcar1 != null) {
			PrintWriter out = null;
			response.setContentType("text/html; charset=UTF-8"); // 转码
			out = response.getWriter();
			out.println("<script>");
			out.println("alert('已存在');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else {
			scs.insertShopcar(shopcar);
			return new ModelAndView("/findAllShopcar");
		}
	}

	// 删除
	@RequestMapping(value = "/deleteShopcar")
	@ResponseBody
	public ModelAndView deleteShopcar(int id) {
		scs.deleteShopcar(id);
		return new ModelAndView("/findAllShopcar");
	}

	// 删除全部
	@RequestMapping(value = "/deleteShopcarAll")
	@ResponseBody
	public ModelAndView deleteShopcarAll(HttpSession session) {
		String username = (String) session.getAttribute("username");
		scs.deleteShopcarAll(username);
		return new ModelAndView("user/shopcar.jsp");
	}

	// 购物车列表
	@RequestMapping(value = "/findAllShopcar")
	public String findAllShopcar(Model model, HttpSession session) {
		String username = (String) session.getAttribute("username");
		double sumprice = 0;
		// 查询所有
		List<Shopcar> shopcars = scs.findAllShopcar(username);
		if (shopcars == null) {
			return "user/shopcar.jsp";
		} else {
			model.addAttribute("shopcars", shopcars);
			//double sumprice = scs.selectSumPrice(username);
			//model.addAttribute("sumprice", sumprice);
			for (int i = 0; i < shopcars.size(); i++) {
				sumprice += shopcars.get(i).getGameprice();
			}
			model.addAttribute("sumprice", sumprice);
			return "user/shopcar.jsp";
		}
	}

	// 提交订单
	@RequestMapping(value = "/sureOrder")
	public String sureOrder(Model model, HttpSession session) {
		String username = (String) session.getAttribute("username");
		// 查询所有
		List<Shopcar> shopcars = scs.findAllShopcar(username);
		model.addAttribute("shopcars", shopcars);
		double sumprice = scs.selectSumPrice(username);
		model.addAttribute("sumprice", sumprice);
		return "user/sure.jsp";
	}

	// 立即购买
	@RequestMapping(value = "/buyNow")
	public String buyNow(int gameid, String gamename, double price, Model model, HttpSession session) {
		String username = (String) session.getAttribute("username");
		Shopcar shopcar = new Shopcar();
		shopcar.setGameid(gameid);
		shopcar.setGamename(gamename);
		shopcar.setGameprice(price);
		shopcar.setUsername(username);
		double sumprice = price;

		List<Shopcar> shopcars = new ArrayList<Shopcar>();
		shopcars.add(shopcar);

		model.addAttribute("shopcars", shopcars);

		model.addAttribute("sumprice", sumprice);
		return "user/surelist.jsp";
	}

}
