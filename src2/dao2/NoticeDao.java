package dao2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import domain2.Notice;

public class NoticeDao {
	static List<Notice> noticeList = new ArrayList<>();
	static Notice notice;

	public static final String NO = "no";
	public static final String GRP = "no_grp";
	public static final String GRP_ORDER = "no_grp_order";
	public static final String LAYER = "layer";
	public static final String PARENT = "parent";
	public static final String TITLE = "title";
	public static final String DATE = "date";
	public static final String CONTENT = "content";

	private static Connection con = NoticeConnection.getInstance();
	private static PreparedStatement pstmt = null;
	private static ResultSet result = null;

	public void createTable() {
		try {
			pstmt = con.prepareStatement("CREATE TABLE boardTable2(no int primary key not null auto_increment, "
					+ "no_grp int, no_grp_order int, layer int, parent int," + "title varchar(30), date varchar(20), content varchar(500));");
			pstmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
	}

	public void insertBoard(Notice notice) {
		try {
			pstmt = con.prepareStatement("INSERT INTO boardTable2(" + GRP + "," + GRP_ORDER + "," + LAYER + "," + PARENT + "," + TITLE + "," + DATE
					+ "," + CONTENT + ")" + "VALUES (?, ?, ?, ?, ?, ?, ?);");
			pstmt.setInt(1, notice.getNo());
			pstmt.setInt(2, 0);
			pstmt.setInt(3, 1);
			pstmt.setInt(4, 0);
			pstmt.setString(5, notice.getTitle());
			pstmt.setString(6, notice.getDate());
			pstmt.setString(7, notice.getContent());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
	}

	public void insertReply(Notice notice) {
		try {
			pstmt = con.prepareStatement("INSERT INTO boardTable2(" + GRP + "," + GRP_ORDER + "," + LAYER + "," + PARENT + "," + TITLE + "," + DATE
					+ "," + CONTENT + ")" + "VALUES (?, ?, ?, ?, ?, ?, ?);");
			pstmt.setInt(1, notice.getGrp());
			pstmt.setInt(2, notice.getGrpOrder());
			pstmt.setInt(3, notice.getLayer());
			pstmt.setInt(4, notice.getParent());
			pstmt.setString(5, notice.getTitle());
			pstmt.setString(6, notice.getDate());
			pstmt.setString(7, notice.getContent());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
	}

	public void updateReply(Notice notice) {
		try {
			pstmt = con.prepareStatement("UPDATE boardTable2 SET no_grp_order = no_grp_order + 1 WHERE no_grp = ? && no_grp_order >= ?;");
			pstmt.setInt(1, notice.getGrp());
			pstmt.setInt(2, notice.getGrpOrder());
			pstmt.execute();
			pstmt = con.prepareStatement("UPDATE boardTable2 SET no_grp_order = no_grp_order - 1 WHERE no = ?;");
			pstmt.setInt(1, notice.getNo());
			pstmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
	}

	public List<Notice> orderByTable() {
		try {
			pstmt = con.prepareStatement("SELECT * FROM boardTable2 ORDER BY no_grp asc, no_grp_order desc, layer desc;");
			result = pstmt.executeQuery();

			while (result.next()) {
				noticeList.add(new Notice(result.getInt(NO), result.getInt(GRP), result.getInt(GRP_ORDER), result.getInt(LAYER),
						result.getInt(PARENT), result.getString(TITLE), result.getString(DATE), result.getString(CONTENT)));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
		return noticeList;
	}

	public List<Notice> orderByTableFind(String search, String findThis) {
		try {
			pstmt = con.prepareStatement(
					"SELECT * FROM boardTable2 WHERE " + search + " like '%" + findThis + "%' ORDER BY no_grp asc, no_grp_order desc, layer desc;");
			result = pstmt.executeQuery();

			while (result.next()) {
				noticeList.add(new Notice(result.getInt(NO), result.getInt(GRP), result.getInt(GRP_ORDER), result.getInt(LAYER),
						result.getInt(PARENT), result.getString(TITLE), result.getString(DATE), result.getString(CONTENT)));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
		return noticeList;
	}

	public List<Notice> disOrderByTable() {
		try {
			pstmt = con.prepareStatement("SELECT * FROM boardTable2 ORDER BY no_grp desc, no_grp_order asc, layer asc;");
			result = pstmt.executeQuery();

			while (result.next()) {
				noticeList.add(new Notice(result.getInt(NO), result.getInt(GRP), result.getInt(GRP_ORDER), result.getInt(LAYER),
						result.getInt(PARENT), result.getString(TITLE), result.getString(DATE), result.getString(CONTENT)));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
		return noticeList;
	}

	public List<Notice> disOrderByTableFind(String search, String findThis) {
		try {
			pstmt = con.prepareStatement(
					"SELECT * FROM boardTable2 WHERE " + search + " like '%" + findThis + "%' ORDER BY no_grp desc, no_grp_order asc, layer asc;");
			result = pstmt.executeQuery();

			while (result.next()) {
				noticeList.add(new Notice(result.getInt(NO), result.getInt(GRP), result.getInt(GRP_ORDER), result.getInt(LAYER),
						result.getInt(PARENT), result.getString(TITLE), result.getString(DATE), result.getString(CONTENT)));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
		return noticeList;
	}

	public void dropTable() {
		try {
			pstmt = con.prepareStatement("DROP TABLE boardTable2;");
			pstmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
	}

	public Notice selectOne(int no) {
		try {
			pstmt = con.prepareStatement("SELECT * FROM boardTable2 WHERE no = ?;");
			pstmt.setInt(1, no);
			result = pstmt.executeQuery();

			while (result.next()) {
				notice = new Notice(result.getInt(NO), result.getInt(GRP), result.getInt(GRP_ORDER), result.getInt(LAYER), result.getInt(PARENT),
						result.getString(TITLE), result.getString(DATE), result.getString(CONTENT));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (result != null)
				try {
					result.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
		return notice;
	}

	public List<Notice> selectAll() {
		try {
			pstmt = con.prepareStatement("SELECT * FROM boardTable2;");
			result = pstmt.executeQuery();

			while (result.next()) {
				noticeList.add(new Notice(result.getInt(NO), result.getInt(GRP), result.getInt(GRP_ORDER), result.getInt(LAYER),
						result.getInt(PARENT), result.getString(TITLE), result.getString(DATE), result.getString(CONTENT)));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (result != null)
				try {
					result.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
		return noticeList;
	}

	public void update(Notice notice) {
		try {
			pstmt = con.prepareStatement("UPDATE boardTable2 SET title = ?, date = ?, content = ? WHERE no = ?;");
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getDate());
			pstmt.setString(3, notice.getContent());
			pstmt.setInt(4, notice.getNo());
			pstmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
	}

	public void delete(int no) {
		try {
			pstmt = con.prepareStatement("DELETE FROM boardTable2 WHERE no = ?;");
			pstmt.setInt(1, no);
			pstmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
	}

	public void delete(int no, int no_grp, int layer) {
		try {
			pstmt = con.prepareStatement("DELETE FROM boardTable2 WHERE no = ?;");
			pstmt.setInt(1, no);
			pstmt.execute();
			pstmt = con.prepareStatement("DELETE FROM boardTable2 WHERE no_grp = ? && layer > ?;");
			pstmt.setInt(1, no_grp);
			pstmt.setInt(2, layer);
			pstmt.execute();
			pstmt = con.prepareStatement("SET @cnt = 0;");
			pstmt.execute();
			pstmt = con.prepareStatement("UPDATE boardTable2 set boardTable2.no = @cnt:=@cnt+1;");
			pstmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
	}

	public void alterTable(int size) {
		try {
			pstmt = con.prepareStatement("SET @cnt = 0;");
			pstmt.execute();
			pstmt = con.prepareStatement("UPDATE boardTable2 set boardTable2.no = @cnt:=@cnt+1;");
			pstmt.execute();

			pstmt = con.prepareStatement("ALTER TABLE boardTable2 auto_increment = ?;");
			pstmt.setInt(1, size);
			pstmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
	}
}