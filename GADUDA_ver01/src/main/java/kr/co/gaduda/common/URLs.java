package kr.co.gaduda.common;

public class URLs {

	public static final String URI_MAIN = "../../";
	public static final String URI_MAIN_REDIRECT = "redirect:/";

	private static final String member_default = "/member";
	private static final String mypage_default = "/mypage";
	private static final String furniture_default = "/furniture";
	private static final String furniture_arr_default = "/furniture_arr";
	private static final String mypage_scrap_default = "/mypage/scrap";
	
	private static final String room_default="/room";

	// 로그아웃
	public static final String URI_LOGOUT = "/logout";
	public static final String URI_LOGOUT_FULL = member_default + URI_LOGOUT;

	// 로그인
	public static final String URI_LOGIN = "/login";
	public static final String URI_LOGIN_FULL = member_default + URI_LOGIN;

	// 로그인 체크
	public static final String URI_LOGIN_CHK = "/login_chk";
	public static final String URI_LOGIN_CHK_FULL = member_default + URI_LOGIN_CHK;
	// 회원가입
	public static final String URI_JOIN_VIEW = "/view_join";
	public static final String URI_JOIN_VIEW_FULL = member_default + URI_JOIN_VIEW;

	// 회원가입 버튼
	public static final String URI_JOIN_CHK = "/join_chk";
	public static final String URI_JOIN_CHK_FULL = member_default + URI_JOIN_CHK;

	public static final String URI_JOIN_IDCHK = "/idchk";
	public static final String URI_JOIN_IDCHK_FULL = member_default + URI_JOIN_IDCHK;

	// 회원탈퇴 페이지
	public static final String URI_DELETE_MEMBER = "/deletemember";
	public static final String URI_DELETE_MEMBER_FULL = mypage_default+member_default + URI_DELETE_MEMBER;

	// 회원탈퇴
	public static final String URI_DELETE_MEMBER_CHK = "/deletemember_chk";
	public static final String URI_DELETE_MEMBER_CHK_FULL = mypage_default+member_default + URI_DELETE_MEMBER_CHK;

	// 회원정보 수정 페이지
	public static final String URI_UPDATE_MEMBER = "/update_mem";
	public static final String URI_UPDATE_MEMBER_FULL = mypage_default + member_default + URI_UPDATE_MEMBER;

	public static final String URI_UPDATE_MEMBER_FIRST = "/update_mem_first";
	public static final String URI_UPDATE_MEMBER_FIRST_FULL = mypage_default + member_default + URI_UPDATE_MEMBER_FIRST;

	// 회원정보 수정 체크
	public static final String URI_UPDATE_MEMBER_CHK = "/update_mem_chk";
	public static final String URI_UPDATE_MEMBER_CHK_FULL = mypage_default + member_default + URI_UPDATE_MEMBER_CHK;

	// 회원정보 비번 수정 페이지
	public static final String URI_UPDATE_MEMBER_PW_PAGE = "/update_mem_pw_page";
	public static final String URI_UPDATE_MEMBER_PW_PAGE_FULL = mypage_default + member_default
			+ URI_UPDATE_MEMBER_PW_PAGE;
	// 회원정보 비번 확인
	public static final String URI_UPDATE_MEMBER_PW_CHK = "/update_mem_pw_chk";
	public static final String URI_UPDATE_MEMBER_PW_CHK_FULL = mypage_default + member_default
			+ URI_UPDATE_MEMBER_PW_CHK;

	// 회원정보 비번 수정
	public static final String URI_UPDATE_MEMBER_PW = "/update_mem_pw";
	public static final String URI_UPDATE_MEMBER_PW_FULL = mypage_default + member_default + URI_UPDATE_MEMBER_PW;

	// 마이페이지 회원관리 페이지
	public static final String URI_MYPAGE_MEMBER = "/mypage_member";
	public static final String URI_MYPAGE_MEMBER_FULL = mypage_default + member_default + URI_MYPAGE_MEMBER;

