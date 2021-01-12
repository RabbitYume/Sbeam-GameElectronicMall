package game.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mchange.lang.StringUtils;

import game.common.utils.Page;
import game.dao.UserDao;
import game.entity.User;
import game.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private UserDao ud;

	// 添加
	@Override
	public int insert(User user) {
		return ud.insert(user);
	}

	// 删除
	@Override
	public void delete(int id) {
		ud.delete(id);
	}

	// 修改
	@Override
	public void update(User user) {
		ud.update(user);
	}

	// 修改密码
	@Override
	public void updatePwd(User user) {
		ud.updatePwd(user);
	}

	// 登录
	@Override
	public User login(String username, String userpwd) {
		User user = ud.login(username, userpwd);
		return user;
	}

	// 用户列表
	@Override
	public Page<User> findAll(int page, int rows) {
		User user = new User();
		// 当前页
		user.setStart((page - 1) * rows);
		// 每页数
		user.setRows(rows);
		// 查询列表
		List<User> findAll = ud.findAll(user);
		// 查询列表总记录数
		int count = ud.selectUserCount(user);
		// 创建Page返回对象
		Page<User> result = new Page<>();
		result.setPage(page);
		result.setRows(findAll);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	// 查询用户名
	@Override
	public User findByName(String username) {
		User findByName = ud.findByName(username);
		return findByName;
	}

	// 用户名模糊查询
	@Override
	public Page<User> findLikeName(String username, int page, int rows) {
		User user = new User();
		user.setUsername(username);
		// 当前页
		user.setStart((page - 1) * rows);
		// 每页数
		user.setRows(rows);
		// 查询列表
		List<User> findLikeName = ud.findLikeName(user);
		// 查询列表总记录数
		int count = ud.selectLikeUserCount(user);
		// 创建Page返回对象
		Page<User> result = new Page<>();
		result.setPage(page);
		result.setRows(findLikeName);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

}
