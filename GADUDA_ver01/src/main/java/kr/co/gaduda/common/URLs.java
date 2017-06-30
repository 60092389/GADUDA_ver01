package kr.co.gaduda.common;

public class URLs {
	
	public static final String URI_MAIN = "../../";
	
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
	
	
	//가구스크랩
	public static final String URI_FURNITURE_SCRAP = "/furniture_scrap";
	public static final String URI_FURNITURE_SCRAP_FULL = mypage_default + URI_FURNITURE_SCRAP;
	
	//가구스크랩 삭제
	public static final String URI_FURNITURE_SCRAP_DELETE = "/furniture_scrap_delete";
	public static final String URI_FURNITURE_SCRAP_DELETE_FULL = mypage_default + URI_FURNITURE_SCRAP_DELETE;
	
	
}
