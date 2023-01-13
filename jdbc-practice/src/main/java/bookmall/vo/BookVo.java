package bookmall.vo;

public class BookVo {

	private long no;
	private String title;
	private int price;
	private int categoryNo;
	
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	@Override
	public String toString() {
		return "BookVo [no=" + no + ", title=" + title + ", price=" + price + ", categoryNo=" + categoryNo + "]";
	}
	
	
	
}
