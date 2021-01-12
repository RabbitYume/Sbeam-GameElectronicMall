package game.entity;

public class Shopcar {
	private int id;
	private int gameid;
	private double gameprice;
	private String username;
	private String gamename;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getGameid() {
		return gameid;
	}

	public void setGameid(int gameid) {
		this.gameid = gameid;
	}

	public double getGameprice() {
		return gameprice;
	}

	public void setGameprice(double gameprice) {
		this.gameprice = gameprice;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getGamename() {
		return gamename;
	}

	public void setGamename(String gamename) {
		this.gamename = gamename;
	}

	public Shopcar() {
		super();
	}

	public Shopcar(int id, int gameid, double gameprice, String username) {
		super();
		this.id = id;
		this.gameid = gameid;
		this.gameprice = gameprice;
		this.username = username;
	}

	public Shopcar(int id, int gameid, double gameprice, String username, String gamename) {
		super();
		this.id = id;
		this.gameid = gameid;
		this.gameprice = gameprice;
		this.username = username;
		this.gamename = gamename;
	}

	@Override
	public String toString() {
		return "Shopcar [id=" + id + ", gameid=" + gameid + ", gameprice=" + gameprice + ", username=" + username + "]";
	}

}
