package game.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.MvcNamespaceHandler;

import org.apache.commons.io.FilenameUtils;

import game.common.utils.Page;
import game.entity.Game;
import game.entity.Supplier;
import game.entity.Type;
import game.service.IGameService;
import game.service.ITypeService;

@Controller
public class GameController {

	@Autowired
	private IGameService gs;

	// 添加
	@RequestMapping(value = "/insertGame")
	public String insertGame(Model model) {
		// 厂商
		List<Supplier> supplierlist = gs.findByGameSupplierList();
		model.addAttribute("supplierlist", supplierlist);
		// 类型
		List<Type> typelist = gs.findByGameTypeList();
		model.addAttribute("typelist", typelist);
		return "admin/gameinsert.jsp";
	}

	// 添加提交
	@RequestMapping(value = "/toinsertGame")
	@ResponseBody
	public ModelAndView toinsertSupplier(Game game, HttpServletResponse response) throws IOException {
		Game game1 = gs.findByGameName(game.getGamename());
		if (game1 != null) {
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
			gs.insertGame(game);
			return new ModelAndView("redirect:/findAllGame");
		}
	}

	// 删除
	@RequestMapping(value = "/deleteGame")
	@ResponseBody
	public ModelAndView deleteGame(int id) {
		gs.deleteGame(id);
		return new ModelAndView("redirect:/findAllGame");
	}

	// 修改
	@RequestMapping(value = "/updateGame")
	@ResponseBody
	public ModelAndView updateGame(Model model) {
		// 厂商
		List<Supplier> supplierlist = gs.findByGameSupplierList();
		model.addAttribute("supplierlist", supplierlist);
		// 类型
		List<Type> typelist = gs.findByGameTypeList();
		model.addAttribute("typelist", typelist);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/gameupdate.jsp");
		return mv;
	}

	// 修改提交
	@RequestMapping(value = "/toupdateGame")
	@ResponseBody
	public ModelAndView toupdateGame(Game game, HttpServletResponse response) throws IOException {
		gs.updateGame(game);
		return new ModelAndView("redirect:/findAllGame");
	}

	// 游戏列表
	@RequestMapping(value = "/findAllGame")
	public String findAllGame(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer rows, Model model) {
		// 查询所有
		Page<Game> games = gs.findAllGame(page, rows);
		model.addAttribute("page", games);
		// 类型
		List<Type> typelist = gs.findByGameTypeList();
		model.addAttribute("typelist", typelist);
		return "admin/game.jsp";
	}

	// 模糊查询
	@RequestMapping(value = "/findLikeGameName")
	public String findLikeGameName(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer rows, @RequestParam("gamename") String gamename, Model model) {
		Page<Game> games = gs.findLikeGameName(gamename, page, rows);
		model.addAttribute("page", games);
		// 类型
		List<Type> typelist = gs.findByGameTypeList();
		model.addAttribute("typelist", typelist);
		return "admin/gamelist.jsp";
	}

	// 根据类型查询
	@RequestMapping(value = "/findByGameType")
	public String findByGameType(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer rows, @RequestParam("typeid") int typeid, Model model) {
		Page<Game> games = gs.findByGameType(typeid, page, rows);
		model.addAttribute("page", games);
		// 类型
		List<Type> typelist = gs.findByGameTypeList();
		model.addAttribute("typelist", typelist);
		return "admin/gameTypelist.jsp";
	}

	// 图片
	// 添加
	@RequestMapping(value = "/insertGameimg")
	@ResponseBody
	public ModelAndView insertGameimg(Game game, HttpServletRequest request, HttpServletResponse response,
			MultipartFile pictureFile) throws IOException {
		Game game1 = gs.findByGameImg(game.getGamename());
		if (game1 != null) {
			PrintWriter out = null;
			response.setContentType("text/html; charset=UTF-8"); // 转码
			out = response.getWriter();
			out.println("<script>");
			out.println("alert('该游戏已拥有图片');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else {
			Game game2 = gs.findByGameName(game.getGamename());
			if (game2 == null) {
				PrintWriter out = null;
				response.setContentType("text/html; charset=UTF-8"); // 转码
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('该游戏不存在');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				return null;
			} else {
				// 使用UUID给图片重命名，并去掉四个“-”
				String name = UUID.randomUUID().toString().replaceAll("-", "");
				// 获取文件的扩展名
				String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
				// 设置图片上传路径
				String url = request.getSession().getServletContext().getRealPath("/img/game");
				// 以绝对路径保存重名命后的图片
				pictureFile.transferTo(new File(url + "/" + name + "." + ext));
				String imgurl = "img/game/" + name + "." + ext;
				game.setImgurl(imgurl);
				gs.insertGameimg(game);
				return new ModelAndView("redirect:/findAllGameImg");
			}
		}
	}

	// 修改
	@RequestMapping(value = "/updateGameimg")
	@ResponseBody
	public ModelAndView updateGameimg(Game game, Model model, HttpServletRequest request, MultipartFile pictureFile)
			throws IllegalStateException, IOException {
		// 删除原文件
		Game game1 = gs.findByGameImg(game.getGamename());
		String url = request.getSession().getServletContext().getRealPath("/img/game");
		String[] s1 = game1.getImgurl().split("/");
		// 获取需要删除的文件
		File deleteFile = new File(url + "/" + s1[2]);
		deleteFile.delete();

		// 使用UUID给图片重命名，并去掉四个“-”
		String name = UUID.randomUUID().toString().replaceAll("-", "");
		// 获取文件的扩展名
		String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
		// 以绝对路径保存重名命后的图片
		pictureFile.transferTo(new File(url + "/" + name + "." + ext));
		String imgurl = "img/game/" + name + "." + ext;
		game.setImgurl(imgurl);
		gs.updateGameimg(game);
		return new ModelAndView("redirect:/findAllGameImg");
	}

	// 删除
	@RequestMapping(value = "/deleteGameimg")
	@ResponseBody
	public ModelAndView deleteGameimg(String gamename, int id, HttpServletRequest request) {
		Game game = gs.findByGameImg(gamename);
		String url = request.getSession().getServletContext().getRealPath("/img/game");
		String[] s1 = game.getImgurl().split("/");
		// 获取需要删除的文件
		File deleteFile = new File(url + "/" + s1[2]);
		deleteFile.delete();
		gs.deleteGameimg(id);
		return new ModelAndView("redirect:/findAllGameImg");
	}

	// 列表
	@RequestMapping(value = "/findAllGameImg")
	public String findAllGameImg(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer rows, Model model) {
		// 查询所有
		Page<Game> games = gs.findAllGameImg(page, rows);
		model.addAttribute("page", games);
		return "admin/gameimg.jsp";
	}

	// 模糊查询
	@RequestMapping(value = "/findLikeGameImgName")
	public String findLikeGameImgName(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer rows, @RequestParam("gamename") String gamename, Model model) {
		// 查询所有
		Page<Game> games = gs.findLikeGameImgName(gamename, page, rows);
		model.addAttribute("page", games);
		return "admin/gameimglist.jsp";
	}

}
