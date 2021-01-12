package game.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import game.common.utils.Page;
import game.entity.Type;
import game.service.ITypeService;

@Controller
public class TypeController {

	@Autowired
	private ITypeService ts;
	
	// 添加
	@RequestMapping(value = "/insertType")
	@ResponseBody
	public ModelAndView insertType(Type type,HttpServletResponse response) throws IOException {
		Type type1 = ts.findByTypeName(type.getType());
		if (type1 != null) {
			PrintWriter out = null;
			response.setContentType("text/html; charset=UTF-8"); // 转码
			out = response.getWriter();
			out.println("<script>");
			out.println("alert('已存在');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}else {
			ts.insertType(type);
			return new ModelAndView("redirect:/findAllType");
		}
	}
	
	//修改
	@RequestMapping(value = "/updateType")
	@ResponseBody
	public ModelAndView updateType(Type type,HttpServletResponse response) throws IOException {
		Type type1 = ts.findByTypeName(type.getType());
		if (type1 != null) {
			PrintWriter out = null;
			response.setContentType("text/html; charset=UTF-8"); // 转码
			out = response.getWriter();
			out.println("<script>");
			out.println("alert('已存在');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}else {
			ts.updateType(type);
			return new ModelAndView("redirect:/findAllType");
		}
	}
	
	//删除
	@RequestMapping(value = "/deleteType")
	@ResponseBody
	public ModelAndView deleteType(int id) {
		ts.deleteType(id);
		return new ModelAndView("redirect:/findAllType");
	}
	
	//类型列表
	@RequestMapping(value = "/findAllType")
	public String findAllType(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer rows, Model model) {
		// 查询所有
		Page<Type> types = ts.findAllType(page, rows);
		model.addAttribute("page", types);
		return "admin/type.jsp";
	}
	
	//模糊查询
		@RequestMapping(value = "/findLikeTypeName")
		public String findLikeTypeName(@RequestParam(defaultValue = "1") Integer page,
				@RequestParam(defaultValue = "7") Integer rows,@RequestParam("type") String type, Model model) {
			// 查询所有
			Page<Type> types = ts.findLikeTypeName(type, page, rows);
			model.addAttribute("page", types);
			return "admin/typelist.jsp";
		}
}
