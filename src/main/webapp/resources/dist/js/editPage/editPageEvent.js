//var allEditValue;//html, javascript, css 모두 합친 문자열
//------------------------------------------------------코드 자동 적용 기능

codeHtml.on("change", function () {
    changeSaveImg(2);
    clearTimeout(delay);

    if ($('#autoPreview').is(':checked')) {
        //setTimeout()에 지정된 함수 실행을 중지
        delay = setTimeout(updatePreview, 3000);
    }

    if ($('#autoSave').is(':checked')) { //이슈: 자동저장된 url은 미리보기 안됨.  수정: cleartimeout 공통으로 뺌
        // clearTimeout(delay);
        if (srcId === "") {
            // alert(111)
        } else {
            // alert(srcId);
            // clearTimeout(delay);
            delay = setTimeout(codeSave, 3000);
        }

    }

});

codeCss.on("change", function () {
    changeSaveImg(2);
    clearTimeout(delay);
    if ($('#autoPreview').is(':checked')) {
        // clearTimeout(delay);//setTimeout()에 지정된 함수 실행을 중지
        delay = setTimeout(updatePreview, 3000);
    }

    if ($('#autoSave').is(':checked')) { //이슈: 자동저장된 url은 미리보기 안됨.
        if (srcId === "") {
            // alert(111)
        } else {
            // alert(srcId);
            // clearTimeout(delay); //setTimeout()에 지정된 함수 실행을 중지
            delay = setTimeout(codeSave, 3000);
        }
    }


});

codeJavaScript.on("change", function () {
    changeSaveImg(2);
    clearTimeout(delay);
    if ($('#autoPreview').is(':checked')) {
        // clearTimeout(delay);//setTimeout()에 지정된 함수 실행을 중지
        delay = setTimeout(updatePreview, 3000);
    }

    if ($('#autoSave').is(':checked')) { //이슈: 자동저장된 url은 미리보기 안됨.
        if (srcId === "") {
            // alert(111)
        } else {
            // alert(srcId);
            // clearTimeout(delay); //setTimeout()에 지정된 함수 실행을 중지
            delay = setTimeout(codeSave, 3000);
        }
    }
});


//키업 이벤트 발생시 마다 위 이벤트키를 제외하고 자동으로 힌트창 보여준다. 수동키인 ctrl+ Space 와 병행사용 가능
codeHtml.on("keyup", function (cm, event) {
    if (!cm.state.completionActive && /*Enables keyboard navigation in autocomplete list*/
        !ExcludedIntelliSenseTriggerKeys[(event.keyCode || event.which).toString()]) {        /*Enter - do not open autocomplete list just after item has been selected in it*/
        var scope = {};
        var preventList = ['StyleFix', 'PrefixFree', 'Html2Jade', 'alert'];
        for (var i in window) {
            if (preventList.indexOf(i) === -1) {
                scope[i] = window[i]
            }
        }
        CodeMirror.commands.autocomplete(cm, null, {completeSingle: false, globalScope: scope});
    }
});

//번호표 옆에 빈칸을 클릭시 codeEdit.js의 makeMarker 를 호출해서 마크 뿌려줌
codeHtml.on("gutterClick", function (cm, n) {
    var info = cm.lineInfo(n);
    cm.setGutterMarker(n, "breakpoints", info.gutterMarkers ? null : makeMarker());
});


codeCss.on("keyup", function (cm, event) {
    if (!cm.state.completionActive && /*Enables keyboard navigation in autocomplete list*/
        !ExcludedIntelliSenseTriggerKeys[(event.keyCode || event.which).toString()]) {        /*Enter - do not open autocomplete list just after item has been selected in it*/
        var scope = {};
        var preventList = ['StyleFix', 'PrefixFree', 'Html2Jade', 'alert'];
        for (var i in window) {
            if (preventList.indexOf(i) === -1) {
                scope[i] = window[i]
            }
        }
        CodeMirror.commands.autocomplete(cm, null, {completeSingle: false, globalScope: scope});
    }
});
// codeCss.on("gutterClick", function (cm, n) {
//     var info = cm.lineInfo(n);
//     cm.setGutterMarker(n, "breakpoints", info.gutterMarkers ? null : makeMarker());
// });

