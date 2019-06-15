package Dao.imp;

import java.sql.SQLException;

public interface PostDao {
    Integer postInformation(String platename,Integer userid,String posttitle,String postcontent) throws SQLException;
}
