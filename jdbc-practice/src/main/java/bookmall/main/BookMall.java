package bookmall.main;

import bookmall.dao.test.*;

public class BookMall {

	public static void main(String[] args) {
		
		UserDaoTest.testInsert();
		System.out.println("## 회원리스트");
		UserDaoTest.testFindAll();

		CategoryDaoTest.testInsert();
		System.out.println("## 카테고리");
		CategoryDaoTest.testFindAll();
		
		BookDaoTest.testInsert();
		System.out.println("## 상품");
		BookDaoTest.testFindAll();
		
		CartDaoTest.testInsert();
		System.out.println("## 카트");
		CartDaoTest.testFindAll();
		
		OrdersDaoTest.testInsert();
		System.out.println("## 주문");
		OrdersDaoTest.testFindAll();
		
		OrderbookDaoTest.testInsert();
		System.out.println("## 주문 도서 리스트");
		OrderbookDaoTest.testFindAll();
		
	}
}
