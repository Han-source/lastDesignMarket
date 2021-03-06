/**
 CallBack 함수 : 특정 Event에 대응
 */
 
/** 함수 정의 영역 */
var imgService = (function() {
	function imgList(attachVOInJson, uuid, id, w, h){
		var liTags = "";
		var attachVo = JSON.parse(decodeURL(attachVOInJson));
				if(attachVo.uuid === uuid){
					liTags+= "<li>"
						+ "<img src='/uploadFiles/display?fileName=" 
						+ encodeURIComponent(attachVo.fileProductCallPath) + "' style = 'float: left;  width: " + w + "px; height: " +h+ "px; font-size: 0;'>"
						+ "</li>";
						$("#"+ id).append(liTags);
				}
	}

	function imgAppend(attachVOInJson, id, w, h){
		var liTags = "";
		var attachVo = JSON.parse(decodeURL(attachVOInJson));
			liTags+= "<li>"
				+ "<img src='/uploadFiles/display?fileName=" 
				+ encodeURIComponent(attachVo[0].fileCallPath) + "' style = 'float: left;  width: " + w + "px; height: " +h+ "px; font-size: 0;'>"
				+ "</li>";
				$("#"+ id).append(liTags);
	}

	function appendUploadUl(attachVOInJson, updateMode, postId) {
	var liTags = "";
	var attachVO = JSON.parse(decodeURL(attachVOInJson));
	
	if (attachVO.multimediaType === "others") {
		liTags += "<li data-attach_info=" + attachVOInJson + "><a href='/uploadFiles/download?fileName=" 
			+ encodeURIComponent(attachVO.originalFileCallPath) + "'><img src='/resources/img/attachfileicon.png'>" 
			+ attachVO.pureFileName + "</a>"
			if(updateMode) {
				liTags += "<span>X</span>";
			}
			liTags += "</li>";
	} else {
		if (attachVO.multimediaType === "audio") {
			liTags += "<li data-attach_info=" + attachVOInJson + ">"
					+ "<a>"
					+ "<img src='/resources/img/speaker.png'>" 
					+ attachVO.pureFileName + "</a>"; 
					if(updateMode) {
						liTags += "<span>X</span>";
					}
					liTags += "</li>";
					
		} else if (attachVO.multimediaType === "image" || attachVO.multimediaType === "video") {
			liTags += "<li>"
					+ "<a>"
					+ "<img src='/uploadFiles/display?fileName=" 
					+ encodeURIComponent(attachVO.fileCallPath) + "'/>"
					+ "</a>"; 
					if(updateMode) {
						liTags += "<span>X</span>";
					}
					liTags += "</li>";
			} 	  
		}
        $("#imageeDiv").append(liTags); 
}			
	//채팅 처리용 함수들
	//앞이 chatting.jsp 뒤가 실행될 함수
	return {
	productImgList : imgList,
	append : appendUploadUl,
	oneImgAppend : imgAppend
		};
})();