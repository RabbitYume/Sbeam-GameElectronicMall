package game.dao;

import java.util.List;

import game.entity.Supplier;
import game.entity.User;

public interface SupplierDao {
	public void insertSupplier(Supplier supplier);
	public void deleteSupplier(int id);
	public void updateSupplier(Supplier supplier);
	public List<Supplier> findAllSupplier(Supplier supplier);
	public Supplier findBySupplierName(String suppliername);
	public List<Supplier> findLikeSupplierName(Supplier supplier);
	public int selectSupplierCount(Supplier supplier);
	public int selectLikeSupplierCount(Supplier supplier);
}
