package game.service;

import java.util.List;

import game.common.utils.Page;
import game.entity.User;

public interface IUserService {
	public int insert(User user);
	public void delete(int id);
	public void update(User user);
	public void updatePwd(User user);
	public User login(String username,String userpwd);
	public Page<User> findAll(int page, int rows);
	public User findByName(String username);
	public Page<User> findLikeName(String username,int page, int rows);
}
