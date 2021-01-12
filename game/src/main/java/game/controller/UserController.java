package game.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import game.common.utils.MD5;
import game.common.utils.Page;
import game.entity.User;
import game.service.IUserService;

@Controller
public class UserController {
	@Autowired
	private IUserService us;

	// 添加
	@RequestMapping(value = "/insert")
	@ResponseBody
	public ModelAndView insert(User user, HttpServletResponse response) throws IOException {
		User user1 = us.findByName(user.getUsername());
		if (user1 != null) {
			PrintWriter out = null;
			response.setContentType("text/html; charset=UTF-8"); // 转码
			out = response.getWriter();
			out.println("<script>");
			out.println("alert('用户名已存在');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else {
			String pwdMd5 = MD5.MD5(user.getUserpwd());
			user.setUserpwd(pwdMd5);
			us.insert(user);
			return new ModelAndView("redirect:/findAll");
		}
	}

	// 修改
	@RequestMapping(value = "/update")
	@ResponseBody
	public ModelAndView update(User user) {
		String pwdMd5 = MD5.MD5(user.getUserpwd());
		user.setUserpwd(pwdMd5);
		us.update(user);
		return new ModelAndView("redirect:/findAll");
	}

	// 删除
	@RequestMapping(value = "/delete")
	@ResponseBody
	public ModelAndView delete(int id) {
		us.delete(id);
		return new ModelAndView("redirect:/findAll");
	}

	// 用户列表
	@RequestMapping(value = "/findAll")
	public String findAll(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer rows, Model model) {
		// 查询所有
		Page<User> users = us.findAll(page, rows);
		model.addAttribute("page", users);
		return "admin/user.jsp";
	}

	// 模糊查询
	@RequestMapping(value = "/findLikeName")
	public String findLikeName(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer rows, @RequestParam("username") String username, Model model) {
		// 查询所有
		Page<User> users = us.findLikeName(username, page, rows);
		model.addAttribute("page", users);
		return "admin/userlist.jsp";
	}

	// 用户登录
	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	public String userLogin(@RequestParam("username") String username, @RequestParam("userpwd") String userpwd,
			@RequestParam("inputStr") String inputStr, HttpSession session, HttpServletResponse response)
			throws IOException {
		// 从session中获取随机数
		String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
		inputStr = inputStr.toUpperCase();
		if (inputStr.equals(random)) {
			String pwdMd5 = MD5.MD5(userpwd);
			User user = us.login(username, pwdMd5);
			if (user != null) {
				session.setAttribute("username", username);
				session.setAttribute("userpwd", pwdMd5);
				return "redirect:index.jsp";
			} else {
				PrintWriter out = null;
				response.setContentType("text/html; charset=UTF-8"); // 转码
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('帐号/密码输入错误');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				return "userlogin.jsp";
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
			return "userlogin.jsp";
		}

	}

	// 退出登录
	@RequestMapping(value = "/userLogout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:index.jsp";
	}

	// 注册
	@RequestMapping(value = "/registered")
	@ResponseBody
	public ModelAndView registered(User user, HttpServletResponse response) throws IOException {
		User user1 = us.findByName(user.getUsername());
		if (user1 != null) {
			PrintWriter out = null;
			response.setContentType("text/html; charset=UTF-8"); // 转码
			out = response.getWriter();
			out.println("<script>");
			out.println("alert('用户名已存在');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else {
			String pwdMd5 = MD5.MD5(user.getUserpwd());
			user.setUserpwd(pwdMd5);
			us.insert(user);
			return new ModelAndView("redirect:/index.jsp");
		}
	}
	
	//修改密码
		@RequestMapping(value = "/updateUser")
		@ResponseBody
		public ModelAndView updateUser(User user,@RequestParam("confirm") String confirm,HttpServletResponse response) throws IOException {
			if (user.getUserpwd().equals(confirm)) {
				String pwdMd5 = MD5.MD5(user.getUserpwd());
				user.setUserpwd(pwdMd5);
				us.updatePwd(user);
				PrintWriter out = null;
				response.setContentType("text/html; charset=UTF-8"); // 转码
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('修改成功');");
				out.println("location.href=\"index.jsp\"; ");
				out.println("</script>");
				out.close();
				return new ModelAndView("index.jsp");
			}else {
				PrintWriter out = null;
				response.setContentType("text/html; charset=UTF-8"); // 转码
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('两次输入的密码不同');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				return null;
			}
		}

}
