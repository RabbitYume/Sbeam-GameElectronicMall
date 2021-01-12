package game.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import game.common.utils.RandomValidateCode;

@Controller
public class AdminLoginController {

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String adminLogin(@RequestParam("admin") String admin, @RequestParam("pwd") String pwd,
			@RequestParam("inputStr") String inputStr, HttpSession session, HttpServletResponse response)
			throws IOException {
		// 从session中获取随机数
		String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
		inputStr = inputStr.toUpperCase();
		if (inputStr.equals(random)) {
			if (admin.equals("admin") && pwd.equals("root")) {
				// session.setAttribute("admin", admin);
				session.setAttribute("username", admin);
				return "redirect:admin/admin.jsp";
			} else {
				PrintWriter out = null;
				response.setContentType("text/html; charset=UTF-8"); // 转码
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('帐号/密码输入错误');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				return "adminlogin.jsp";
			}
		} else {
			PrintWriter out = null;
			response.setContentType("text/html; charset=UTF-8"); // 转码
			out = response.getWriter();
			out.println("<script>");
			out.println("alert('验证码输入错误');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return "adminlogin.jsp";
		}

	}

	@RequestMapping(value = "/logout")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "adminlogin.jsp";
	}

	/**
	 * 登录页面生成验证码
	 */
	@RequestMapping(value = "/getVerify")
	public void getVerify(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("image/jpeg");// 设置相应类型,告诉浏览器输出的内容为图片
		response.setHeader("Pragma", "No-cache");// 设置响应头信息，告诉浏览器不要缓存此内容
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expire", 0);
		RandomValidateCode randomValidateCode = new RandomValidateCode();
		try {
			randomValidateCode.getRandcode(request, response);// 输出验证码图片方法
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
