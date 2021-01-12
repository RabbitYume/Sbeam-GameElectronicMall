package game.service;

import java.util.List;

import game.common.utils.Page;
import game.entity.Game;
import game.entity.Supplier;
import game.entity.Type;

public interface IGameService {
	public void insertGame(Game game);
	public void deleteGame(int id);
	public void updateGame(Game game);

	public Page<Game> findAllGame(int page, int rows);
	public Game findByGameName(String gamename);
	public Page<Game> findLikeGameName(String gamename, int page, int rows);

	public List<Supplier> findByGameSupplierList();
	public List<Type> findByGameTypeList();
	public Page<Game> findByGameType(int typeid, int page, int rows);
	
	public Page<Game> findGamePriceBetween(int low, int hight, int page, int rows);
	public Page<Game> findGamePriceH2L(int page, int rows);
	public Page<Game> findGamePriceL2H(int page, int rows);

	// 图片
	public void insertGameimg(Game game);
	public void updateGameimg(Game game);
	public void deleteGameimg(int id);
	public Page<Game> findAllGameImg(int page, int rows);
	public Game findByGameImg(String gamename);
	public Page<Game> findLikeGameImgName(String gamename, int page, int rows);
}
