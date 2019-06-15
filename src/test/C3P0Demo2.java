package test;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ConcurrentModificationException;

public class C3P0Demo2 {
    public static void main(String[] args) throws SQLException {
        //获取datasource
        DataSource ds = new ComboPooledDataSource();
        //获取链接
        for (int i = 1; i <= 10; i++) {
            Connection connection = ds.getConnection();
            System.out.println(i+":"+connection);
        }
    }
}
