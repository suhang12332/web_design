package test;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.util.Properties;
public class DruidDemo {
    public static void main(String[] args) throws Exception {
        Properties pro = new Properties();
        InputStream is = DruidDemo.class.getResourceAsStream("../properties/druid.properties");  //获取配置文件字节流
        pro.load(is);
        DataSource ds = DruidDataSourceFactory.createDataSource(pro);
        //获取链接
        Connection connection = ds.getConnection();
        System.out.println(connection);
    }
}
