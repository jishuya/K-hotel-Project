package domain2;

public class Notice {
	private int no;
	private int grp;
	private int grpOrder;
	private int layer;
	private int parent;
	private String title;
	private String date;
	private String content;

	public Notice() {
		super();
	}

	public Notice(int no, String title, String date, String content) {
		super();
		this.no = no;
		this.title = title;
		this.date = date;
		this.content = content;
	}

	public Notice(int grp, int grpOrder, int layer, int parent, String title, String date, String content) {
		super();
		this.grp = grp;
		this.grpOrder = grpOrder;
		this.layer = layer;
		this.parent = parent;
		this.title = title;
		this.date = date;
		this.content = content;
	}

	public Notice(int no, int grp, int grpOrder, int layer, int parent, String title, String date, String content) {
		super();
		this.no = no;
		this.grp = grp;
		this.grpOrder = grpOrder;
		this.layer = layer;
		this.parent = parent;
		this.title = title;
		this.date = date;
		this.content = content;
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

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
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

}
