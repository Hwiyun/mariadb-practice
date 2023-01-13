package bookshop.vo;

public class BookVo {
	private long no;
	private String title;
	private String rent;
	private long authorNo;
	
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getRent() {
		return rent;
	}
	private String authorName;
	
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
	public String isRent() {
		return rent;
	}
	public void setRent(String rent) {
		this.rent = rent;
	}
	public long getAuthorNo() {
		return authorNo;
	}
	public void setAuthorNo(long authorNo) {
		this.authorNo = authorNo;
	}
	@Override
	public String toString() {
		return "BookVo [no=" + no + ", title=" + title + ", rent=" + rent + ", authorNo=" + authorNo + "]";
	}
	
	
}
