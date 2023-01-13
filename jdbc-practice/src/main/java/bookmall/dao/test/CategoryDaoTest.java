package bookmall.dao.test;

import java.util.List;

import bookmall.dao.CategoryDao;
import bookmall.vo.CategoryVo;

public class CategoryDaoTest {

	public static void main(String[] args) {
		//testInsert();
		testFindAll();
	}
	
	public static void testInsert() {
		CategoryVo vo = null;
		CategoryDao dao = new CategoryDao();
		
		vo = new CategoryVo();
		vo.setType("컴퓨터");
		dao.insert(vo);
		
		vo = new CategoryVo();
		vo.setType("자기계발");
		dao.insert(vo);
		
		vo = new CategoryVo();
		vo.setType("소설");
		dao.insert(vo);
		
		

	}

	public static void testFindAll() {
		List<CategoryVo> list = new CategoryDao().findAll();
		for(CategoryVo vo : list) {
			System.out.println("번호:"+vo.getNo()+", 카테고리:"+vo.getType());
		}
	}
}
