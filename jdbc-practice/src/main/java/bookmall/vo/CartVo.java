package bookmall.vo;

public class CartVo {
	private long no;
	private int quantity;
	private long bookNo;
	private String bookName;
	private long userNo;
	private int price;
	
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public long getBookNo() {
		return bookNo;
	}
	public void setBookNo(long bookNo) {
		this.bookNo = bookNo;
	}
	public long getUserNo() {
		return userNo;
	}
	public void setUserNo(long userNo) {
		this.userNo = userNo;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "CartVo [no=" + no + ", quantity=" + quantity + ", bookNo=" + bookNo + ", bookName=" + bookName
				+ ", userNo=" + userNo + ", price=" + price + "]";
	}
	
	
}
