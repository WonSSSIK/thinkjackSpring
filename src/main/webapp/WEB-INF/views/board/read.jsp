<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<%--하트 스타일부분--%>
<style>
    body{
        word-break:break-all;
    }

    .textSpan {
        white-space:pre-wrap;
        height: 100%;
        overflow-y: auto;
        overflow-x: hidden;
    }


</style>


<div class="row  removePadding justify-content-center" style="padding-top: 100px;">

    <div class="col-md-10 col-lg-7 col-xl-6 cardtext-white list-group ">
        <label class="control-label">

            <c:set var="name" value="${category}" />
            <c:if test="${name eq 'qna'}">
                <h1 class="bd" id="titleList" style="text-align: center;">질문 게시판</h1>
            </c:if>
            <c:if test="${name eq 'free'}">
                <h1 class="bd" id="titleList" style="text-align: center;">자유 게시판</h1>
            </c:if>
            <c:if test="${name eq 'notice'}">
                <h1 class="bd" id="titleList" style="text-align: center;">공지사항</h1>
            </c:if>

        </label>
        <form role="form" method="post">
            <input type="hidden" name='category' value="${category}">
            <input type='hidden' name='page' value="${cri.page}">
            <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
            <input type='hidden' name='searchType' value="${cri.searchType}">
            <input type='hidden' name='keyword' value="${cri.keyword}">
        </form>
        <div class="box-body m-3">
            <div style="float:right;">

                <label class=" text-white bd"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                                              value="${boardVO.boardRegdate}"/> </label>
                <a class="btn heart">
                    <i id='heart' class="fa" style="color: red; font-size: 26px"></i>
                </a>
            </div>

            <div class="form-group text-white bd" style="margin-top: 10px;">
                <label style="font-size:1.35rem;">Title</label>
                <input type="text" name='title' class="form-control hn" value="${boardVO.boardTitle}"
                       readonly="readonly"/>
            </div>
            <div class="form-group text-white bd">
                <label style="font-size:1.35rem;">Content</label>
                <textarea type="text" name='content' class="form-control hn" rows="12"
                          readonly="readonly" style="padding-top: 20px;">${boardVO.boardContent}</textarea>
            </div>
            <div class="form-group text-white bd">
                <label style="font-size:1.35rem;">Writer</label>
                <div class="form-control" style="background: white">
                    <img id='writerProfile' class="rounded photo2">
                    <label class="hn ml-3" style="color: black;">${boardVO.boardWriter}</label>
                </div>
                <script>
                    $("#writerProfile").prop("src", getFileInfo("${boardVO.boardWriterProfile}"))
                </script>

            </div>
        </div>
        <div class="box-footer m-3 ">
            <c:if test="${login.userName == boardVO.boardWriter}">
                <button type="submit" class="btn btn-warning modifyBtn hn">수정</button>
                <button type="submit" class="btn btn-danger removeBtn hn">삭제</button>
            </c:if>
            <button type="submit" class="btn btn-primary goListBtn pull-right bd">GO LIST</button>
        </div>
    </div>
