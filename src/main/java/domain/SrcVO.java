package domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class SrcVO {
    private String srcId;
    private int srcWriter; //null일때 작성자 없는것 (익명)
    private String srcWriterName;
    private String srcWriterImgPath;
    private String srcPath;
    private String srcComments;
    private Date srcRegdate;
    private Date srcUpdate;
    private String srcTitle;
    //  private int recnt; // **소스게시글 댓글의 수
    private int srclikeCli;
    private int srcLikecnt;
    private int srcViewcnt;
    private int srcStatus;  //0, 1, 2로 구분 (private, public, delete)

    private String srcHtml;
    private String srcCss;
    private String srcJavaScript;

    private List<String> cdnCss;
    private List<String> cdnJs;

    public List<String> getCdnCss() {
        return cdnCss;
    }

    public void setCdnCss(List<String> cdnCss) {
        this.cdnCss = cdnCss;
    }

    public List<String> getCdnJs() {
        return cdnJs;
    }

    public void setCdnJs(List<String> cdnJs) {
        this.cdnJs = cdnJs;
    }

    public int getSrclikeCli() {
        return srclikeCli;
    }

    public void setSrclikeCli(int srclikeCli) {
        this.srclikeCli = srclikeCli;
    }

    public String getSrcWriterImgPath() {
        return srcWriterImgPath;
    }

    public void setSrcWriterImgPath(String srcWriterImgPath) {
        this.srcWriterImgPath = srcWriterImgPath;
    }

    public String getSrcWriterName() {
        return srcWriterName;
    }

    public void setSrcWriterName(String srcWriterName) {
        this.srcWriterName = srcWriterName;
    }

    public String getSrcHtml() {
        return srcHtml;
    }

    public void setSrcHtml(String srcHtml) {
        this.srcHtml = srcHtml;
    }

    public String getSrcCss() {
        return srcCss;
    }

    public void setSrcCss(String srcCss) {
        this.srcCss = srcCss;
    }

    public String getSrcJavaScript() {
        return srcJavaScript;
    }

    public void setSrcJavaScript(String srcJavaScript) {
        this.srcJavaScript = srcJavaScript;
    }

    public String getSrcId() {
        return srcId;
    }

    public void setSrcId(String srcId) {
        this.srcId = srcId;
    }

    public int getSrcWriter() {
        return srcWriter;
    }

    public void setSrcWriter(int srcWriter) {
        this.srcWriter = srcWriter;
    }

    public String getSrcPath() {
        return srcPath;
    }

    public void setSrcPath(String srcPath) {
        this.srcPath = srcPath;
    }

    public String getSrcComments() {
        return srcComments;
    }

    public void setSrcComments(String srcComments) {
        this.srcComments = srcComments;
    }

    public String getSrcRegdate() {
        if (srcRegdate != null) {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(srcRegdate);
        } else {
            return "";
        }
    }

    public void setSrcRegdate(Date srcRegdate) {
        this.srcRegdate = srcRegdate;
    }

    public String getSrcUpdate() {
        if (srcUpdate != null) {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(srcUpdate);
        } else {
            return "";
        }
    }

    public void setSrcUpdate(Date srcUpdate) {
        this.srcUpdate = srcUpdate;
    }

    public String getSrcTitle() {
        return srcTitle;
    }

    public void setSrcTitle(String srcTitle) {
        this.srcTitle = srcTitle;
    }

    public int getSrcLikecnt() {
        return srcLikecnt;
    }

    public void setSrcLikecnt(int srcLikecnt) {
        this.srcLikecnt = srcLikecnt;
    }

    public int getSrcViewcnt() {
        return srcViewcnt;
    }

    public void setSrcViewcnt(int srcViewcnt) {
        this.srcViewcnt = srcViewcnt;
    }

    public int getSrcStatus() {
        return srcStatus;
    }

    public void setSrcStatus(int srcStatus) {
        this.srcStatus = srcStatus;
    }

    @Override
    public String toString() {
        return "SrcVO{" +
                "srcId='" + srcId + '\'' +
                ", srcWriter=" + srcWriter +
                ", srcWriterName='" + srcWriterName + '\'' +
                ", srcWriterImgPath='" + srcWriterImgPath + '\'' +
                ", srcPath='" + srcPath + '\'' +
                ", srcComments='" + srcComments + '\'' +
                ", srcRegdate=" + srcRegdate +
                ", srcUpdate=" + srcUpdate +
                ", srcTitle='" + srcTitle + '\'' +
                ", srclikeCli=" + srclikeCli +
                ", srcLikecnt=" + srcLikecnt +
                ", srcViewcnt=" + srcViewcnt +
                ", srcStatus=" + srcStatus +
                ", srcHtml='" + srcHtml + '\'' +
                ", srcCss='" + srcCss + '\'' +
                ", srcJavaScript='" + srcJavaScript + '\'' +
                ", cdnCss=" + cdnCss +
                ", cdnJs=" + cdnJs +
                '}';
    }
}
