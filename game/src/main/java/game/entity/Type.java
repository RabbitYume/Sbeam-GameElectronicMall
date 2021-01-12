package game.entity;

public class Type {
	private int id;
	private String type;
	private int start;
	private int rows;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public Type() {
		super();
	}

	public Type(int id, String type, int start, int rows) {
		super();
		this.id = id;
		this.type = type;
		this.start = start;
		this.rows = rows;
	}

	public Type(int id, String type) {
		super();
		this.id = id;
		this.type = type;
	}

	@Override
	public String toString() {
		return "Type [id=" + id + ", type=" + type + "]";
	}

}
