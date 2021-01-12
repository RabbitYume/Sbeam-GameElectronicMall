package game.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.common.utils.Page;
import game.dao.OrderDao;
import game.entity.Order;
import game.service.IOrderService;

@Service
public class OrderServiceImpl implements IOrderService {

	@Autowired
	private OrderDao od;

	// 删除订单
	@Override
	public void deleteOrder(int orderid) {
		od.deleteOrder(orderid);
	}

	// 删除单条订单
	@Override
	public void deleteOneOrder(int id) {
		od.deleteOneOrder(id);
	}

	// 修改
	@Override
	public void updateOrder(Order order) {
		od.updateOrder(order);
	}

	// 订单列表
	@Override
	public Page<Order> findAllOrder(int page, int rows) {
		Order order = new Order();
		// 当前页
		order.setStart((page - 1) * rows);
		// 每页数
		order.setRows(rows);
		// 查询列表
		List<Order> findAllOrder = od.findAllOrder(order);
		// 查询列表总记录数
		int count = od.selectOrderCount(order);
		// 创建Page返回对象
		Page<Order> result = new Page<>();
		result.setPage(page);
		result.setRows(findAllOrder);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	// 模糊查询
	@Override
	public Page<Order> findLikeOrderid(int orderid, int page, int rows) {
		Order order = new Order();
		order.setOrderid(orderid);
		// 当前页
		order.setStart((page - 1) * rows);
		// 每页数
		order.setRows(rows);
		// 查询列表
		List<Order> findAllOrder = od.findLikeOrderid(order);
		// 查询列表总记录数
		int count = od.selectLikeOrderCount(order);
		// 创建Page返回对象
		Page<Order> result = new Page<>();
		result.setPage(page);
		result.setRows(findAllOrder);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	// 查询所有
	public List<Order> output() {
		List<Order> orders = od.output();
		return orders;
	}

	// 用户查询
	public Page<Order> userfindAllOrder(String username,int page, int rows){
		Order order = new Order();
		order.setUsername(username);
		// 当前页
		order.setStart((page - 1) * rows);
		// 每页数
		order.setRows(rows);
		// 查询列表
		List<Order> userfindAllOrder = od.userfindAllOrder(order);
		// 查询列表总记录数
		int count = od.userselectOrderCount(order);
		// 创建Page返回对象
		Page<Order> result = new Page<>();
		result.setPage(page);
		result.setRows(userfindAllOrder);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}
	
	//用户订单详情
	public List<Order> userfindLikeOrderid(int orderid){
		Order order = new Order();
		order.setOrderid(orderid);
		List<Order> orders = od.findLikeOrderid(order);
		return orders;
	}
	
	//用户支付情况
	public String userselectOrderPay(int orderid) {
		String pay = od.userselectOrderPay(orderid);
		return pay;
	}
	
	//用户下单时间
	public String userselectOrderTime(int orderid) {
		String time = od.userselectOrderTime(orderid);
		return time;
	}
	
	//总金额
	public Double userselectOrderSumPay(int orderid) {
		Double sumpay = od.userselectOrderSumPay(orderid);
		return sumpay;
	}
	
	//订单详情
	public List<Order> userfindOrderid(int orderid){
		List<Order> orders = od.userfindOrderid(orderid);
		return orders;
	}
	
	// 下单
	public void insertOrder(Order order) {
		od.insertOrder(order);
	}
	
	//添加key
	public void insertKey(Order order) {
		od.insertKey(order);
	}
	
	//修改订单状态
	public void updateOrderPay(Order order) {
		od.updateOrderPay(order);
	}
}
