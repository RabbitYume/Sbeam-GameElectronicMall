package game.service;

import game.common.utils.Page;
import game.entity.Supplier;

public interface ISupplierService {
	public void insertSupplier(Supplier supplier);
	public void deleteSupplier(int id);
	public void updateSupplier(Supplier supplier);
	public Page<Supplier> findAllSupplier(int page, int rows);
	public Supplier findBySupplierName(String suppliername);
	public Page<Supplier> findLikeSupplierName(String suppliername,int page, int rows);
}
