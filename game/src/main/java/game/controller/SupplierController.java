package game.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import game.common.utils.Page;
import game.entity.Supplier;
import game.service.ISupplierService;

@Controller
public class SupplierController {
	
	@Autowired
	private ISupplierService ss;
	
	// 添加
		@RequestMapping(value = "/insertSupplier")
		@ResponseBody
		public ModelAndView insertSupplier(Supplier supplier,HttpServletResponse response) throws IOException {
			Supplier supplier1 = ss.findBySupplierName(supplier.getSuppliername());
			if (supplier1 != null) {
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
				ss.insertSupplier(supplier);
				return new ModelAndView("redirect:/findAllSupplier");
			}
		}
		
	//修改
	@RequestMapping(value = "/updateSupplier")
	@ResponseBody
	public ModelAndView updateSupplier(Supplier supplier, HttpServletResponse response) throws IOException {
		Supplier supplier1 = ss.findBySupplierName(supplier.getSuppliername());
		if (supplier1 != null) {
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
		ss.updateSupplier(supplier);
		return new ModelAndView("redirect:/findAllSupplier");
		}
	}
	
	//删除
	@RequestMapping(value = "/deleteSupplier")
	@ResponseBody
	public ModelAndView deleteSupplier(int id) {
		ss.deleteSupplier(id);
		return new ModelAndView("redirect:/findAllSupplier");
	}
	
	//厂商列表
	@RequestMapping(value = "/findAllSupplier")
	public String findAllSupplier(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer rows, Model model) {
		// 查询所有
		Page<Supplier> suppliers = ss.findAllSupplier(page, rows);
		model.addAttribute("page", suppliers);
		return "admin/supplier.jsp";
	}
	
	//模糊查询
		@RequestMapping(value = "/findLikeSupplierName")
		public String findLikeSupplierName(@RequestParam(defaultValue = "1") Integer page,
				@RequestParam(defaultValue = "7") Integer rows,@RequestParam("suppliername") String suppliername, Model model) {
			// 查询所有
			Page<Supplier> suppliers = ss.findLikeSupplierName(suppliername, page, rows);
			model.addAttribute("page", suppliers);
			return "admin/supplierlist.jsp";
		}

}