codeJavaScript.on("keyup", function (cm, event) {
    if (!cm.state.completionActive && /*Enables keyboard navigation in autocomplete list*/
        !ExcludedIntelliSenseTriggerKeys[(event.keyCode || event.which).toString()]) {        /*Enter - do not open autocomplete list just after item has been selected in it*/
        var scope = {};
        var preventList = ['StyleFix', 'PrefixFree', 'Html2Jade', 'alert'];
        for (var i in window) {
            if (preventList.indexOf(i) === -1) {
                scope[i] = window[i]
            }
        }
        CodeMirror.commands.autocomplete(cm, null, {completeSingle: false, globalScope: scope});

    }
});
// codeUnitTest.on("keyup", function (cm, event) {
//     if (!cm.state.completionActive && /*Enables keyboard navigation in autocomplete list*/
//         !ExcludedIntelliSenseTriggerKeys[(event.keyCode || event.which).toString()]) {        /*Enter - do not open autocomplete list just after item has been selected in it*/
//         var scope = {};
//         var preventList = ['StyleFix', 'PrefixFree', 'Html2Jade', 'alert'];
//         for (var i in window) {
//             if (preventList.indexOf(i) === -1) {
//                 scope[i] = window[i]
//             }
//         }
//         CodeMirror.commands.autocomplete(cm, null, {completeSingle: false, globalScope: scope});
//     }
// });
codeJavaScript.on("gutterClick", function (cm, n) {
    var info = cm.lineInfo(n);
    cm.setGutterMarker(n, "breakpoints", info.gutterMarkers ? null : makeMarker());
});
codeUnitTest.on("gutterClick", function (cm, n) {
    var info = cm.lineInfo(n);
    cm.setGutterMarker(n, "breakpoints", info.gutterMarkers ? null : makeMarker());
});

//editHeader.jsp script
//pencil 클릭시 input text 보이기
$(function () {
    var pageTitleView = document.getElementById("page-title-view");
    var pageTitleText = document.getElementById("page-title-text");

    $("#pencil").click(function () {
        pageTitleView.style = "display: none;";
        pageTitleText.style = "display: block;";
        document.getElementById("src-title-input").focus();
    });
    //pageTitle input작성 완료후 focus 똔는 enter를 쳤을때
    $("#src-title-input").keydown(function (key) {
        if (key.keyCode == 13) {
            changeTitle(this);
        }
    });
    $("#src-title-input").focusout(function (e) {
        changeTitle(this);
    });
    $("#src-title-modal").keydown(function () {
        changeTitle(this);
    })

    var changeTitle = function (el) {
        changeSaveImg(2);
        srcTitle = el.value;
        document.getElementById("src-title").innerHTML = srcTitle;
        if (el.id === "src-title-modal") {
            document.getElementById("src-title-input").value = srcTitle;
        } else {
            document.getElementById("src-title-modal").value = srcTitle;
        }
        pageTitleView.style = "display: block;";
        pageTitleText.style = "display: none;";
    }
});
//comments 변경시 등록
$(function () {
    $("#modal-comment").on("change", function (e) {
        changeSaveImg(2);
        srcComments = this.value;
        document.getElementById("comment-view").value = srcComments;
    });
});

