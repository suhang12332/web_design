package bean;

import lombok.Data;

@Data
public class PostandPlate {
    private Integer postId;//发帖ｉｄ
    private String postPlatename;//发帖所属板块名称
    private Integer postUserid;//发帖的用户ｉｄ
    private Integer postReplycount;//该帖的回复数量
    private String postTitle;//发帖的标题
    private String postContent;//发帖正文
    private String postTime;//发帖时间
    private String plateName;//板块名称
    private Integer platePostcount;//板块的帖子数量
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
