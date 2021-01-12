package game.dao;

import java.util.List;

import game.entity.Shopcar;

public interface ShopCarDao {
	public void insertShopcar(Shopcar shopcar);
	public void deleteShopcar(int id);
	public void deleteShopcarAll(String username);
	public List<Shopcar> findAllShopcar(String username);
	public double selectSumPrice(String username);
	public Shopcar selectGame(Shopcar shopcar);
}
