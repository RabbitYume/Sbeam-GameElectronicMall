package game.entity;

public class Supplier {
	private int id;
	private String suppliername;
	private int start;
	private int rows;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSuppliername() {
		return suppliername;
	}

	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public Supplier() {
		super();
	}

	public Supplier(int id, String suppliername, int phone) {
		super();
		this.id = id;
		this.suppliername = suppliername;
	}

	public Supplier(int id, String suppliername, int start, int rows) {
		super();
		this.id = id;
		this.suppliername = suppliername;
		this.start = start;
		this.rows = rows;
	}

	@Override
	public String toString() {
		return "Supplier [id=" + id + ", suppliername=" + suppliername + "]";
	}

}
