package service.Post;

import Dao.imp.PostDao;
import dao.PostDaoImpl;
import java.sql.SQLException;
public class getPlatePostCount {
    public Object getPlatePostCount(String platename) {
        PostDaoImpl postDao=new PostDaoImpl();
        Object count = null;
        try {
            count=postDao.platePostCount(platename);
            postDao.insertPlateCount(platename);  //将该板块的帖子总数添加到Plate数据库
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
