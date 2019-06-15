package util;


import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;

public class C3P0JDBCUtil {
    private static DataSource dataSource;
    static{
        dataSource = new ComboPooledDataSource();
    }
    public static DataSource getDataSource() {
        return dataSource;
    }
}
