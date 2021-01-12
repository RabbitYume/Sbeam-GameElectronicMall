package game.entity;

import org.springframework.web.multipart.MultipartFile;

public class Game {
	private int id;
	private String gamename;
	private double price;
	private int supplierid;
	private int typeid;
	private int start;
	private int rows;
	private int low;
	private int hight;
	private String suppliername;
	private String type;
	private String imgurl;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGamename() {
		return gamename;
	}

	public void setGamename(String gamename) {
		this.gamename = gamename;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getSupplierid() {
		return supplierid;
	}

	public void setSupplierid(int supplierid) {
		this.supplierid = supplierid;
	}

	public Game() {
		super();
	}

	public int getTypeid() {
		return typeid;
	}

	public void setTypeid(int typeid) {
		this.typeid = typeid;
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

	public int getLow() {
		return low;
	}

	public void setLow(int low) {
		this.low = low;
	}

	public int getHight() {
		return hight;
	}

	public void setHight(int hight) {
		this.hight = hight;
	}
	public String getSuppliername() {
		return suppliername;
	}

	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public Game(int id, String gamename, double price, int supplierid, int typeid) {
		super();
		this.id = id;
		this.gamename = gamename;
		this.price = price;
		this.supplierid = supplierid;
		this.typeid = typeid;
	}

	public Game(int id, String gamename, double price, int supplierid, int typeid, int start, int rows, int low,
			int hight) {
		super();
		this.id = id;
		this.gamename = gamename;
		this.price = price;
		this.supplierid = supplierid;
		this.typeid = typeid;
		this.start = start;
		this.rows = rows;
		this.low = low;
		this.hight = hight;
	}
	public Game(int id, String gamename, double price, int supplierid, int typeid, int start, int rows, int low,
			int hight, String suppliername, String type) {
		super();
		this.id = id;
		this.gamename = gamename;
		this.price = price;
		this.supplierid = supplierid;
		this.typeid = typeid;
		this.start = start;
		this.rows = rows;
		this.low = low;
		this.hight = hight;
		this.suppliername = suppliername;
		this.type = type;
	}

	public Game(int id, String gamename, double price, int supplierid, int typeid, int start, int rows, int low,
			int hight, String suppliername, String type, String imgurl) {
		super();
		this.id = id;
		this.gamename = gamename;
		this.price = price;
		this.supplierid = supplierid;
		this.typeid = typeid;
		this.start = start;
		this.rows = rows;
		this.low = low;
		this.hight = hight;
		this.suppliername = suppliername;
		this.type = type;
		this.imgurl = imgurl;
	}

	@Override
	public String toString() {
		return "Game [id=" + id + ", gamename=" + gamename + ", price=" + price + ", supplierid=" + supplierid
				+ ", typeid=" + typeid + "]";
	}

}
