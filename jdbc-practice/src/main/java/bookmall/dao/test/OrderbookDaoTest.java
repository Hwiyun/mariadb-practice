package bookmall.dao.test;

import java.util.List;

import bookmall.dao.OrderbookDao;
import bookmall.vo.OrderbookVo;

public class OrderbookDaoTest {

	public static void main(String[] args) {
		//testInsert();
		testFindAll();
	}
	
	public static void testInsert() {
		OrderbookVo vo = null;
		OrderbookDao dao = new OrderbookDao();
		
		vo = new OrderbookVo();
		vo.setQuantity(2);
		vo.setOrdersNo(1);
		vo.setBookNo(3);
		dao.insert(vo);

		vo = new OrderbookVo();
		vo.setQuantity(3);
		vo.setOrdersNo(1);
		vo.setBookNo(2);
		dao.insert(vo);
	}

	public static void testFindAll() {
		List<OrderbookVo> list = new OrderbookDao().findAll();
		for(OrderbookVo vo : list) {
			System.out.println("도서번호:"+vo.getBookNo()+", 제목:"+vo.getBookName()+", 수량:"+vo.getQuantity());
		}
	}
}
