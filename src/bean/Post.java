package bean;
import lombok.Data;
@Data
public class Post {
    private Integer postId;//发帖ｉｄ
    private String postPlatename;//发帖所属板块名称
    private Integer postUserid;//发帖的用户ｉｄ
    private Integer postReplycount;//该帖的回复数量
    private String postTitle;//发帖的标题
    private String postContent;//发帖正文
    private String postTime;//发帖时间
}
