package kr.co.gaduda.common;

public class URLs {
	
	public static final String URI_MAIN = "../../";
	public static final String URI_MAIN_REDIRECT="redirect:/";
	
	private static final String member_default = "/member";
	private static final String mypage_default = "/mypage";
	private static final String furniture_default = "/furniture";
	private static final String furniture_arr_default = "/furniture_arr";
	
	//로그아웃
	public static final String URI_LOGOUT = "/logout";
	public static final String URI_LOGOUT_FULL = member_default + URI_LOGOUT;
	
	//로그인
	public static final String URI_LOGIN = "/login";
	public static final String URI_LOGIN_FULL = member_default + URI_LOGIN;
	
	//로그인 체크
	public static final String URI_LOGIN_CHK = "/login_chk";
	public static final String URI_LOGIN_CHK_FULL = member_default+URI_LOGIN_CHK;
	//회원가입
	public static final String URI_JOIN_VIEW= "/view_join";
	public static final String URI_JOIN_VIEW_FULL = member_default + URI_JOIN_VIEW;
		
	//회원가입 버튼 
	public static final String URI_JOIN_CHK="/join_chk";
	public static final String URI_JOIN_CHK_FULL = member_default+URI_JOIN_CHK;
	
	public static final String URI_JOIN_IDCHK="/idchk";
	public static final String URI_JOIN_IDCHK_FULL=member_default+URI_JOIN_IDCHK;
	
	//회원탈퇴 페이지
	public static final String URI_DELETE_MEMBER="/deletemember";
	public static final String URI_DELETE_MEMBER_FULL=member_default+URI_DELETE_MEMBER;
	
	//회원탈퇴
	public static final String URI_DELETE_MEMBER_CHK="/deletemember_chk";
	public static final String URI_DELETE_MEMBER_CHK_FULL=member_default+URI_DELETE_MEMBER_CHK;
	
	//가구스크랩
	public static final String URI_FURNITURE_SCRAP = "/furniture_scrap";
	public static final String URI_FURNITURE_SCRAP_FULL = mypage_default + URI_FURNITURE_SCRAP;
	
	//가구스크랩 삭제
	public static final String URI_FURNITURE_SCRAP_DELETE = "/furniture_scrap_delete";
	public static final String URI_FURNITURE_SCRAP_DELETE_FULL = mypage_default + URI_FURNITURE_SCRAP_DELETE;
	
	
	
	
}
