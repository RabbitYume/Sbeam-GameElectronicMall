package game.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.dao.ShopCarDao;
import game.entity.Shopcar;
import game.service.IShopCarService;

@Service
public class ShopCarServiceImpl implements IShopCarService{
	
	@Autowired
	private ShopCarDao scd;

	//添加
	@Override
	public void insertShopcar(Shopcar shopcar) {
		scd.insertShopcar(shopcar);
	}

	//删除
	@Override
	public void deleteShopcar(int id) {
		scd.deleteShopcar(id);
	}

	//删除全部
	@Override
	public void deleteShopcarAll(String username) {
		scd.deleteShopcarAll(username);
	}

	//查询全部
	@Override
	public List<Shopcar> findAllShopcar(String username) {
		List<Shopcar> shopcars = scd.findAllShopcar(username);
		return shopcars;
	}

	//总金额
	@Override
	public double selectSumPrice(String username) {
		Double sumprice = scd.selectSumPrice(username);
		return sumprice;
	}
	
	//查询购物车是否拥有
	@Override
	public Shopcar selectGame(Shopcar shopcar) {
		Shopcar shopcar1 = scd.selectGame(shopcar);
		return shopcar1;
	}

}
