package pack.business;

public class UserDto {
	int no,point;
	String id,pswd;
	double coupon;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPswd() {
		return pswd;
	}
	public void setPswd(String pswd) {
		this.pswd = pswd;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public double getCoupon() {
		return coupon;
	}
	public void setCoupon(double coupon) {
		this.coupon = coupon;
	}
}
