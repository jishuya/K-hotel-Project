package dao3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import domain3.Reservation;

public class ResvDao {
	static List<Reservation> resvList = new ArrayList<>();
	Reservation reservation;

	public static final String NAME = "name";
	public static final String DATE = "resv_date";
	public static final String ROOM = "room";
	public static final String ADDRESS = "address";
	public static final String PHONE = "phone_num";
	public static final String IN_NAME = "in_name";
	public static final String COMMENT = "comment";
	public static final String WRITE_DATE = "write_date";
	public static final String PROCESSING = "processing";

	private static Connection con = ResvConnection.getInstance();
	private static PreparedStatement pstmt = null;
	private static ResultSet result = null;

	public void createTable() {
		try {
			pstmt = con.prepareStatement("create table resvTable(name varchar(20), resv_date date, room int,"
					+ "address varchar(100), phone_num varchar(20), in_name varchar(20)," + "comment text, write_date date," + "processing int)"
					+ "DEFAULT CHARSET=utf8");
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

	public void insertResv(Reservation reservation) {
		try {
			pstmt = con.prepareStatement("INSERT INTO resvTable(" + "name, resv_date, room, address, phone_num,"
					+ "in_name, comment, write_date, processing)" + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");
			pstmt.setString(1, reservation.getName());
			pstmt.setString(2, reservation.getDate());
			pstmt.setInt(3, reservation.getRoom());
			pstmt.setString(4, reservation.getAddress());
			pstmt.setString(5, reservation.getPhone_num());
			pstmt.setString(6, reservation.getIn_name());
			pstmt.setString(7, reservation.getComment());
			pstmt.setString(8, reservation.getWrite_date());
			pstmt.setInt(9, reservation.getProcessing());
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

	public void dropTable() {
		try {
			pstmt = con.prepareStatement("DROP TABLE resvTable;");
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

	public Reservation selectOne(String date, int room) {
		Reservation reservation2 = new Reservation("예약전", date, room, "", "", "", "", "", 0);

		try {
			pstmt = con.prepareStatement("SELECT * FROM resvTable WHERE resv_date = ? and room = ?;");
			pstmt.setString(1, date);
			pstmt.setInt(2, room);
			result = pstmt.executeQuery();

			while (result.next()) {
				reservation2 = new Reservation(result.getString(NAME), result.getString(DATE), result.getInt(ROOM), result.getString(ADDRESS),
						result.getString(PHONE), result.getString(IN_NAME), result.getString(COMMENT), result.getString(WRITE_DATE),
						result.getInt(PROCESSING));
			}

			if (reservation2 == null || reservation2.getName().length() == 0) {
				reservation = new Reservation("예약전", date, room, "", "", "", "", "", 0);
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
		return reservation2;
	}

	public List<Reservation> selectAll() {
		try {
			pstmt = con.prepareStatement("SELECT * FROM resvTable;");
			result = pstmt.executeQuery();

			while (result.next()) {
				resvList.add(new Reservation(result.getString(NAME), result.getString(DATE), result.getInt(ROOM), result.getString(ADDRESS),
						result.getString(PHONE), result.getString(IN_NAME), result.getString(COMMENT), result.getString(WRITE_DATE),
						result.getInt(PROCESSING)));
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
		return resvList;
	}

	public void update(Reservation notice, String preDate, String preRoom) {
		try {
			pstmt = con.prepareStatement(
					"UPDATE resvTable SET name = ?, resv_date = ?, room = ?, address = ?, phone_num = ?, in_name = ?, comment = ?, writw_date = ? WHERE resv_date = ? and room = ?;");
			pstmt.setString(1, reservation.getName());
			pstmt.setString(2, reservation.getDate());
			pstmt.setInt(3, reservation.getRoom());
			pstmt.setString(4, reservation.getAddress());
			pstmt.setString(5, reservation.getPhone_num());
			pstmt.setString(6, reservation.getIn_name());
			pstmt.setString(7, reservation.getComment());
			pstmt.setString(8, reservation.getWrite_date());
			pstmt.setString(9, preDate);
			pstmt.setString(10, preRoom);
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

	public void delete(String resv_date, int room) {
		try {
			pstmt = con.prepareStatement("DELETE FROM resvTable WHERE room = ? and resv_date = ?;");
			pstmt.setInt(1, room);
			pstmt.setString(2, resv_date);
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

	public void delete(int room, int processing) {
		try {
			pstmt = con.prepareStatement("DELETE FROM resvTable WHERE room = ? and processing = ?;");
			pstmt.setInt(1, room);
			pstmt.setInt(2, processing);
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