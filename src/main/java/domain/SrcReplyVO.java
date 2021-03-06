package domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class SrcReplyVO {
    private int replyId;
    private String srcId;
    private String replyText;
    private int replyWriter;
    private Date replyRegdate;
    private Date replyUpdate;
    private int replyStatus;
//    private int replyParent;
    private String replyWriterImgPath;
    //삭제부분 0,1

    public String getReplyWriterImgPath() {
        return replyWriterImgPath;
    }

    public void setReplyWriterImgPath(String replyWriterImgPath) {
        this.replyWriterImgPath = replyWriterImgPath;
    }

    public int getReplyId() {
        return replyId;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public String getSrcId() {
        return srcId;
    }

    public void setSrcId(String srcId) {
        this.srcId = srcId;
    }

    public String getReplyText() {
        return replyText;
    }

    public void setReplyText(String replyText) {
        this.replyText = replyText;
    }

    public int getReplyWriter() {
        return replyWriter;
    }

    public void setReplyWriter(int replyWriter) {
        this.replyWriter = replyWriter;
    }


//    public Date getReplyRegdate() {
//        return replyRegdate;
//    }
    public String getReplyRegdate() {
            if (replyRegdate != null) {
                return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(replyRegdate);
            } else {
                return "";
            }
    }


    public void setReplyRegdate(Date replyRegdate) {
        this.replyRegdate = replyRegdate;
    }

//    public Date getReplyUpdate() {
//        return replyUpdate;
//    }
    public String getReplyUpdate() {
        if (replyUpdate != null) {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(replyUpdate);
        } else {
            return "";
        }
    }


    public void setReplyUpdate(Date replyUpdate) {
        this.replyUpdate = replyUpdate;
    }

    public int getReplyStatus() {
        return replyStatus;
    }

    public void setReplyStatus(int replyStatus) {
        this.replyStatus = replyStatus;
    }

    @Override
    public String toString() {
        return "SrcReplyVO{" +
                "replyId=" + replyId +
                ", srcId='" + srcId + '\'' +
                ", replyText='" + replyText + '\'' +
                ", replyWriter=" + replyWriter +
                ", replyRegdate=" + replyRegdate +
                ", replyUpdate=" + replyUpdate +
                ", replyStatus=" + replyStatus +
                ", replyWriterImgPath='" + replyWriterImgPath + '\'' +
                '}';
    }
}
