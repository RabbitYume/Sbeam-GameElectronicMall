package game.entity;

public class Order {
	private int id;
	private int orderid;
	private int gameid;
	private double price;
	private String time;
	private String pay;
	private String username;
	private int start;
	private int rows;
	private String gamename;
	private String gamekey;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public int getGameid() {
		return gameid;
	}

	public void setGameid(int gameid) {
		this.gameid = gameid;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getGamename() {
		return gamename;
	}

	public void setGamename(String gamename) {
		this.gamename = gamename;
	}

	

	public String getGamekey() {
		return gamekey;
	}

	public void setGamekey(String gamekey) {
		this.gamekey = gamekey;
	}

	public Order() {
		super();
	}



	public Order(int id, int orderid, int gameid, double price, String time, String pay, String username, int start,
			int rows, String gamename, String gamekey) {
		super();
		this.id = id;
		this.orderid = orderid;
		this.gameid = gameid;
		this.price = price;
		this.time = time;
		this.pay = pay;
		this.username = username;
		this.start = start;
		this.rows = rows;
		this.gamename = gamename;
		this.gamekey = gamekey;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", orderid=" + orderid + ", gameid=" + gameid + ", price=" + price + ", time=" + time
				+ ", pay=" + pay + ", username=" + username + ", start=" + start + ", rows=" + rows + ", gamename="
				+ gamename + ", gamekey=" + gamekey + "]";
	}

}