	// 팔로워 리스트 페이지
	public static final String URI_MYPAGE_MEMBER_FOLLOWER = "/follower";
	public static final String URI_MYPAGE_MEMBER_FOLLOWER_FULL = mypage_default + member_default + URI_MYPAGE_MEMBER_FOLLOWER;
	// 팔로잉 리스트 페이지
	public static final String URI_MYPAGE_MEMBER_FOLLOWING = "/following";
	public static final String URI_MYPAGE_MEMBER_FOLLOWING_FULL = mypage_default + member_default
			+ URI_MYPAGE_MEMBER_FOLLOWING;
	
	//회원 프로필사진 업로드
	public static final String URI_MYPAGE_MEMBER_IMAGE ="/upload";
	public static final String URI_MYPAGE_MEMBER_IMAGE_FULL = mypage_default+member_default + URI_MYPAGE_MEMBER_IMAGE;
	
	//언팔 -> 팔로우
	public static final String URI_MYPAGE_FOLLOW_CHK="/follow_chk";
	public static final String URI_MYPAGE_FOLLOW_CHK_FULL= mypage_default+member_default + URI_MYPAGE_FOLLOW_CHK;
	
	//새로 팔로우하기
	public static final String URI_MYPAGE_NEW_FOLLOW="/new_follow";
	public static final String URI_MYPAGE_NEW_FOLLOW_FULL= mypage_default+member_default + URI_MYPAGE_NEW_FOLLOW;
	
	//언팔하기
	public static final String URI_MYPAGE_DEL_FOLLOW="/del_follow";
	public static final String URI_MYPAGE_DEL_FOLLOW_FULL= mypage_default+member_default + URI_MYPAGE_DEL_FOLLOW;
	
	// 가구스크랩
	public static final String URI_FURNITURE_SCRAP = "/furniture_scrap";
	public static final String URI_FURNITURE_SCRAP_FULL = mypage_scrap_default + URI_FURNITURE_SCRAP;

	// 가구스크랩 삭제
	public static final String URI_FURNITURE_SCRAP_DELETE = "/furniture_scrap_delete";
	public static final String URI_FURNITURE_SCRAP_DELETE_FULL = mypage_scrap_default + URI_FURNITURE_SCRAP_DELETE;

	// 가구배치도스크랩
	public static final String URI_FURNITURE_ARR_SCRAP = "/furniture_arr_scrap";
	public static final String URI_FURNITURE_ARR_SCRAP_FULL = mypage_scrap_default + URI_FURNITURE_ARR_SCRAP;

	// 가구배치도스크랩 삭제
	public static final String URI_FURNITURE_ARR_SCRAP_DELETE = "/fur_arr_scrap_delete";
	public static final String URI_FURNITURE_ARR_SCRAP_DELETE_FULL = mypage_scrap_default + URI_FURNITURE_ARR_SCRAP_DELETE;

	// Main Button
	public static final String URI_MAIN_HOME = "/";
	public static final String URI_MAIN_TO_LIST = "/list";
	public static final String URI_MAIN_TO_ARR = "/arrange";
	public static final String URI_MAIN_TO_RECOM = "/recommend";
	public static final String URI_MAIN_TO_MYPAGE = mypage_default;
	// 가구 상세보기 페이지
	public static final String URI_FURNITURE_DETAIL = "/detail";
	public static final String URI_FURNITURE_DETAIL_FULL = furniture_default + URI_FURNITURE_DETAIL;
	// 가구 상세페이지 좋아요 리스트 보기
	public static final String URI_FURNITURE_DETAIL_GOOD_LIST = "/mongofurgoodlistajax";
	public static final String URI_FURNITURE_DETAIL_GOOD_LIST_U = URI_FURNITURE_DETAIL + URI_FURNITURE_DETAIL_GOOD_LIST;
	public static final String URI_FURNITURE_DETAIL_GOOD_LIST_FULL = URI_FURNITURE_DETAIL_FULL + URI_FURNITURE_DETAIL_GOOD_LIST;
	// 가구 상세페이지 댓글 리스트 보기
	public static final String URI_FURNITURE_DETAIL_REPL_LIST = "/mongofurrepllistajax";
	public static final String URI_FURNITURE_DETAIL_REPL_LIST_FULL = furniture_default + URI_FURNITURE_DETAIL_GOOD_LIST;
	// 가구 상세페이지 스크랩 리스트 보기
	public static final String URI_FURNITURE_DETAIL_SCRAP_LIST = "/furscraplist";
	public static final String URI_FURNITURE_DETAIL_SCRAP_LIST_U = URI_FURNITURE_DETAIL + URI_FURNITURE_DETAIL_SCRAP_LIST;
	public static final String URI_FURNITURE_DETAIL_SCRAP_LIST_FULL = URI_FURNITURE_DETAIL_FULL + URI_FURNITURE_DETAIL_SCRAP_LIST;

