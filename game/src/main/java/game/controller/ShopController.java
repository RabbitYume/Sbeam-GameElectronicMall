package game.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import game.common.utils.Page;
import game.entity.Game;
import game.entity.Type;
import game.service.IGameService;

@Controller
public class ShopController {
	
	@Autowired
	private IGameService gs;

	// 游戏列表
		@RequestMapping(value = "/shop")
		public String Shop(@RequestParam(defaultValue = "1") Integer page,
				@RequestParam(defaultValue = "8") Integer rows, Model model) {
			// 查询所有
			Page<Game> games = gs.findAllGame(page, rows);
			model.addAttribute("page", games);
			// 类型
			List<Type> typelist = gs.findByGameTypeList();
			model.addAttribute("typelist", typelist);
			return "shop.jsp";
		}

		// 模糊查询
		@RequestMapping(value = "/userFindLikeGameName")
		public String findLikeGameName(@RequestParam(defaultValue = "1") Integer page,
				@RequestParam(defaultValue = "8") Integer rows, @RequestParam("gamename") String gamename, Model model) {
			Page<Game> games = gs.findLikeGameName(gamename, page, rows);
			model.addAttribute("page", games);
			// 类型
			List<Type> typelist = gs.findByGameTypeList();
			model.addAttribute("typelist", typelist);
			return "shoplist.jsp";
		}

		// 根据类型查询
		@RequestMapping(value = "/userFindByGameType")
		public String userFindByGameType(@RequestParam(defaultValue = "1") Integer page,
				@RequestParam(defaultValue = "8") Integer rows, @RequestParam("typeid") int typeid, Model model) {
			Page<Game> games = gs.findByGameType(typeid, page, rows);
			model.addAttribute("page", games);
			// 类型
			List<Type> typelist = gs.findByGameTypeList();
			model.addAttribute("typelist", typelist);
			return "shopTypelist.jsp";
		}

		// 价格区间查询
		@RequestMapping(value = "/findGamePriceBetween")
		public String findGamePriceBetween(@RequestParam(defaultValue = "1") Integer page,
				@RequestParam(defaultValue = "8") Integer rows, @RequestParam("max") int max, Model model) {
			Page<Game> games = gs.findGamePriceBetween(0, max, page, rows);
			model.addAttribute("page", games);
			// 类型
			List<Type> typelist = gs.findByGameTypeList();
			model.addAttribute("typelist", typelist);
			return "shoppriceBetween.jsp";
		}

		// 售价高到低
		@RequestMapping(value = "/findGamePriceH2L")
		public String findGamePriceH2L(@RequestParam(defaultValue = "1") Integer page,
				@RequestParam(defaultValue = "8") Integer rows, Model model) {
			// 查询所有
			Page<Game> games = gs.findGamePriceH2L(page, rows);
			model.addAttribute("page", games);
			// 类型
			List<Type> typelist = gs.findByGameTypeList();
			model.addAttribute("typelist", typelist);
			return "shoplistH2L.jsp";
		}

		// 售价低到高
		@RequestMapping(value = "/findGamePriceL2H")
		public String findGamePriceL2H(@RequestParam(defaultValue = "1") Integer page,
				@RequestParam(defaultValue = "8") Integer rows, Model model) {
			// 查询所有
			Page<Game> games = gs.findGamePriceL2H(page, rows);
			model.addAttribute("page", games);
			// 类型
			List<Type> typelist = gs.findByGameTypeList();
			model.addAttribute("typelist", typelist);
			return "shoplistL2H.jsp";
		}

}
