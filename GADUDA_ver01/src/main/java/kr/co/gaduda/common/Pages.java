package kr.co.gaduda.common;

public class Pages {
	
	private static final String commons_path = "/Commons";
	private static final String detail_path = "/Detatil";
	private static final String join_path = "/Join";
	private static final String member_path="/Member";
	//private static final String login_path = "/Login";
	private static final String lookaround_path = "/LookAround";
	private static final String main_path = "/Main";
	private static final String mypage_path = "/MyPage";
	private static final String search_path = "/Search";
	private static final String furniture_path = "/Furniture";
	private static final String arrange_path="/Arrangement";
	
	
	private static final String follow_path = mypage_path + "/Follow";
	private static final String furniture_arr_path = mypage_path + "/FurnitureArr";
	private static final String furniture_arr_scrap_path = mypage_path + "/FurnitureArrScrap";
	private static final String furniture_scrap_path = mypage_path + "/FurnitureScrap";
	private static final String myinfo_path = mypage_path + "/MyInfo";
	private static final String room_path = mypage_path + "/Room";
	private static final String update_profile_path = mypage_path + "/UpdateProfile";
	
	public static final String VIEW_MAIN = main_path + "/main";
	
	public static final String VIEW_JOIN =  member_path +"/view_join";
	
	public static final String VIEW_LOGIN = member_path + "/view_login";
	
	public static final String VIEW_LOGIN_FAILED = member_path +"/view_login_failed";
	
	public static final String VIEW_DEL_MEMBER = member_path +"/view_del_member";
	
	public static final String VIEW_DEL_MEMBER_FAILED =member_path+"/view_del_member_failed";
	

	public static final String VIEW_FURNITURE_SCRAP_LIST = furniture_scrap_path +"/furnitureScrapList";

	public static final String VIEW_FURNITURE_ARR_SCRAP_LIST = furniture_arr_scrap_path + "/furnitureArrScrapList";
	
	public static final String VIEW_FURNITURE_DETAIL = "/furniture_detail";
	public static final String VIEW_FURNITURE_DETAIL_VIEW = furniture_path + VIEW_FURNITURE_DETAIL;
	
	public static final String VIEW_FURNITURE_WATCH_VIEW =arrange_path+"/view_watch";
	
	//가구구경 페이지뷰
	public static final String VIEW_FURNITURE_LIST = furniture_path + "/furnitureList";
	
}
