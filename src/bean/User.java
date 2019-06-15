package bean;
import lombok.Data;
@Data
public class User {
    private Integer userId;//用户ｉｄ
    private String userName;//用户名字
    private String userPassword;//用户密码
    private String userEmail;//用户邮箱
    private String userQQ;//用户ｑｑ
    private String userBirthday;//用户生日　可以为空
    private String userSex;//用户性别
    private String userImg;//用户头像　　可以为空
    private String userSate;//用户个性签名　　可以为空
    private String userDate;//用户注册日期
    private String userLookhistory;
}
