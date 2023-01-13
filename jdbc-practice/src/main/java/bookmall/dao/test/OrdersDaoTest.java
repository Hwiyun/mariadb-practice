package bookmall.dao.test;

import java.util.List;

import bookmall.dao.OrdersDao;
import bookmall.vo.OrdersVo;

public class OrdersDaoTest {

	public static void main(String[] args) {
		//testInsert();
		testFindAll();
	}
	
	public static void testInsert() {
		OrdersVo vo = null;
		OrdersDao dao = new OrdersDao();
		
		vo = new OrdersVo();
		vo.setOrderNo(1);
		vo.setName("불편한편의점");
		vo.setPrice(130000);
		vo.setAddress("부산광역시");
		vo.setUserNo(1L);
		dao.insert(vo);
	}

	public static void testFindAll() {
		List<OrdersVo> list = new OrdersDao().findAll();
		for(OrdersVo vo : list) {
			System.out.println("주문번호:"+vo.getOrderNo()+", 이름:"+vo.getName()+", 이메일:"+vo.getEmail()
			+", 결제금액:"+vo.getPrice()+" , 배송지:"+vo.getAddress());
		}
	}
}
