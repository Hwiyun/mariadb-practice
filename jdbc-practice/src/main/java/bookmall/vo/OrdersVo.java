package bookmall.vo;

public class OrdersVo {

	private long no;
	private long orderNo;
	private String name;
	private String email;
	private int price;
	private String address;
	private long userNo;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setUserNo(long userNo) {
		this.userNo = userNo;
	}
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public long getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(long orderNo) {
		this.orderNo = orderNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	@Override
	public String toString() {
		return "OrdersVo [no=" + no + ", orderNo=" + orderNo + ", name=" + name + ", email=" + email + ", price="
				+ price + ", address=" + address + ", userNo=" + userNo + "]";
	}
}
