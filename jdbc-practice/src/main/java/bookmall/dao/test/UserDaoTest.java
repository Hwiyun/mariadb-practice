package bookmall.dao.test;

import java.util.List;

import bookmall.dao.UserDao;
import bookmall.vo.UserVo;

public class UserDaoTest {

	
	public static void main(String[] args) {
		//testInsert();
		testFindAll();
	}
	
	public static void testInsert() {
		UserVo vo = new UserVo();
		vo.setName("둘리");
		vo.setPhoneNumber("010-1234-5678");
		vo.setEmail("dooly@gmail.com");
		vo.setPassword("1234");
		new UserDao().insert(vo);
		
		vo.setName("또치");
		vo.setPhoneNumber("010-4567-8974");
		vo.setEmail("ddochi@gmail.com");
		vo.setPassword("5678");
		new UserDao().insert(vo);
	}

	public static void testFindAll() {
		List<UserVo> list = new UserDao().findAll();
		for(UserVo vo : list) {
			System.out.println("이름:"+vo.getName()+", 전화번호:"+vo.getPhoneNumber()+", 이메일:"+vo.getEmail()+", 비밀번호:"+vo.getPassword());
		}
	}
}
