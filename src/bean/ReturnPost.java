package bean;

import lombok.Data;
@Data
//回帖
public class ReturnPost {
    private Integer returnId;  //回复的编号
    private Integer returnPostid;//回帖的帖子ｉｄ
    private String returnPlatename;//回复的帖子的板块名称
    private String returnContent;  //回复的内容
    private Integer returnUserid;  //回复人编号
    private String returnTime;  //回复的时间
}