// HTML Preprocessor 설정
$(function () {

    $("#htmlPreprocessor").change(function () {
        // alert(selectedText); //선택된 text
        selectedText = $("#htmlPreprocessor option:selected").text();

        // document.getElementById("htmlPreprocessor");
        // var strUser = e.options[e.selectedIndex].value;

        if (selectedText === "None") {

        }
        else if (selectedText === "Haml") {


        } else if (selectedText === "MarkDown") {
            // alert(this.value);
            // alert(this.text);
            // document.write("<script src=" +
            //     "'/resources/dist/js/editPage/markDown.js'></script>");
            codeHtml.setValue("");
            codeHtml.clearHistory();
            codeHtml.setOption("mode", 'gfm');
            codeHtml.setOption("lineNumbers", false);
            codeHtml.setOption("matchBrackets", 'true');
            codeHtml.setOption("lineWrapping", 'true');
            codeHtml.setOption("theme", 'base16-light');
            codeHtml.setOption("extraKeys", {
                "Enter":
                    "newlineAndIndentContinueMarkdownList"
            });
            // alert(codeHtml.getOption("mode"));


        } else if (selectedText === "Slim") {


        } else if (selectedText === "Pug") {


        }

    });

});


//Setting Behavior부분 함수
$(function () {//---------------------------- tab-size 변경시
    $("#tab-size").change(function () {
        // alert(111);
        var st = $(":input:radio[name=gridRadios]:checked").val();
        var sp = this.value;
        if (st === "option1") {

            codeHtml.setOption("extraKeys", {
                Tab: function (cm) {
                    var spaces = Array(cm.getOption("indentUnit") +
                        parseInt(sp)).join(" ");
                    cm.replaceSelection(spaces);
                }
            });
        } else if (st === "option2") {

            // $("#gridRadios1").prop("checked", true);
            codeHtml.setOption("tabSize", this.value);
            codeCss.setOption("tabSize", this.value);
            codeJavaScript.setOption("tabSize", this.value);
        }
    });
});

//Setting Behavior부분 함수
$(function () {//---------------------------- option button 변경시
    $('input[type=radio][name=gridRadios]').change(function () {
        // alert('gridRadios');

        //현재 리스트박스의 탭사이즈 값 가져오기.
        var e = document.getElementById("tab-size");
        var strUser = e.options[e.selectedIndex].value;

        // var sp = this.value;
        if (this.value === "option1") {
            // alert('a');

            codeHtml.setOption("extraKeys", {
                Tab: function (cm) {
                    var spaces = Array(cm.getOption("indentUnit") +
                        parseInt(strUser)).join(" ");
                    cm.replaceSelection(spaces);
                }
            });
        } else if (this.value === "option2") { // have to: option1 갖다오면 백탭안됨
            // alert('b');
            // codeHtml.setOption("indentWithTabs", true);
            codeHtml.setOption("tabSize", strUser);
            codeCss.setOption("tabSize", strUser);
            codeJavaScript.setOption("tabSize", strUser);
            console.log(strUser);

        }
    });
});

$(function () {
    $("#run").click(function () { // run button 실행
        updatePreview();
    });
});


$(function () {
    $("#command-line").keyup(function (e) {
        if (e.keyCode === 13) {
            consoleView(this.value);
            this.value = "";
        }
    });
});


//footer
//console 버튼 누를때
$(function () {
    $("#console-button").click(function () {
        if (editConsole.style.display === "none") {
            editConsole.style.display = "block";
            commandLine.style.display = "block";

            jQuery("#console-button").addClass("btn_active");

        } else {
            editConsole.style.display = "none";
            commandLine.style.display = "none";
            jQuery("#console-button").removeClass("btn_active");

        }
    });
});
//처음 문서 로드시 콘솔창 숨기기
$(function () {
    editConsole.style.display = "none";
    commandLine.style.display = "none";

});
//--------------------

//창 크기조절 관련
$(function () {
    $(window).resize(function () {
        //            창크기 width 제한
        if (this.outerWidth <= 450) {
            this.outerWidth = 450;
        }
    });
});

//setting 모달 닫힐때 이벤트
$(function () {
    $("#setting").on("hide.bs.modal", function () {

        cdnCssJsValSet();

        updatePreview();
    });
});

