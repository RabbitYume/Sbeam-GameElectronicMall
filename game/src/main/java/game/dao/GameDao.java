package game.dao;

import java.util.List;

import game.entity.Game;
import game.entity.Supplier;
import game.entity.Type;

public interface GameDao {
	public void insertGame(Game game);
	public void deleteGame(int id);
	public void updateGame(Game game);
	
	public List<Game> findAllGame(Game game);
	public int selectGameCount(Game game);
	
	public Game findByGameName(String gamename);
	
	public List<Game> findLikeGameName(Game game);
	public int selectLikeGameCount(Game game);
	
	public List<Supplier> findByGameSupplierList();
	
	public List<Type> findByGameTypeList();
	public List<Game> findByGameType(Game game);
	public int selectByGameType(Game game);
	
	public List<Game> findGamePriceBetween(Game game);
	public int selectGamePriceBetween(Game game);
	
	public List<Game> findGamePriceH2L(Game game);
	public List<Game> findGamePriceL2H(Game game);
	
	//图片
	public void insertGameimg(Game game);
	public void updateGameimg(Game game);
	public void deleteGameimg(int id);
	public List<Game> findAllGameImg(Game game);
	public int selectGameImgCount(Game game);
	
	public Game findByGameImg(String gamename);
	
	public List<Game> findLikeGameImgName(Game game);
	public int selectLikeGameImgCount(Game game);
}
