package game.controller;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.record.cf.IconMultiStateFormatting;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;

import game.common.utils.AlipayConfig;
import game.common.utils.Page;
import game.entity.Game;
import game.entity.Order;
import game.entity.Shopcar;
import game.service.IGameService;
import game.service.IOrderService;
import game.service.IShopCarService;

@Controller
public class OrderController {

	@Autowired
	private IOrderService os;
	@Autowired
	private IGameService gs;
	@Autowired
	private IShopCarService scs;

	final static Logger log = LoggerFactory.getLogger(OrderController.class);

	// 删除
	@RequestMapping(value = "/deleteOrder")
	@ResponseBody
	public ModelAndView deleteOrder(int orderid) {
		os.deleteOrder(orderid);
		return new ModelAndView("redirect:/findAllOrder");
	}

	// 删除单条订单
	@RequestMapping(value = "/deleteOneOrder")
	@ResponseBody
	public ModelAndView deleteOneOrder(int id) {
		os.deleteOneOrder(id);
		return new ModelAndView("redirect:/findAllOrder");
	}

	// 修改
	@RequestMapping(value = "/updateOrder")
	@ResponseBody
	public ModelAndView updateOrder(Order order, Model model) {
		Game game = gs.findByGameName(order.getGamename());
		int gameid = game.getId();
		order.setGameid(gameid);
		os.updateOrder(order);
		return new ModelAndView("redirect:/findAllOrder");
	}

	// 列表
	@RequestMapping(value = "/findAllOrder")
	public String findAllOrder(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer rows, Model model) {
		// 查询所有
		Page<Order> orders = os.findAllOrder(page, rows);
		model.addAttribute("page", orders);
		return "admin/order.jsp";
	}

	// 模糊查询
	@RequestMapping(value = "/findLikeOrderid")
	public String findLikeOrderid(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer rows, @RequestParam("orderid") int orderid, Model model) {
		// 查询所有
		Page<Order> orders = os.findLikeOrderid(orderid, page, rows);
		model.addAttribute("page", orders);
		return "admin/orderlist.jsp";
	}

