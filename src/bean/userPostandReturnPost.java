package bean;

import lombok.Data;

@Data
public class userPostandReturnPost {
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
    private Integer postId;//发帖ｉｄ
    private String postPlatename;//发帖所属板块名称
    private Integer postUserid;//发帖的用户ｉｄ
    private Integer postReplycount;//该帖的回复数量
    private String postTitle;//发帖的标题
    private String postContent;//发帖正文
    private String postTime;//发帖时间
    private Integer returnId;  //回复的编号
    private Integer returnPostid;//回帖的帖子ｉｄ
    private String returnPlatename;//回复的帖子的板块名称
    private String returnContent;  //回复的内容
    private Integer returnUserid;  //回复人编号
    private String returnTime;  //回复的时间
    private String userLookhistory;
}
