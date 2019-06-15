package test;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.junit.Test;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class C3P0Demo1 {
    @Test
    public static void main(String[] args) throws SQLException {
        //创建数据库链接池对象
        DataSource ds = new ComboPooledDataSource();
        //获取链接对象
        Connection connection = ds.getConnection();
        System.out.println(connection);
    }
}
