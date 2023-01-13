package bookmall.dao.test;

import java.util.List;

import bookmall.dao.CartDao;
import bookmall.vo.CartVo;

public class CartDaoTest {

	public static void main(String[] args) {
		//testInsert();
		testFindAll();
	}
	
	public static void testInsert() {
		CartVo vo = null;
		CartDao dao = new CartDao();
		
		vo = new CartVo();
		vo.setQuantity(2);
		vo.setBookNo(3);
		vo.setUserNo(1);
		dao.insert(vo);

		vo = new CartVo();
		vo.setQuantity(3);
		vo.setBookNo(2);
		vo.setUserNo(1);
		dao.insert(vo);
	}

	public static void testFindAll() {
		List<CartVo> list = new CartDao().findAll();
		for(CartVo vo : list) {
			System.out.println("도서제목:"+vo.getBookName()+", 수량:"+vo.getQuantity()+", 가격:"+vo.getPrice());
		}
	}
}
