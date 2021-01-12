package game.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import game.entity.User;

public interface UserDao {
	public int insert(User user);
	public void delete(int id);
	public void update(User user);
	public void updatePwd(User user);
	public User login(@Param("username") String username,@Param("userpwd") String userpwd);
	public List<User> findAll(User user);
	public User findByName(String username);
	public List<User> findLikeName(User user);
	public int selectUserCount(User user);
	public int selectLikeUserCount(User user);
}