	// 导出Excel
	@RequestMapping(value = "/getExcel")
	public void getExcel(HttpServletResponse resp) {
		try {
			// 创建Excel文件的对象工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 创建工作表
			HSSFSheet sheet = workbook.createSheet("订单表");
			// 创建首行
			HSSFRow row = sheet.createRow(0);
			// 设置表头
			String[] title = { "id", "订单编号", "游戏名", "价格", "下单时间", "是否支付", "用户名", "激活码" };
			// 赋值给表头
			for (int i = 0; i < title.length; i++) {
				row.createCell(i).setCellValue(title[i]);
			}

			// 获取数据
			List<Order> orders = os.output();
			for (int i = 0; i < orders.size(); i++) {
				// 创建行
				HSSFRow rows = sheet.createRow(i + 1);
				// 设置每行单元格的内容
				String[] content = { String.valueOf(orders.get(i).getId()), String.valueOf(orders.get(i).getOrderid()),
						String.valueOf(orders.get(i).getGamename()), String.valueOf(orders.get(i).getPrice()),
						orders.get(i).getTime(), String.valueOf(orders.get(i).getPay()),
						String.valueOf(orders.get(i).getUsername()), String.valueOf(orders.get(i).getGamekey()), };
				for (int j = 0; j < content.length; j++) {
					rows.createCell(j).setCellValue(content[j]);
				}
			}
			// 文件名称
			String fileName = "订单表" + System.currentTimeMillis() + ".xls";
			// 设置fileName的编码
			String resetName = new String(fileName.getBytes(), "ISO-8859-1");
			// 设置为excel表格格式
			resp.setContentType("application/vnd.ms-excel");
			// 设置响应头，设置文件的名字
			resp.setHeader("Content-Disposition", "attachment;filename=" + resetName);
			// 创建输出流
			ServletOutputStream outputStream = resp.getOutputStream();
			// 将工作簿写入输出流
			workbook.write(outputStream);
			// 关闭流
			outputStream.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 用户列表
	@RequestMapping(value = "/userFindOrder")
	public ModelAndView userFindOrder(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer rows, Model model, HttpSession session) {
		String username = (String) session.getAttribute("username");
		// 查询所有
		Page<Order> orders = os.userfindAllOrder(username, page, rows);
		model.addAttribute("page", orders);
		return new ModelAndView("user/order.jsp");
	}

	// 用户模糊查询
	@RequestMapping(value = "/userfindLikeOrderid")
	public String userfindLikeOrderid(@RequestParam("orderid") int orderid, Model model) {
		// 查询所有
		List<Order> orders = os.userfindOrderid(orderid);
		model.addAttribute("orders", orders);
		String pay = os.userselectOrderPay(orderid);
		model.addAttribute("pay", pay);
		Double sumpay = os.userselectOrderSumPay(orderid);
		model.addAttribute("sumpay", sumpay);
		String time = os.userselectOrderTime(orderid);
		model.addAttribute("time", time);
		return "user/orderlist.jsp";
	}

	// 用户下单
	@Transactional // 事务
	@RequestMapping(value = "/insertOrder")
	public ModelAndView insertOrder(HttpSession session) {
		String username = (String) session.getAttribute("username");
		// 单号
		Random random = new Random();
		int orderid = random.nextInt(899999) + 100000;
		// 获取当前日期
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = tempDate.format(new java.util.Date());
		// 查询购物车记录
		List<Shopcar> shopcars = scs.findAllShopcar(username);
		// 添加订单记录
		for (Shopcar shopcar : shopcars) {
			Order order = new Order();
			order.setOrderid(orderid);
			order.setGameid(shopcar.getGameid());
			order.setPrice(shopcar.getGameprice());
			order.setTime(date);
			order.setPay("否");
			order.setUsername(username);
			os.insertOrder(order);
		}
		
		// 清空购物车
		scs.deleteShopcarAll(username);
		
		Double sumprice = os.userselectOrderSumPay(orderid);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/goAlipay");
		session.setAttribute("orderid", orderid);
		session.setAttribute("price", sumprice);

		return mv;
	}

	// 用户立即购买
	@RequestMapping(value = "/insertNowOrder")
	public ModelAndView insertNowOrder(int gameid, double price, HttpSession session) throws AlipayApiException {
		String username = (String) session.getAttribute("username");
		// 单号
		Random random = new Random();
		int orderid = random.nextInt(899999) + 100000;
		// 获取当前日期
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = tempDate.format(new java.util.Date());
		// 添加订单记录
		Order order = new Order();
		order.setOrderid(orderid);
		order.setGameid(gameid);
		order.setPrice(price);
		order.setTime(date);
		order.setPay("否");
		order.setUsername(username);
		os.insertOrder(order);

		Double sumprice = os.userselectOrderSumPay(orderid);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/goAlipay");
		session.setAttribute("orderid", orderid);
		session.setAttribute("price", sumprice);

		return mv;
	}

	// 生成随机key
	public String getStringRandom() {

		String val = "";
		Random random = new Random();

		// 参数length，表示生成几位随机数
		for (int i = 0; i < 5; i++) {

			String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
			// 输出字母还是数字
			if ("char".equalsIgnoreCase(charOrNum)) {
				// 输出是大写字母还是小写字母
				int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;
				val += (char) (random.nextInt(26) + temp);
			} else if ("num".equalsIgnoreCase(charOrNum)) {
				val += String.valueOf(random.nextInt(10));
			}
		}
		return val;
	}

	//前往支付宝第三方网关进行支付
	@RequestMapping(value = "/goAlipay", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String goAlipay(HttpServletRequest request, HttpServletRequest response, HttpSession session)
			throws Exception {

		String orderid = String.valueOf(session.getAttribute("orderid"));
		String price = String.valueOf(session.getAttribute("price"));

		// 获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
				AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key,
				AlipayConfig.sign_type);

		// 设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

		// 商户订单号，商户网站订单系统中唯一订单号，必填
		String out_trade_no = orderid;
		// 付款金额，必填
		String total_amount = price;
		// 订单名称，必填
		String subject = "Sbeam游戏商城";
		// 商品描述，可空
		String body = "用户订购商品个数：" + "1";

		// 该笔订单允许的最晚付款时间，逾期将关闭交易。取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。该参数数值不接受小数点，
		// 如 1.5h，可转换为 90m。
		String timeout_express = "1c";

		alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"," + "\"total_amount\":\"" + total_amount
				+ "\"," + "\"subject\":\"" + subject + "\"," + "\"body\":\"" + body + "\"," + "\"timeout_express\":\""
				+ timeout_express + "\"," + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

		// 请求
		String result = alipayClient.pageExecute(alipayRequest).getBody();

		return result;
	}

	//支付宝同步通知页面
	@RequestMapping(value = "/alipayReturnNotice")
	public ModelAndView alipayReturnNotice(HttpServletRequest request, HttpServletRequest response, HttpSession session)
			throws Exception {

		log.info("支付成功, 进入同步通知接口...");

		// 获取支付宝GET过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}

		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,
				AlipayConfig.sign_type); // 调用SDK验证签名

		String orderid = String.valueOf(session.getAttribute("orderid"));
		String price = String.valueOf(session.getAttribute("price"));

		ModelAndView mv = new ModelAndView("/paySuccess");
		// ——请在这里编写您的程序（以下代码仅作参考）——
		if (signVerified) {
			// 商户订单号
			String out_trade_no = new String(orderid.getBytes("ISO-8859-1"), "UTF-8");

			// 支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

			// 付款金额
			String total_amount = new String(price.getBytes("ISO-8859-1"), "UTF-8");

			log.info("********************** 支付成功(支付宝同步通知) **********************");
			log.info("* 订单号: {}", out_trade_no);
			log.info("* 支付宝交易号: {}", trade_no);
			log.info("* 实付金额: {}", total_amount);
			log.info("* 购买产品: {}", "电子游戏");
			log.info("***************************************************************");

			mv.addObject("out_trade_no", out_trade_no);
			mv.addObject("trade_no", trade_no);
			mv.addObject("total_amount", total_amount);
			mv.addObject("productName", "电子游戏");

		} else {
			log.info("支付, 验签失败...");
		}

		return mv;
	}

	//支付宝异步 通知页面
	@RequestMapping(value = "/alipayNotifyNotice")
	@ResponseBody
	public String alipayNotifyNotice(HttpServletRequest request, HttpServletRequest response, HttpSession session)
			throws Exception {

		log.info("支付成功, 进入异步通知接口...");

		// 获取支付宝POST过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用
//			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}

		String orderid = String.valueOf(session.getAttribute("orderid"));
		String price = String.valueOf(session.getAttribute("price"));

		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,
				AlipayConfig.sign_type); // 调用SDK验证签名

		// ——请在这里编写您的程序（以下代码仅作参考）——

		/*
		 * 实际验证过程建议商户务必添加以下校验： 1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
		 * 2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额）， 3、校验通知中的seller_id（或者seller_email)
		 * 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
		 * 4、验证app_id是否为该商户本身。
		 */
		if (signVerified) {// 验证成功
			// 商户订单号
			String out_trade_no = new String(orderid.getBytes("ISO-8859-1"), "UTF-8");

			// 支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

			// 交易状态
			String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "UTF-8");

			// 付款金额
			String total_amount = new String(price.getBytes("ISO-8859-1"), "UTF-8");

			if (trade_status.equals("TRADE_FINISHED")) {
				// 判断该笔订单是否在商户网站中已经做过处理
				// 如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				// 如果有做过处理，不执行商户的业务程序

				// 注意： 尚自习的订单没有退款功能, 这个条件判断是进不来的, 所以此处不必写代码
				// 退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
			} else if (trade_status.equals("TRADE_SUCCESS")) {
				// 判断该笔订单是否在商户网站中已经做过处理
				// 如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				// 如果有做过处理，不执行商户的业务程序

				// 注意：
				// 付款完成后，支付宝系统发送该交易状态通知

				log.info("********************** 支付成功(支付宝异步通知) **********************");
				log.info("* 订单号: {}", out_trade_no);
				log.info("* 支付宝交易号: {}", trade_no);
				log.info("* 实付金额: {}", total_amount);
				log.info("* 购买产品: {}", "电子游戏");
				log.info("***************************************************************");
			}
			log.info("支付成功...");

		} else {// 验证失败
			log.info("支付, 验签失败...");
		}

		return "/paySuccess";
	}

	@RequestMapping(value = "/paySuccess")
	public String paySuccess(HttpServletRequest request, HttpServletRequest response, HttpSession session)
			throws Exception {
		int orderid = (int) session.getAttribute("orderid");
		// 修改订单状态，改为 支付成功，已付款; 同时新增支付流水
		Order order = new Order();
		order.setOrderid(orderid);
		order.setPay("是");
		os.updateOrderPay(order);

		// 获取游戏id
		List<Order> orders = os.userfindOrderid(orderid);
		for (int i = 0; i < orders.size(); i++) {
			// 获取随机key
			session.getAttribute("gameid");
			String key1 = getStringRandom();
			String key2 = getStringRandom();
			String key3 = getStringRandom();
			String key = key1 + "-" + key2 + "-" + key3;
			order.setGamekey(key);
			order.setOrderid(orderid);
			order.setGameid(orders.get(i).getGameid());
			os.insertKey(order);
		}

		session.removeAttribute("orderid");
		session.removeAttribute("price");
		
		return "user/success.jsp";
	}
}