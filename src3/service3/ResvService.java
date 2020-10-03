package service3;

import java.util.List;

import dao3.ResvDao;
import domain3.Reservation;

public class ResvService {

	private ResvDao resvDao = new ResvDao();
	private Reservation reservation = new Reservation();

	public List<Reservation> selectAll() {
		return resvDao.selectAll();
	}

	public Reservation selectOneProcessing(String resv_date, int room) {
		return reservation;
	}

	public void createTable() {
		resvDao.createTable();
	}

	public void dropTable() {
		resvDao.dropTable();
	}

	public void insertResv(Reservation reservation) {
		resvDao.insertResv(reservation);
	}

	public void delete(String resv_date, int room) {
		resvDao.delete(resv_date, room);
	}

}
