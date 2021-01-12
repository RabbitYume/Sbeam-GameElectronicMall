package game.service;

import java.util.List;

import game.common.utils.Page;
import game.entity.Order;

public interface IOrderService {
	public void deleteOrder(int orderid);
	public void deleteOneOrder(int id);
	public void updateOrder(Order order);
	public void updateOrderPay(Order order);

	public Page<Order> findAllOrder(int page, int rows);
	public Page<Order> findLikeOrderid(int orderid, int page, int rows);

	public List<Order> output();

	// 用户查询
	public Page<Order> userfindAllOrder(String username,int page, int rows);
	public List<Order> userfindLikeOrderid(int orderid);
	public String userselectOrderPay(int orderid);
	public String userselectOrderTime(int orderid);
	public Double userselectOrderSumPay(int orderid);
	public List<Order> userfindOrderid(int orderid);
	
	public void insertOrder(Order order);
	public void insertKey(Order order);
}
