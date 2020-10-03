package domain;

public class Board {
	private int no;
	private int grp;
	private int grpOrder;
	private int layer;
	private String writer;
	private String title;
	private String date;
	private String content;
	private int count;

	public Board() {
		super();
	}

	public Board(int no, String writer, String title, String date, String content) {
		super();
		this.no = no;
		this.writer = writer;
		this.title = title;
		this.date = date;
		this.content = content;
	}

	public Board(int grp, int grpOrder, int layer, String writer, String title, String date, String content, int count) {
		super();
		this.grp = grp;
		this.grpOrder = grpOrder;
		this.layer = layer;
		this.writer = writer;
		this.title = title;
		this.date = date;
		this.content = content;
		this.count = count;
	}

	public Board(int no, int grp, int grpOrder, int layer, String writer, String title, String date, String content, int count) {
		super();
		this.no = no;
		this.grp = grp;
		this.grpOrder = grpOrder;
		this.layer = layer;
		this.writer = writer;
		this.title = title;
		this.date = date;
		this.content = content;
		this.count = count;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getGrp() {
		return grp;
	}

	public void setGrp(int grp) {
		this.grp = grp;
	}

	public int getGrpOrder() {
		return grpOrder;
	}

	public void setGrpOrder(int grpOrder) {
		this.grpOrder = grpOrder;
	}

	public int getLayer() {
		return layer;
	}

	public void setLayer(int layer) {
		this.layer = layer;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
