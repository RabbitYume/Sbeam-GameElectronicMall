package game.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.common.utils.Page;
import game.dao.SupplierDao;
import game.entity.Supplier;
import game.service.ISupplierService;

@Service
public class SupplierServiceImpl implements ISupplierService {

	@Autowired
	private SupplierDao sd;

	// 添加
	@Override
	public void insertSupplier(Supplier supplier) {
		sd.insertSupplier(supplier);
	}

	// 删除
	@Override
	public void deleteSupplier(int id) {
		sd.deleteSupplier(id);
	}

	// 修改
	@Override
	public void updateSupplier(Supplier supplier) {
		sd.updateSupplier(supplier);
	}

	// 查询全部
	@Override
	public Page<Supplier> findAllSupplier(int page, int rows) {
		Supplier supplier = new Supplier();
		// 当前页
		supplier.setStart((page - 1) * rows);
		// 每页数
		supplier.setRows(rows);
		// 查询列表
		List<Supplier> findAll = sd.findAllSupplier(supplier);
		// 查询列表总记录数
		int count = sd.selectSupplierCount(supplier);
		// 创建Page返回对象
		Page<Supplier> result = new Page<>();
		result.setPage(page);
		result.setRows(findAll);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	// 根据名字查找
	@Override
	public Supplier findBySupplierName(String suppliername) {
		Supplier findByName = sd.findBySupplierName(suppliername);
		return findByName;
	}

	// 模糊查询
	@Override
	public Page<Supplier> findLikeSupplierName(String suppliername, int page, int rows) {
		Supplier supplier = new Supplier();
		supplier.setSuppliername(suppliername);
		// 当前页
		supplier.setStart((page - 1) * rows);
		// 每页数
		supplier.setRows(rows);
		// 查询列表
		List<Supplier> findLikeName = sd.findLikeSupplierName(supplier);
		// 查询列表总记录数
		int count = sd.selectLikeSupplierCount(supplier);
		// 创建Page返回对象
		Page<Supplier> result = new Page<>();
		result.setPage(page);
		result.setRows(findLikeName);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

}
