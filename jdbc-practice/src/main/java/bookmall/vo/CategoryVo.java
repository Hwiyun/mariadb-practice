package bookmall.vo;

public class CategoryVo {

	private long no;
	private String type;
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		return "CategoryVo [no=" + no + ", type=" + type + "]";
	}
	
}
