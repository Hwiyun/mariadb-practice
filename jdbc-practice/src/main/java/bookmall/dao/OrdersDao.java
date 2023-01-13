package bookmall.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bookmall.vo.OrdersVo;

public class OrdersDao {

	public List<OrdersVo> findAll() {
		List<OrdersVo> result = new ArrayList<>();
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			
			String sql ="select o.order_no, u.name, u.email, o.price, o.address"
					+ " from orders o"
					+ " join user u on u.no = o.user_no"
					+ " order by o.no asc";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrdersVo vo = new OrdersVo();
				vo.setOrderNo(rs.getLong(1));
				vo.setName(rs.getString(2));
				vo.setEmail(rs.getString(3));
				vo.setPrice(rs.getInt(4));
				vo.setAddress(rs.getString(5));
				
				result.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}

	public void insert(OrdersVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			String sql = "insert into orders values(null, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, vo.getOrderNo());
			pstmt.setString(2, vo.getName());
			pstmt.setInt(3, vo.getPrice());
			pstmt.setString(4, vo.getAddress());
			pstmt.setLong(5, vo.getUserNo());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String url = "jdbc:mariadb://192.168.10.110:3307/bookmall?charset=utf8";
			conn = DriverManager.getConnection(url, "bookmall", "bookmall");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		}
		
		return conn;
	}
}
