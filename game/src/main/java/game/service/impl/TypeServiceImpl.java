package game.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.common.utils.Page;
import game.dao.TypeDao;
import game.entity.Type;
import game.service.ITypeService;

@Service
public class TypeServiceImpl implements ITypeService{
	
	@Autowired
	private TypeDao td;

	//添加
	@Override
	public void insertType(Type type) {
		td.insertType(type);
	}

	//删除
	@Override
	public void deleteType(int id) {
		td.deleteType(id);
	}

	//修改
	@Override
	public void updateType(Type type) {
		td.updateType(type);
	}

	//类型列表
	@Override
	public Page<Type> findAllType(int page, int rows) {
		Type type = new Type();
		// 当前页
		type.setStart((page - 1) * rows);
		// 每页数
		type.setRows(rows);
		// 查询列表
		List<Type> findAlltype = td.findAllType(type);
		// 查询列表总记录数
		int count = td.selectTypeCount(type);
		// 创建Page返回对象
		Page<Type> result = new Page<>();
		result.setPage(page);
		result.setRows(findAlltype);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	//根据类型名称查询
	@Override
	public Type findByTypeName(String type) {
		Type findByTypeName = td.findByTypeName(type);
		return findByTypeName;
	}

	//模糊查询
	@Override
	public Page<Type> findLikeTypeName(String type, int page, int rows) {
		Type type1 = new Type();
		type1.setType(type);
		// 当前页
		type1.setStart((page - 1) * rows);
		// 每页数
		type1.setRows(rows);
		// 查询列表
		List<Type> findLikeTypeName = td.findLikeTypeName(type1);
		// 查询列表总记录数
		int count = td.selectLikeTypeCount(type1);
		// 创建Page返回对象
		Page<Type> result = new Page<>();
		result.setPage(page);
		result.setRows(findLikeTypeName);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}
	
}