</div>
<div class="row removePadding justify-content-center">
<c:set var="name" value="${category}"/>
<c:if test="${name ne 'notice'}">

    <div class="col-md-10 col-lg-7 col-xl-6 removePadding ">
            <%--댓글 등록 부분 --%>
        <div class="card border-primary ">
            <h2 class="bd m-2"> Comment</h2>

            <div class="row m-3">
                <div class="col-md-10">
                        <%--댓글 등록하는 아이디(--%>
                    <input type="text" name='writer' class="form-control register hn" value="${login.userName}"
                           readonly="readonly">
                        <%--댓글 입력 부분--%>
                    <textarea class="form-control replyTextReply hn" rows="4" placeholder="댓글 입력하세요"></textarea>
                </div>
                <div class="col-md-2  removePadding ">
                        <%--1.등록 버튼을 누르면 새로운 댓글 추가된다--%>
                    <button type="button" class="btn btn-primary addBtn  hn" style="width:100%;height:150px;">등록
                    </button>
                </div>
            </div>
        </div>
        <div class="row mt-3">
                <%--입력된 댓글 목록 나타나는 부분--%>

                <%--<ul class="replies"></ul>--%>
            <ul class="removePadding col-md-12">

                    <%--버튼을 클릭하면 댓글목록이 나온다--%>
                <li class="time-label repliesDiv">

                        <%--<button type="button" class=""> Replies List </button>--%>
                </li>
                    <%--페이지네이션 부분--%>
                <div class='text-center mb-5'>
                    <ul id="pagination" class="pagination pagination-sm justify-content-center" style="padding-bottom: 40px"></ul>
                </div>
            </ul>
        </div>

    </div>
    </div>
    <%--댓글 반복문 부분--%>
    <script>
        $(document).ready(function () {

            Handlebars.registerHelper('ifCond', function (v2, options) {
                if ("${login.userName}" === v2) {
                    return options.fn(this);
                }
                return options.inverse(this);
            });

        });
    </script>
    <script class="template" type="text/x-handlebars-template">

    {{#each .}}
    <li class="replyLi" data-replyId={{replyId}}>


        <div class="col row mb-3 removePadding ">
                <%--댓글이 삭제되었는지 확인--%>
            {{#if replyVO.replyState}}
                <%-- 조건문으로 parent값 있는것을 구분한다--%>
                <%--하트 버튼(좋아요)--%>
                <%--댓글 부분--%>
            {{#if replyVO.replyParent}}
            <div class="col-2 row removePadding justify-content-center align-items-center">
                <i class="fa fa-reply fa-2x fa-rotate-180" aria-hidden="true"></i>
            </div>
            {{/if}}

            <div class="{{isRereply replyVO.replyParent}} removePadding registerReply card-header text-white" style="background-color:#2c2c2c">

                <div class="row col-12 removePadding">
                        <%--사진--%>
                    <div class="col-12 removePadding p-3">
                        <div style="display :flex; float:left">
                            <img src="{{profileImg replyVO.replyProfile}}" class="photo2 rounded">

                        </div>


                            <%--replyId 불러오기 위해 필요한 부분--%>
                        <div style="display :flex; float: right;">
                                <%--<span class="replyWriter">{{replyVO.replyWriter}}</span>--%>
                            <div style="text-align: right">
                                <span class="time bd">{{prettifyDate  replyVO.replyRegdate}}</span>
                                <a class="replyHeartBtn btn">
                                    <i class="fa  {{replyLikeIcon reHeart}}"
                                       style="font-size: 26px; {{replyLikeStyle reHeart}}"></i>
                                </a>
                                {{replyVO.replyLikecnt}}
                            </div>
                        </div>

                        <div style="display: flex; align-items: center;">
                            <div style="text-align: left">
                                <span class="replyId" style="display: none">{{replyVO.replyId}}</span>
                                    <%--replyId와 replyWriter 나타나는 부분--%>
                                <span class="replyWriter register hn">{{replyVO.replyWriter}}</span>
                            </div>
                        </div>
                    </div>
                    <div class="comment col-10 p-3" style="overflow:auto; width:100%; height:150px;">
                            <%--입력된 댓글 text부분--%>
                            <input class="replyText form-control" readonly value="{{replyVO.replyText}}" style="display: none"></input>
                        <textarea id="reply{{replyVO.replyId}}" class="form-control d-none" style="height: 100%;">{{replyVO.replyText}}</textarea>
                        <spna class="textSpan form-control" >{{replyVO.replyText}}</spna>
                    </div>
                    <div class="col-2 row align-items-end pb-2">
                        {{#ifCond replyVO.replyWriter}}

                        <button type="button" class="btn btn-warning replyModBtn hn" style="width: 100%;">수정</button>

                        <button type="button" class="btn btn-danger replyDelBtn hn" style="width: 100%;">삭제</button>

                        {{/ifCond}}
                        <button type="button" class="btn btn-info reReplyBtn hn" style="width: 100%; ">답글</button>
                    </div>
                </div>


                    <%--버튼 누르면 나오게 하기--%>
            </div>
            <div class="reReply col-12 row mt-3 d-none">

                <textarea class="col-md-10 removePadding form-control replyTextReply hn" rows="3" placeholder="대댓글 입력하세요"></textarea>
                <button class="col-md-2 removePadding p-2 btn btn-primary addBtn hn" type="button" >
                    등록
                </button>
            </div>

        </div>

        {{else}}
        <div class="col row card border-light mb-3 ">
            <div class="card-header hn" style="text-align: center">
                <span>삭제된 댓글입니다</span>
            </div>
        </div>
        {{/if}}
    </li>
    {{/each}}
</c:if>
</script>

<script>
    $(document).ready(function () {
        if (${login eq null})
            $(".heart").addClass("disabled");
        //하트
        var heartval = ${heart};
        console.log(heartval);
        if (heartval > 0) {
            $("#heart").addClass("fa-heart");
            $("#heart").css("color", "red");
        }
        else {
            $("#heart").addClass("fa-heart-o");
            $("#heart").css("color", "gray");
        }
        var formObj = $("form[role='form']");
        var boardid = "<input type='hidden' name='boardId' value='${boardVO.boardId}'>";

        $(".modifyBtn").on("click", function () {
            formObj.attr("action", "/board/modify");
            formObj.attr("method", "get");
            formObj.append(boardid);
            formObj.submit();
        });

        $(".removeBtn").on("click", function () {
            formObj.attr("action", "/board/remove");
            formObj.append(boardid);
            formObj.submit();
        });
        $(".goListBtn").on("click", function () {
            formObj.attr("method", "get");
            formObj.attr("action", "/board/list");
            formObj.submit();
        });

        $(".heart").on("click", function () {
            var heart;
            if ($("#heart").hasClass("fa-heart"))
                heart = 1;
            else
                heart = 0;
            var sendData = {'boardId': '${boardVO.boardId}', 'heart': heart};
            $.ajax({
                url: '/board/heart',
                type: 'POST',
                data: sendData,
                success: function (data) {
                    if (data == 1) {
                        $("#heart").addClass("fa-heart");
                        $("#heart").removeClass("fa-heart-o");
                        $("#heart").css("color", "red");
                    }
                    else {
                        $("#heart").removeClass("fa-heart");
                        $("#heart").addClass("fa-heart-o");
                        $("#heart").css("color", "gray");
                    }
                }
            });
        });

    });
</script>
<script>
    //대댓글 id는 replyParent에서 받아오고 댓글 id=replyId값에서 받아온다
    $(document).on("click", ".addBtn", function () {
        if(${login eq null})
            location.href ="../user/login";
        var replyParent = $(this).parent().parent().parent().find('.replyId').text();
        // console.log("reParent 값?"+replyParent);
        //각각의 id값을 받아온다
        var replyTextObj = $(this).parent().parent().find('.replyTextReply');
        var replyText = replyTextObj.val();
        // console.log("내용확인"+replyText);
        var replyer = $('.register').val();
        // console.log(replyParent + "replyId?");

        $.ajax({
            type: 'post',
            url: '/replies/',
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            dataType: 'text',
            //문자를 객체로 바꿈
            data: JSON.stringify({
                boardId: boardId, replyText: replyText, replyWriter: replyer, replyParent: replyParent
            }),
            success: function (result) {
                if (result == 'SUCCESS') {
                    alert("등록");
                    replyPage = 1;

                    getPage("/replies/" + boardId + "/" + replyPage);

                    replyTextObj.val("댓글을 등록");
                }
            }
        });

    });
</script>

<script>
    $(document).on("click", ".reReplyBtn", function () {
        if(${login eq null})
            location.href ="../user/login";
        var reReply = $(this).parent().parent().parent().parent().find('.reReply');

        if (reReply.hasClass("d-none")) {
            reReply.removeClass("d-none");
            $(this).html('<span></span> 닫기');
        } else {
            reReply.addClass("d-none");
            $(this).html('<span></span> 답글');
        }
    });

</script>
<script>
    <%--수정 삭제--%>
    $(document).on("click", ".replyModBtn", function () {
        var replyId = $(this).parent().parent().parent().find('.replyId').text();
        var replyTextObj = $(this).parent().parent().find('#reply'+replyId);
        var replyText = replyTextObj.val();
        var textSpan = $(this).parent().parent().find('.textSpan');

        if (replyTextObj.hasClass("d-none")) {
            replyTextObj.removeClass("d-none");
            textSpan.addClass("d-none");
            $(this).html('<span></span> 등록');
        }
        else{
            replyTextObj.addClass("d-none");
            replyTextObj.html(textSpan.html());
            textSpan.removeClass("d-none");
            $(this).html('<span></span> 수정');
        }

        // console.log(replyText + "보내지는 글");

        $.ajax({
            type: 'put',
            url: '/replies/' + replyId,
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "PUT"
            },
            data: JSON.stringify({replyText: replyText}),
            dataType: 'text',
            success: function (result) {
                // console.log("수정완료?");
                if (result == 'SUCCESS') {
                    textSpan.html(replyText);
                }
            }
        });
    });

    $(document).on("click", ".replyDelBtn", function () {
        var replyId = $(this).parent().parent().parent().find('.replyId').text();
        var replyTextObj = $(this).parent().parent().find('.replyText');
        var replyText = replyTextObj.val();

        $.ajax({
            type: 'delete',
            url: '/replies/' + replyId,
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "DELETE"
            },
            dataType: 'text',
            success: function (result) {
                if (result == 'SUCCESS') {
                    alert("삭제 되었습니다.");
                    getPage("/replies/" + boardId + "/" + replyPage);
                }
            }
        });
    });
</script>
<script>
    <%--3.날짜부분--%>
    Handlebars.registerHelper("prettifyDate", function (timeValue) {
        var dateObj = new Date(timeValue);
        var year = dateObj.getFullYear();
        var month = dateObj.getMonth() + 1;
        var date = dateObj.getDate();
        var hour = dateObj.getHours();
        var minute = dateObj.getMinutes();
        var strDate = year + "-" + month + "-" + date + " " + hour + ":" + minute;
        return strDate;
    });
    Handlebars.registerHelper('profileImg', function (replyProfile) {
        // console.log(replyProfile);
        return getFileInfo(replyProfile);
    });

    Handlebars.registerHelper('replyLikeIcon', function (replyLike) {
        console.log(replyLike);
        if (replyLike > 0)
            return "fa-heart";
        else
            return "fa-heart-o";
    })
    Handlebars.registerHelper('replyLikeStyle', function (replyLike) {
        if (replyLike > 0)
            return "color: red;";
        else
            return "color: grey;";
    });
    Handlebars.registerHelper('isRereply', function (replyParent) {
        if (replyParent > 0)
            return "col-10";
        else
            return "col-12";

    })

</script>
<script>
    <%--페이지 연결부분--%>
    var printData = function (replyArr, target, templateObject) {
        var template = Handlebars.compile(templateObject.html());
        // console.log(template+">>>>>");
        var html = template(replyArr);

        $(".replyLi").remove();
        target.after(html);


    };
</script>

<script>
    /*댓글 목록 보기*/
    //해당 게시물의 번호
    var boardId =${boardVO.boardId};
    var replyPage = 1;
    //댓글목록 처리
    //getPage는 특정한 게시물에 대한 페이지 처리를 위해서 호출되는 함수
    function getPage(pageInfo) {
        $.getJSON(pageInfo, function (data) {
            var temp = data.list;
            var temp2 = new Array(data.list.length);
            for (var i in temp)
                temp2[i] = {replyVO: data.list[i], reHeart: data.reHeart[i]};

            printData(temp2, $(".repliesDiv"), $('.template'));

            printPaging(data.pageMaker, $("#pagination"));
        });
    }

    var printPaging = function (pageMaker, target) {
        var str = "";

        if (pageMaker.prev) {
            str += "<li class='page-item'><a class='page-link' href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
        }

        for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
            var strClass = pageMaker.cri.page == i ? 'class=active page-item' : '';
            str += "<li " + strClass + "><a class='page-link' href='" + i + "'>" + i + "</a></li>";
        }

        if (pageMaker.next) {
            str += "<li class='page-item'><a class='page-link' href ='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
        }
        target.html(str);
    };
    //최초로 댓글의 1페이지가져오는작업 (repliesList)버튼 클릭하면 작동
    $(".repliesDiv").ready(function () {

        if ($(".timeline li").resize() > 1) {
            return;
        }
        getPage("/replies/" + boardId + "/1");
    });
    //페이지 네이션 부분
    $("#pagination").on("click", "li a", function (event) {

        event.preventDefault();

        replyPage = $(this).attr("href");


        getPage("/replies/" + boardId + "/" + replyPage);
    });


</script>
<script>
    <%--하트버튼을 누르면 senddata로 heart컨트롤러로 ajax로 보낸다.--%>

    $(document).on("click", ".replyHeartBtn", function () {
//  자바스크립트 객체 형태로 전달

        var heart_replyid = $(this).parent().parent().parent().find('.replyId').text();
        var heart;
        var that = $(this).find("i");
        if ($(this).find("i").hasClass("fa-heart"))
            heart = 1;
        else
            heart = 0;

        var sendLike = {'replyId': heart_replyid, 'replyHeart': heart};
//
//         console.log('/replies/heart/' + heart_replyid + '/' + heart);

        $.ajax({
            url: '/replies/heart/' + heart_replyid + '/' + heart,
            type: 'POST',
            data: sendLike,
            contentType: "application/json",
            success: function (data) {
                // console.log("하트 전송?"+data);
                if (data == 1) {
                    that.addClass("fa-heart");
                    that.removeClass("fa-heart-o");
                    that.css("color", "red");
                }
                else {
                    that.removeClass("fa-heart");
                    that.addClass("fa-heart-o");
                    that.css("color", "gray");
                }
            }
        });
    });
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>