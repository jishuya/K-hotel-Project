package Service2;

import java.util.List;

import dao2.NoticeDao;
import domain2.Notice;

public class NoticeService {

	private NoticeDao noticeDao = new NoticeDao();

	public List<Notice> selectAll() {
		return noticeDao.selectAll();
	}

	public void dropTable() {
		noticeDao.dropTable();
	}

	public void delete(int num) {
		noticeDao.delete(num);
	}
}
