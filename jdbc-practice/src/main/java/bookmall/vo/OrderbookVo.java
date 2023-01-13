package bookmall.vo;

public class OrderbookVo {

	private long no;
	private int quantity;
	private long ordersNo;
	private long bookNo;
	private String bookName;
	
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
	public long getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(long ordersNo) {
		this.ordersNo = ordersNo;
	}
	public long getBookNo() {
		return bookNo;
	}
	public void setBookNo(long bookNo) {
		this.bookNo = bookNo;
	}
	@Override
	public String toString() {
		return "OrderbookVo [no=" + no + ", quantity=" + quantity + ", ordersNo=" + ordersNo + ", bookNo=" + bookNo
				+ ", bookName=" + bookName + "]";
	}
	
}
