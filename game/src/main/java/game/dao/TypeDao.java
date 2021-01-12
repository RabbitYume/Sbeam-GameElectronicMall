package game.dao;

import java.util.List;

import game.entity.Type;

public interface TypeDao {
	public void insertType(Type type);
	public void deleteType(int id);
	public void updateType(Type type);
	public List<Type> findAllType(Type type);
	public Type findByTypeName(String type);
	public List<Type> findLikeTypeName(Type type);
	public int selectTypeCount(Type type);
	public int selectLikeTypeCount(Type type);
}