//layout 관련 script
// $(function () {
//
//
//     $("#left-layout").click(function () {
//         codeMain.style = "height: calc(100% - 9px);";
//         iframeBody.style = "height: calc(100% - 50px);";
//         layout2.style = "height: 100%;";
//         layout1.className = "col-4 layout";
//         resizeView.className = "col resize_view";
//         resizeView.style = "height:100%; max-width: 5px; cursor: col-resize;";
//         layout2.className = "col main_view layout";
//         resizeCode1.style = "max-width: 100%; height: 5px; cursor: row-resize;";
//         resizeCode2.style = "max-width: 100%; height: 5px; cursor: row-resize;";
//
//         for (i in codeMirrorLayout) {
//             codeMirrorLayout[i].style = "height: calc(30% - 52px);";
//         }
//
//         for (i in codeLayout) {
//             codeLayout[i].style = "width: 100%;";
//         }
//     });
//
//     $("#top-layout").click(function () {
//         codeMain.style = "height: 100%;";
//         iframeBody.style = "height: calc(100% - 417px);";
//         layout2.style = "height: calc(100% - 417px);";
//         layout1.className = "row layout";
//         resizeView.className = "row resize_view";
//         resizeView.style = "height:5px; max-width: 100%; cursor: row-resize;";
//         layout2.className = "row main_view layout";
//         resizeCode1.style = "max-width: 5px; height: ; cursor: col-resize;";
//         resizeCode2.style = "max-width: 5px; height: ; cursor: col-resize;";
//
//         for (i in codeMirrorLayout) {
//             codeMirrorLayout[i].style = "height: 300px";
//         }
//
//         for (i in codeLayout) {
//             codeLayout[i].style = "width: 33.1%;";
//         }
//     });
//
//     $("#right-layout").click(function () {
//         codeMain.style = "height: calc(100% - 9px);";
//         iframeBody.style = "height: calc(100% - 50px);";
//         layout2.style = "height: 100%;";
//         layout1.className = "col-4 order-12 layout";
//         resizeView.className = "col order-6 resize_view";
//         resizeView.style = "height:100%; max-width: 5px; cursor: col-resize;";
//         layout2.className = "col order-1 main_view layout";
//         resizeCode1.style = "max-width: 100%; height: 5px; cursor: row-resize;";
//         resizeCode2.style = "max-width: 100%; height: 5px; cursor: row-resize;";
//
//         for (i in codeMirrorLayout) {
//             codeMirrorLayout[i].style = "height: calc(30% - 52px);";
//         }
//
//         for (i in codeLayout) {
//             codeLayout[i].style = "width: 100%;";
//         }
//     });
// });


//화면 영역 조절관련 function
jQuery("#resize-code-1").mousedown(function (e) {
    e.preventDefault();
    dragging = true;
    var startP = (hcl !== 0 ? hcl + e.pageX : e.pageX);

    $(window).mousemove(function (e) {

        hcl = startP - e.pageX;

        console.log(cssBuild.offsetWidth);
        if (htmlBuild.offsetWidth < 80 || cssBuild.offsetWidth < 80) {

        } else {
            htmlBuild.style = "width: calc(33.1% - " + hcl + "px);";
            cssBuild.style = "width: calc(33.1% + " + hcl + "px);";
        }

    });
});

jQuery("#resize-code-2").mousedown(function (e) {
    e.preventDefault();
    dragging = true;
    var startP = (cjl !== 0 ? cjl + e.pageX : e.pageX);

    $(window).mousemove(function (e) {

        cjl = startP - e.pageX;

        if (-350 < cjl && cjl < 350) {
            cssBuild.style = "width: calc(33.1% - " + cjl + "px);";
            jsBuild.style = "width: calc(33.1% + " + cjl + "px);";
        }

    });
});

