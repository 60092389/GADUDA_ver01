package kr.co.gaduda.common;

public class URLs {

	public static final String URI_MAIN = "../../";
	public static final String URI_MAIN_REDIRECT = "redirect:/";

	private static final String member_default = "/member";
	private static final String mypage_default = "/mypage";
	private static final String furniture_default = "/furniture";

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
	public static final String URI_DELETE_MEMBER_FULL = member_default + URI_DELETE_MEMBER;

	// 회원탈퇴
	public static final String URI_DELETE_MEMBER_CHK = "/deletemember_chk";
	public static final String URI_DELETE_MEMBER_CHK_FULL = member_default + URI_DELETE_MEMBER_CHK;

	// 가구스크랩
	public static final String URI_FURNITURE_SCRAP = "/furniture_scrap";
	public static final String URI_FURNITURE_SCRAP_FULL = mypage_default + URI_FURNITURE_SCRAP;

	// 가구스크랩 삭제
	public static final String URI_FURNITURE_SCRAP_DELETE = "/furniture_scrap_delete";
	public static final String URI_FURNITURE_SCRAP_DELETE_FULL = mypage_default + URI_FURNITURE_SCRAP_DELETE;

	// 가구배치도스크랩
	public static final String URI_FURNITURE_ARR_SCRAP = "/furniture_arr_scrap";
	public static final String URI_FURNITURE_ARR_SCRAP_FULL = mypage_default + URI_FURNITURE_ARR_SCRAP;

	// 가구배치도스크랩 삭제
	public static final String URI_FURNITURE_ARR_SCRAP_DELETE = "/fur_arr_scrap_delete";
	public static final String URI_FURNITURE_ARR_SCRAP_DELETE_FULL = mypage_default + URI_FURNITURE_ARR_SCRAP_DELETE;

	// Main Button
	public static final String URI_MAIN_HOME = "/";
	public static final String URI_MAIN_TO_LIST = "/list";
	public static final String URI_MAIN_TO_ARR = "/arrange";
	public static final String URI_MAIN_TO_WATCH = "/watch";
	public static final String URI_MAIN_TO_RECOM = "/recommend";
	public static final String URI_MAIN_TO_MYPAGE = mypage_default;
	// 가구 상세보기 페이지
	public static final String URI_FURNITURE_DETAIL = "/detail";
	public static final String URI_FURNITURE_DETAIL_FULL = furniture_default + URI_FURNITURE_DETAIL;
	// 가구 상세페이지 좋아요 리스트 보기
	public static final String URI_FURNITURE_DETAIL_GOOD_LIST = "/mongofurgoodlistajax";
	public static final String URI_FURNITURE_DETAIL_GOOD_LIST_FULL = URI_FURNITURE_DETAIL
			+ URI_FURNITURE_DETAIL_GOOD_LIST;
	// 가구 상세페이지 댓글 리스트 보기
	public static final String URI_FURNITURE_DETAIL_REPL_LIST = "/mongofurrepllistajax";
	public static final String URI_FURNITURE_DETAIL_REPL_LIST_FULL = furniture_default + URI_FURNITURE_DETAIL_GOOD_LIST;
	// 가구 상세페이지 스크랩 리스트 보기
	public static final String URI_FURNITURE_DETAIL_SCRAP_LIST = "/furscraplist";
	public static final String URI_FURNITURE_DETAIL_SCRAP_LIST_U = URI_FURNITURE_DETAIL
			+ URI_FURNITURE_DETAIL_SCRAP_LIST;
	public static final String URI_FURNITURE_DETAIL_SCRAP_LIST_FULL = URI_FURNITURE_DETAIL_FULL
			+ URI_FURNITURE_DETAIL_SCRAP_LIST;

	// 가구 배치도 페이지
	public static final String URI_FURNITURE_WATCH = "/fur_arr";
	public static final String URI_FURNITURE_WATCH_FULL = URI_MAIN_TO_WATCH + URI_FURNITURE_WATCH;

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

}
