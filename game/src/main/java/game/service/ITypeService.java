package game.service;

import game.common.utils.Page;
import game.entity.Type;

public interface ITypeService {
	public void insertType(Type type);
	public void deleteType(int id);
	public void updateType(Type type);
	public Page<Type> findAllType(int page, int rows);
	public Type findByTypeName(String type);
	public Page<Type> findLikeTypeName(String type,int page, int rows);
}