	// 가구 배치도 페이지
	public static final String URI_FURNITURE_WATCH = "/fur_arr";
	public static final String URI_FURNITURE_WATCH_FULL = furniture_arr_default + URI_FURNITURE_WATCH;
	
	//17-08-17
	//hashtag 검색
	public static final String URI_FURNITURE_HASHTAG = "/hashtag_search";
	public static final String URI_FURNITURE_HASHTAG_FULL = furniture_arr_default + URI_FURNITURE_HASHTAG;

	////////////////////////////////// 17-07-07
	////////////////////////////////// 11:43////////////////////////////////////////////////
	// 가구 구경 페이지
	// 가구리스트 구경
	public static final String URI_FURNITURE_LIST_LOOKAROUND_GET = "/fur_list_get";
	public static final String URI_FURNITURE_LIST_LOOKAROUND_GET_FULL = furniture_default
			+ URI_FURNITURE_LIST_LOOKAROUND_GET;

	// 가구 좋아요 업
	public static final String URI_FURNITURE_GOOD_UP = "/fur_good_up";
	public static final String URI_FURNITURE_GOOD_UP_FULL = furniture_default + URI_FURNITURE_GOOD_UP;

	// 가구 댓글 작성
	public static final String URI_FURNITURE_REPLY_WRITE = "/fur_reply_write";
	public static final String URI_FURNITURE_REPLY_WRITE_FULL = furniture_default + URI_FURNITURE_REPLY_WRITE;

	// 가구 댓글 리스트
	public static final String URI_FURNITURE_REPLY_LIST = "/fur_reply_list";
	public static final String URI_FURNITURE_REPLY_LIST_FULL = furniture_default + URI_FURNITURE_REPLY_LIST;

	// 가구 댓글 삭제
	public static final String URI_FURNITURE_REPLY_DELETE = "/fur_reply_delete";
	public static final String URI_FURNITURE_REPLY_DELETE_FULL = furniture_default + URI_FURNITURE_REPLY_DELETE;

	// 가구 스크랩~~~
	public static final String URI_FURNITURE_FUR_SCRAP_FULL = furniture_default + URI_FURNITURE_SCRAP;
	public static final String URI_FURNITURE_DETAIL_REDIRECT = URI_MAIN_REDIRECT + URI_FURNITURE_DETAIL_FULL;

	//////// 준병 17-07-11 16:57/////////////////////
	// 가구배치도 상세페이지 관련

	// 가구배치도 상세 페이지
	public static final String URI_FURNITURE_ARR_DETAIL_VIEW = "/fur_arr_detail";
	public static final String URI_FURNITURE_ARR_DETAIL_VIEW_FULL = furniture_arr_default
			+ URI_FURNITURE_ARR_DETAIL_VIEW;

	// 가구배치도 좋아요
	public static final String URI_FURNITURE_ARR_GOOD_UP = "/fur_arr_good_up";
	public static final String URI_FURNITURE_ARR_GOOD_UP_FULL = furniture_arr_default + URI_FURNITURE_ARR_GOOD_UP;

	// 가구배치도 좋아요 목록
	public static final String URI_FURNITURE_ARR_GOOD_LIST = "/fur_arr_good_list";
	public static final String URI_FURNITURE_ARR_GOOD_LIST_FULL = furniture_arr_default + URI_FURNITURE_ARR_GOOD_LIST;