jQuery("#resize-view").mousedown(function (e) {
    e.preventDefault();
    dragging = true;
    var startP = (cifl !== 0 ? cifl + e.pageY : e.pageY);

    $(window).mousemove(function (e) {
        cifl = startP - e.pageY;
//                if (-350 < cifl && cifl < 350) {
        for (i in codeMLayout) {
            codeMLayout[i].style = "height: calc(100% - " + (753 + cifl) + "px);";
        }

        iframeBody.style = "height: calc(100% - " + (488 - cifl) + "px);"
    });

    $('.iframeWrapper').mousemove(function (e) {
        cifl = startP - e.pageY;
        for (i in codeMLayout) {
            codeMLayout[i].style = "height: calc(100% - " + (753 + cifl) + "px);";
        }

        iframeBody.style = "height: calc(100% - " + (488 - cifl) + "px);"
    });
});

jQuery(window).mouseup(function (e) {
    $(window).unbind('mousemove');
    $('.iframeWrapper').unbind('mousemove');
    dragging = false;
});

jQuery('.iframeWrapper').mouseup(function (e) {
    $(window).unbind('mousemove');
    $('.iframeWrapper').unbind('mousemove');
    dragging = false;
});


$(function () {
    if ($('#autoPreview').is(':checked')) { //첫 로딩시 상태
    } else {
        var runstyle = document.getElementById("run");
        runstyle.style = "visibility: visible;"
    }

    $("#autoPreview").click(function () { //클릭시 상태
        var runstyle = document.getElementById("run");
        if (this.checked) {
            runstyle.style = "visibility: hidden;"
        } else {
            runstyle.style = "visibility: visible;"
        }
    });
});


//좋아요 버튼 이미지 변경
$(function () {
    $("#like").click(function (e) {
        $.ajax({
            type: "post",
            url: "/edit/like",
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            dataType: 'json',
            data: JSON.stringify({
                srcId: srcId
            }),
            success: function (success) {
                if (success.result === 0) {
                    //좋아요 추가시
                    likeImgChange(2);
                } else {
                    //좋아요 취소시
                    likeImgChange(1);
                }

                document.getElementById("like-couont").innerHTML = success.srcLikeCnt;
            }
        });
    });
});

// save & update
$("#saveCode").click(function (e) {
    codeSave();

});


$("#login").click(function (e) {
    if (window.sessionStorage) {
        if (srcId !== "") {
            sessionStorage.setItem('srcId', srcId);
        }
    }
    self.location = '/user/login'
});

$('input[name="visibility"]').on("change", function (e) {
    srcStatus = this.value;
});

$("#src-delete").click(function (e) {
    srcDelete();
});
// $('input[name="genderS"]:checked')


//=================Reply============
$(function () {
    $("#post").click(function (e) {
        alert(1);
        $.ajax({
            type: "post",
            url: "/srcReply/srcInsert.do",
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            dataType: 'text',
            data: JSON.stringify({
                // srcId: srcId,
                replyText: textarea,
                replyWriter: srcId
            }),

            error: function () {
                alert('통신실패!!');
            },

            success: function () {
                if (textarea === "") {
                    location.replace("/editPage/editModalReply/");
                }
                saveStatus = true;

                alert("저장이 되었습니다.");
            }
        });
    });
});

$(function () {

    $("#reply-scroll").scroll(function () {
        console.log($("#reply-scroll").height());
        console.log(this.scroll);
        console.log(this.scrollTop);
    });
});


$(function(){
    $("#command-line").keydown(function (e) {

        if(e.keyCode === 13){
            consoleSerchLog.unshift(this.value);// 배열 앞에 추가
        }else if(e.keyCode === 38){
            if(consoleSerchLog.length - 1  !== consoleCur){
                consoleCur++;
                this.value = consoleSerchLog[consoleCur];
            }

        }else if(e.keyCode === 40){
            if(consoleCur > 0){
                consoleCur--;
                this.value = consoleSerchLog[consoleCur];
            }else{
                if(consoleCur === 0){
                    consoleCur--;
                }
                this.value = ""
            }
        }
    });
});