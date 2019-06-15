package util;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.Properties;
/*连接池:获取链接对象,然后归还链接对象*/
//Druid连接池工具
public class JDBCUtil {
    private static DataSource ds;  //定义成员变量DataSource
    static{
        try {
            Properties pro = new Properties();
            InputStream is = JDBCUtil.class.getResourceAsStream("../properties/druid.properties");  //获取配置文件字节流
            pro.load(is);
            ds = DruidDataSourceFactory.createDataSource(pro);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //获取链接的方法
    public static Connection getConnection() throws SQLException {  //警告别人异常可能发生 抛出异常
        return ds.getConnection();  //获取一个连接对象
    }
    //释放资源
    public static void close(Statement statement,Connection connection){
        if(statement!=null){  //期望关闭方法特别的简单,抓取异常
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close(); //归还连接
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        //简化的写法 两种方法使用一个就好
//        close(null, statement, connection);
    }
    public static void close(ResultSet resultSet , Statement statement , Connection connection){
        if(resultSet!=null){  //期望关闭方法特别的简单,抓取异常
            try {
                resultSet .close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(statement!=null){  //期望关闭方法特别的简单,抓取异常
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close(); //归还连接
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    //获取连接池方法
    public static  DataSource getDataSource(){
        return ds;
    }
}
