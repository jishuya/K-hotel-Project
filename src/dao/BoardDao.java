package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import domain.Board;

public class BoardDao {
	static List<Board> boardList = new ArrayList<>();
	static Board board;

	public static final String NO = "no";
	public static final String GRP = "no_grp";
	public static final String GRP_ORDER = "no_grp_order";
	public static final String LAYER = "layer";
	public static final String WRITER = "writer";
	public static final String TITLE = "title";
	public static final String DATE = "date";
	public static final String CONTENT = "content";
	public static final String COUNT = "count";

	private static Connection con = ConnectionDB.getInstance();
	private static PreparedStatement pstmt = null;
	private static ResultSet result = null;

	public void createTable() {
		try {
			pstmt = con.prepareStatement("CREATE TABLE boardTable3(no int primary key not null auto_increment, "
					+ "no_grp int, no_grp_order int, layer int, writer varchar(100), title varchar(500), date varchar(20), content varchar(5000), count int);");
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

	public void insertBoard(Board board) {
		try {
			pstmt = con.prepareStatement("INSERT INTO boardTable3(" + GRP + "," + GRP_ORDER + "," + LAYER + "," + WRITER + "," + TITLE + "," + DATE
					+ "," + CONTENT + "," + COUNT + ")" + "VALUES (?, ?, ?, ?, ?, ?, ?, ?);");
			pstmt.setInt(1, board.getNo());
			pstmt.setInt(2, 0);
			pstmt.setInt(3, 1);
			pstmt.setString(4, board.getWriter());
			pstmt.setString(5, board.getTitle());
			pstmt.setString(6, board.getDate());
			pstmt.setString(7, board.getContent());
			pstmt.setInt(8, board.getCount());
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

	public void insertReply(Board board) {
		try {
			pstmt = con.prepareStatement("INSERT INTO boardTable3(" + GRP + "," + GRP_ORDER + "," + LAYER + "," + WRITER + "," + TITLE + "," + DATE
					+ "," + CONTENT + "," + COUNT + ")" + "VALUES (?, ?, ?, ?, ?, ?, ?, ?);");
			pstmt.setInt(1, board.getGrp());
			pstmt.setInt(2, board.getGrpOrder());
			pstmt.setInt(3, board.getLayer());
			pstmt.setString(4, board.getWriter());
			pstmt.setString(5, board.getTitle());
			pstmt.setString(6, board.getDate());
			pstmt.setString(7, board.getContent());
			pstmt.setInt(8, board.getCount());
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

	public void updateReply(Board board) {
		try {
			pstmt = con.prepareStatement("UPDATE boardTable3 SET no_grp_order = no_grp_order + 1 WHERE no_grp = ? && no_grp_order >= ?;");
			pstmt.setInt(1, board.getGrp());
			pstmt.setInt(2, board.getGrpOrder());
			pstmt.execute();
			pstmt = con.prepareStatement("UPDATE boardTable3 SET no_grp_order = no_grp_order - 1 WHERE no = ?;");
			pstmt.setInt(1, board.getNo());
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

	public void updateCount(Board board) {
		try {
			pstmt = con.prepareStatement("UPDATE boardTable3 SET count = count + 1 WHERE no = ?;");
			pstmt.setInt(1, board.getNo());
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

	public List<Board> orderByTable() {
		try {
			pstmt = con.prepareStatement("SELECT * FROM boardTable3 ORDER BY no_grp asc, no_grp_order desc, layer desc;");
			result = pstmt.executeQuery();

			while (result.next()) {
				boardList.add(new Board(result.getInt(NO), result.getInt(GRP), result.getInt(GRP_ORDER), result.getInt(LAYER),
						result.getString(WRITER), result.getString(TITLE), result.getString(DATE), result.getString(CONTENT), result.getInt(COUNT)));
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
		return boardList;
	}

	public List<Board> orderByTableFind(String search, String findThis) {
		try {
			pstmt = con.prepareStatement(
					"SELECT * FROM boardTable3 WHERE " + search + " like '%" + findThis + "%' ORDER BY no_grp asc, no_grp_order desc, layer desc;");
			result = pstmt.executeQuery();

			while (result.next()) {
				boardList.add(new Board(result.getInt(NO), result.getInt(GRP), result.getInt(GRP_ORDER), result.getInt(LAYER),
						result.getString(WRITER), result.getString(TITLE), result.getString(DATE), result.getString(CONTENT), result.getInt(COUNT)));
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
		return boardList;
	}

	public List<Board> disOrderByTable() {
		try {
			pstmt = con.prepareStatement("SELECT * FROM boardTable3 ORDER BY no_grp desc, no_grp_order asc, layer asc;");
			result = pstmt.executeQuery();

			while (result.next()) {
				boardList.add(new Board(result.getInt(NO), result.getInt(GRP), result.getInt(GRP_ORDER), result.getInt(LAYER),
						result.getString(WRITER), result.getString(TITLE), result.getString(DATE), result.getString(CONTENT), result.getInt(COUNT)));
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
		return boardList;
	}

	public List<Board> disOrderByTableFind(String search, String findThis) {
		try {
			pstmt = con.prepareStatement(
					"SELECT * FROM boardTable3 WHERE " + search + " like '%" + findThis + "%' ORDER BY no_grp desc, no_grp_order asc, layer asc;");
			result = pstmt.executeQuery();

			while (result.next()) {
				boardList.add(new Board(result.getInt(NO), result.getInt(GRP), result.getInt(GRP_ORDER), result.getInt(LAYER),
						result.getString(WRITER), result.getString(TITLE), result.getString(DATE), result.getString(CONTENT), result.getInt(COUNT)));
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
		return boardList;
	}

	public void dropTable() {
		try {
			pstmt = con.prepareStatement("DROP TABLE boardTable3;");
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

	public Board selectOne(int no) {
		try {
			pstmt = con.prepareStatement("SELECT * FROM boardTable3 WHERE no = ?;");
			pstmt.setInt(1, no);
			result = pstmt.executeQuery();

			while (result.next()) {
				board = new Board(result.getInt(NO), result.getInt(GRP), result.getInt(GRP_ORDER), result.getInt(LAYER), result.getString(WRITER),
						result.getString(TITLE), result.getString(DATE), result.getString(CONTENT), result.getInt(COUNT));
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
		return board;
	}

	public List<Board> selectAll() {
		try {
			pstmt = con.prepareStatement("SELECT * FROM boardTable3;");
			result = pstmt.executeQuery();

			while (result.next()) {
				boardList.add(new Board(result.getInt(NO), result.getInt(GRP), result.getInt(GRP_ORDER), result.getInt(LAYER),
						result.getString(WRITER), result.getString(TITLE), result.getString(DATE), result.getString(CONTENT), result.getInt(COUNT)));
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
		return boardList;
	}

	public void update(Board board) {
		try {
			pstmt = con.prepareStatement("UPDATE boardTable3 SET title = ?, date = ?, content = ?WHERE no = ?;");
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getDate());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, board.getNo());
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
			pstmt = con.prepareStatement("DELETE FROM boardTable3 WHERE no = ?;");
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
			pstmt = con.prepareStatement("DELETE FROM boardTable3 WHERE no = ?;");
			pstmt.setInt(1, no);
			pstmt.execute();
			pstmt = con.prepareStatement("DELETE FROM boardTable3 WHERE no_grp = ? && layer > ?;");
			pstmt.setInt(1, no_grp);
			pstmt.setInt(2, layer);
			pstmt.execute();
			pstmt = con.prepareStatement("SET @cnt = 0;");
			pstmt.execute();
			pstmt = con.prepareStatement("UPDATE boardTable3 set boardTable3.no = @cnt:=@cnt+1;");
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
			pstmt = con.prepareStatement("UPDATE boardTable3 set boardTable3.no = @cnt:=@cnt+1;");
			pstmt.execute();

			pstmt = con.prepareStatement("ALTER TABLE boardTable3 auto_increment = ?;");
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