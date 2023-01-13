package bookshop.main;

import java.util.List;
import java.util.Scanner;

import bookshop.dao.BookDao;
import bookshop.vo.BookVo;

public class BookShop {

	public static void main(String[] args) {
		displayBookInfo();
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("대여 하고 싶은 책의 번호를 입력하세요:");
		Long no = scanner.nextLong();
		scanner.close();
		
		if (!(new BookDao().findRent(no))) {
			System.out.println("대여중입니다");
			
		} else {
			BookVo vo = new BookVo();
			vo.setNo(no);
			vo.setRent("Y");
			
			new BookDao().update(vo);
		}
		
		
		displayBookInfo();
	}

	private static void displayBookInfo() {
		List<BookVo> list = new BookDao().findAll();
		for (BookVo vo:list) {
			System.out.println(vo.getNo() + "책 제목:" + vo.getTitle() + ", 작가:" + vo.getAuthorName() + ", 대여 유무:" + (vo.getRent().equals("N") ? "재고있음" : "대여중"));
			
		}
	}
}