package bookmall.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bookmall.vo.OrderbookVo;

public class OrderbookDao {

	public List<OrderbookVo> findAll() {
		List<OrderbookVo> result = new ArrayList<>();
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			
			String sql ="select ob.book_no, b.title, ob.quantity"
					+ " from order_book ob"
					+ " join book b on ob.book_no = b.no"
					+ " order by ob.no asc";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderbookVo vo = new OrderbookVo();
				vo.setBookNo(rs.getLong(1));
				vo.setBookName(rs.getString(2));
				vo.setQuantity(rs.getInt(3));
				
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

	public void insert(OrderbookVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			String sql = "insert into order_book values(null, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getQuantity());
			pstmt.setLong(2, vo.getOrdersNo());
			pstmt.setLong(3, vo.getBookNo());
			
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
