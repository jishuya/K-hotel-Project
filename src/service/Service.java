package service;

import java.util.List;

import dao.BoardDao;
import domain.Board;

public class Service {

	private BoardDao boardDao = new BoardDao();

//	public void insert(Board board) {
//		boardDao.insert(board);
//	}

//	public Candidate selectOne(String name) {
//		return boardDao.selectOne(name);
//	}

	public List<Board> selectAll() {
		return boardDao.selectAll();
	}

//	public void update(Board board) {
//		boardDao.update(board);
//	}

	public void dropTable() {
		boardDao.dropTable();
	}

	public void delete(int num) {
		boardDao.delete(num);
	}
}
