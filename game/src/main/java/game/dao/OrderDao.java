package game.dao;

import java.util.List;

import game.entity.Order;

public interface OrderDao {
	public void deleteOrder(int orderid);
	public void deleteOneOrder(int id);
	public void updateOrder(Order order);
	public void updateOrderPay(Order order);
	
	public List<Order> findAllOrder(Order order);
	public int selectOrderCount(Order order);
	
	public List<Order> output();
	
	public List<Order> findLikeOrderid(Order order);
	public int selectLikeOrderCount(Order order);
	
	//用户查询
	public List<Order> userfindAllOrder(Order order);
	public int userselectOrderCount(Order order);
	public String userselectOrderPay(int orderid);
	public String userselectOrderTime(int orderid);
	public Double userselectOrderSumPay(int orderid);
	public List<Order> userfindOrderid(int orderid);
	
	public void insertOrder(Order order);
	public void insertKey(Order order);
}
