package game.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.common.utils.Page;
import game.dao.GameDao;
import game.entity.Game;
import game.entity.Supplier;
import game.entity.Type;
import game.service.IGameService;

@Service
public class GameServiceImpl implements IGameService {

	@Autowired
	private GameDao gd;

	// 添加
	@Override
	public void insertGame(Game game) {
		gd.insertGame(game);
	}

	// 删除
	@Override
	public void deleteGame(int id) {
		gd.deleteGame(id);
	}

	// 修改
	@Override
	public void updateGame(Game game) {
		gd.updateGame(game);
	}

	// 游戏列表
	@Override
	public Page<Game> findAllGame(int page, int rows) {
		Game game = new Game();
		// 当前页
		game.setStart((page - 1) * rows);
		// 每页数
		game.setRows(rows);
		// 查询列表
		List<Game> findAllGame = gd.findAllGame(game);
		// 查询列表总记录数
		int count = gd.selectGameCount(game);
		// 创建Page返回对象
		Page<Game> result = new Page<>();
		result.setPage(page);
		result.setRows(findAllGame);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	// 根据名称查询
	@Override
	public Game findByGameName(String gamename) {
		Game findByGameName = gd.findByGameName(gamename);
		return findByGameName;
	}

	// 模糊查询
	@Override
	public Page<Game> findLikeGameName(String gamename, int page, int rows) {
		Game game = new Game();
		game.setGamename(gamename);
		// 当前页
		game.setStart((page - 1) * rows);
		// 每页数
		game.setRows(rows);
		// 查询列表
		List<Game> findLikeGameName = gd.findLikeGameName(game);
		// 查询列表总记录数
		int count = gd.selectLikeGameCount(game);
		// 创建Page返回对象
		Page<Game> result = new Page<>();
		result.setPage(page);
		result.setRows(findLikeGameName);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	// 厂商列表
	@Override
	public List<Supplier> findByGameSupplierList() {
		List<Supplier> supplierlist = gd.findByGameSupplierList();
		return supplierlist;
	}

	// 类型列表
	@Override
	public List<Type> findByGameTypeList() {
		List<Type> typelist = gd.findByGameTypeList();
		return typelist;
	}

	// 根据类型查询
	@Override
	public Page<Game> findByGameType(int typeid, int page, int rows) {
		Game game = new Game();
		game.setTypeid(typeid);
		// 当前页
		game.setStart((page - 1) * rows);
		// 每页数
		game.setRows(rows);
		// 查询列表
		List<Game> findByGameType = gd.findByGameType(game);
		// 查询列表总记录数
		int count = gd.selectByGameType(game);
		// 创建Page返回对象
		Page<Game> result = new Page<>();
		result.setPage(page);
		result.setRows(findByGameType);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	// 价格区间查询
	@Override
	public Page<Game> findGamePriceBetween(int low, int hight, int page, int rows) {
		Game game = new Game();
		game.setLow(low);
		game.setHight(hight);
		// 当前页
		game.setStart((page - 1) * rows);
		// 每页数
		game.setRows(rows);
		// 查询列表
		List<Game> findGamePriceBetween = gd.findGamePriceBetween(game);
		// 查询列表总记录数
		int count = gd.selectGamePriceBetween(game);
		// 创建Page返回对象
		Page<Game> result = new Page<>();
		result.setPage(page);
		result.setRows(findGamePriceBetween);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	// 售价高到低
	@Override
	public Page<Game> findGamePriceH2L(int page, int rows) {
		Game game = new Game();
		// 当前页
		game.setStart((page - 1) * rows);
		// 每页数
		game.setRows(rows);
		// 查询列表
		List<Game> findGamePriceH2L = gd.findGamePriceH2L(game);
		// 查询列表总记录数
		int count = gd.selectGameCount(game);
		// 创建Page返回对象
		Page<Game> result = new Page<>();
		result.setPage(page);
		result.setRows(findGamePriceH2L);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	// 售价低到高
	@Override
	public Page<Game> findGamePriceL2H(int page, int rows) {
		Game game = new Game();
		// 当前页
		game.setStart((page - 1) * rows);
		// 每页数
		game.setRows(rows);
		// 查询列表
		List<Game> findGamePriceL2H = gd.findGamePriceL2H(game);
		// 查询列表总记录数
		int count = gd.selectGameCount(game);
		// 创建Page返回对象
		Page<Game> result = new Page<>();
		result.setPage(page);
		result.setRows(findGamePriceL2H);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	// 图片
	//添加
	@Override
	public void insertGameimg(Game game) {
		gd.insertGameimg(game);
	}
	
	//修改
	@Override
	public void updateGameimg(Game game) {
		gd.updateGameimg(game);
	}

	//删除
	@Override
	public void deleteGameimg(int id) {
		gd.deleteGameimg(id);
	}
	
	//图片列表
	@Override
	public Page<Game> findAllGameImg(int page, int rows) {
		Game game = new Game();
		// 当前页
		game.setStart((page - 1) * rows);
		// 每页数
		game.setRows(rows);
		// 查询列表
		List<Game> findAllGameImg = gd.findAllGameImg(game);
		// 查询列表总记录数
		int count = gd.selectGameCount(game);
		// 创建Page返回对象
		Page<Game> result = new Page<>();
		result.setPage(page);
		result.setRows(findAllGameImg);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}
	
	//查询图片
	@Override
	public Game findByGameImg(String gamename) {
		Game findByGameImg = gd.findByGameImg(gamename);
		return findByGameImg;
	}
	
	//模糊查询
	@Override
	public Page<Game> findLikeGameImgName(String gamename, int page, int rows) {
		Game game = new Game();
		game.setGamename(gamename);
		// 当前页
		game.setStart((page - 1) * rows);
		// 每页数
		game.setRows(rows);
		// 查询列表
		List<Game> findLikeGameImgName = gd.findLikeGameImgName(game);
		// 查询列表总记录数
		int count = gd.selectLikeGameCount(game);
		// 创建Page返回对象
		Page<Game> result = new Page<>();
		result.setPage(page);
		result.setRows(findLikeGameImgName);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

}