	// 가구배치도 댓글 작성
	public static final String URI_FURNITURE_ARR_REPLY_WRITE = "/fur_arr_reply_write";
	public static final String URI_FURNITURE_ARR_REPLY_WRITE_FULL = furniture_arr_default
			+ URI_FURNITURE_ARR_REPLY_WRITE;

	// 가구배치도 댓글 삭제
	public static final String URI_FURNITURE_ARR_REPLY_DELETE = "/fur_arr_reply_delete";
	public static final String URI_FURNITURE_ARR_REPLY_DELETE_FULL = furniture_arr_default
			+ URI_FURNITURE_ARR_REPLY_DELETE;

	// 가구배치도 스크랩 하기
	public static final String URI_FURNITURE_ARR_SCRAP_ADD = "/fur_arr_scrap_add";
	public static final String URI_FURNITURE_ARR_SCRAP_ADD_FULL = furniture_arr_default + URI_FURNITURE_ARR_SCRAP_ADD;
	
	// 가구배치도스크랩 리스트 보기 --17.07.26 수정 추가
	public static final String URI_FURNITURE_ARR_DETAIL_SCRAP_LIST = "/furarrscraplist";
	public static final String URI_FURNITURE_ARR_DETAIL_SCRAP_LIST_FULL = furniture_arr_default + URI_FURNITURE_ARR_DETAIL_SCRAP_LIST;

	
	//마이페이지 나의 배치도 부분
	public static final String URI_MYPAGE_MYFURARR  = "/myfurarr";
	public static final String URI_MYPAGE_MYFURARR_FULL =  mypage_default + member_default + URI_MYPAGE_MYFURARR;
	
	//마이페이지 내방보기 부분
	public static final String URI_MYPAGE_MYROOM  = "/myroom";
	public static final String URI_MYPAGE_MYROOM_FULL =  room_default + URI_MYPAGE_MYROOM;
	
	//팔로우 회원 배치도 가져오기
	public static final String URI_FOLLOW_FURARR = "/folfurarr";
	public static final String URI_FOLLOW_FURARR_FULL = mypage_default + member_default + URI_FOLLOW_FURARR;
	
	
	////////진섭 17-07-21 /////////////////////
	// 방생성 관련
	//private static final String room_default="/room";
	public static final String URI_ROOMMAKE_INCLUDE = "/roomMake_Include";
	public static final String URI_ROOMMAKE_INCLUDE_FULL = room_default+URI_ROOMMAKE_INCLUDE;
	
	public static final String URI_ROOMMAKE_PROGRESS_BUTTON1 = "/roomMake_Progress_Button1";
	public static final String URI_ROOMMAKE_PROGRESS_BUTTON1_FULL = room_default+URI_ROOMMAKE_PROGRESS_BUTTON1;
	
	public static final String URI_ROOMMAKE_SELECT_FIGURE = "/roomMake_Select_Figure";
	public static final String URI_ROOMMAKE_SELECT_FIGURE_FULL = room_default+URI_ROOMMAKE_SELECT_FIGURE;
	
	public static final String URI_ROOMMAKE_PROGRESS_BUTTON2 = "/roomMake_Progress_Button2";
	public static final String URI_ROOMMAKE_PROGRESS_BUTTON2_FULL = room_default+URI_ROOMMAKE_PROGRESS_BUTTON2;
	
	public static final String URI_ROOMMAKE_CANVAS = "/roomMake_Canvas";
	public static final String URI_ROOMMAKE_CANVAS_FULL = room_default+URI_ROOMMAKE_CANVAS;
	
	public static final String URI_ROOMMAKE_PROGRESS_BUTTON3 = "/roomMake_Progress_Button3";
	public static final String URI_ROOMMAKE_PROGRESS_BUTTON3_FULL = room_default+URI_ROOMMAKE_PROGRESS_BUTTON3;
	
	public static final String URI_ROOMMAKE_ROOMNAME = "/roomMake_roomName";
	public static final String URI_ROOMMAKEROOMNAE_FULL = room_default+URI_ROOMMAKE_ROOMNAME;
	
	public static final String URI_ROOMMAKE = "/roomMake";
	public static final String URI_ROOMMAKE_FULL = room_default+URI_ROOMMAKE;
	
}
