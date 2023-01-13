package bookshop.dao.test;

import java.util.List;

import bookshop.dao.BookDao;
import bookshop.vo.BookVo;

public class BookDaoTest {

	public static void main(String[] args) {
		testInsert();
		testFindAll();
	}

	
	private static void testInsert() {
		BookVo vo = null;
		BookDao dao = new BookDao();
		
		String[] book = {"트와일라잇", "뉴문", "이클립스", "브레이킹던", "아리랑", "젊은그들", "아프니깐 청춘이다", "귀천", "태백산맥", "풀하우스"};
		int[] authorNo = {1,1,1,1,2,3,4,5,2,6};
		
		for(int i=0 ; i<10; i++) {
			vo = new BookVo();
			vo.setTitle(book[i]);
			vo.setAuthorNo(Long.valueOf(authorNo[i]));
			vo.setRent("N");
			dao.insert(vo);
		}
	}
	
	private static void testFindAll() {
		List<BookVo> list = new BookDao().findAll();
		for(BookVo vo : list) {
			System.out.println(vo);
		}
	}

}