package kr.co.gaduda.common;

public class Pages {

	private static final String commons_path = "/Commons";
	private static final String detail_path = "/Detatil";
	private static final String join_path = "/Join";
	private static final String member_path = "/Member";
	private static final String lookaround_path = "/LookAround";
	private static final String main_path = "/Main";
	private static final String mypage_path = "/MyPage";
	private static final String search_path = "/Search";
	private static final String furniture_path = "/Furniture";
	private static final String arrange_path = "/Arrangement";
	private static final String furniture_arr_path = "/FurnitureArr";

	private static final String design_room_path = "/Design_Room";
	private static final String design_room_Updata_path = "/Design_Room_Update";

	private static final String follow_path = mypage_path + "/Follow";
	private static final String my_page_furniture_arr_path = mypage_path + "/FurnitureArr";
	private static final String furniture_arr_scrap_path = mypage_path + "/FurnitureArrScrap";
	private static final String furniture_scrap_path = mypage_path + "/FurnitureScrap";
	private static final String myinfo_path = mypage_path + "/MyInfo";
	private static final String room_path = mypage_path + "/roomMake";
	private static final String update_profile_path = mypage_path + "/UpdateProfile";

	public static final String VIEW_MAIN = main_path + "/main";

	// 로그인/회원가입 관련 Page
	public static final String VIEW_JOIN = member_path + "/view_join";
	
	public static final String VIEW_LOGIN = member_path + "/view_login";
	
	public static final String VIEW_LOGIN_FAILED = member_path + "/view_login_failed";
	
	public static final String VIEW_DEL_MEMBER = member_path + "/view_del_member";

	public static final String VIEW_DEL_MEMBER_FAILED = member_path + "/view_del_member_failed";

	public static final String VIEW_UPDATE_MEMBER = myinfo_path + "/view_update_member";

	public static final String VIEW_UPDATE_MEMBER_PW = myinfo_path + "/view_update_member_pw";

	public static final String VIEW_UPDATE_MEMBER_FIRST = myinfo_path + "/view_update_member_first";

	public static final String VIEW_MYPAGE_MEMBER = myinfo_path + "/view_mypage_member";

	public static final String VIEW_MYPAGE_MEMBER_FOLLOWER = myinfo_path + "/view_show_follower";

	public static final String VIEW_MYPAGE_MEMBER_FOLLOWING = myinfo_path + "/view_show_following";

	//가구/가구배치도 스크랩 리스트
	public static final String VIEW_FURNITURE_SCRAP_LIST = furniture_scrap_path + "/furnitureScrapList";
	public static final String VIEW_FURNITURE_ARR_SCRAP_LIST = furniture_arr_scrap_path + "/furnitureArrScrapList";

	//가구 정보 확인하기
	public static final String VIEW_FURNITURE_DETAIL = "/furniture_detail";
	public static final String VIEW_FURNITURE_DETAIL_VIEW = furniture_path + VIEW_FURNITURE_DETAIL;
	
	//가구배치도 전체 보기
	public static final String VIEW_FURNITURE_WATCH_VIEW = furniture_arr_path + "/view_watch";
	
	//해시태그 검색
	public static final String VIEW_FURNITURE_HASH_VIEW = furniture_arr_path + "/hashtag_search";

	// 가구구경 페이지뷰
	public static final String VIEW_FURNITURE_LIST = furniture_path + "/furnitureList";

	// 가구배치도 상세 페이지 뷰
	public static final String VIEW_FURNITURE_ARR_DETAIL = furniture_arr_path + "/furniture_arr_detail";

	// 마이페이지 내 가구배치도 보기
	public static final String VIEW_MYFURARR = myinfo_path + "/view_mypage_myfurarr";
	// 마이페이지 내 방 보기
	public static final String VIEW_MYROOM = myinfo_path + "/view_mypage_myroom";

	// 팔로우 회원 가구배치도 보기
	public static final String VIEW_FOLFURARR = myinfo_path + "/view_follow_member_furarr";

	// private static final String room_path = mypage_path + "/RoomMake";

	public static final String VIEW_ROOMMAKE_INCLUDE = room_path + "/roomMake_Include";
	public static final String VIEW_ROOMMAKE_PROGRESS_BUTTON1 = room_path + "/roomMake_Progress_Button1";
	public static final String VIEW_ROOMMAKE_PROGRESS_BUTTON2 = room_path + "/roomMake_Progress_Button2";
	public static final String VIEW_ROOMMAKE_PROGRESS_BUTTON3 = room_path + "/roomMake_Progress_Button3";
	public static final String VIEW_ROOMMAKE_SELECT_FIGURE = room_path + "/roomMake_Select_Figure";
	public static final String VIEW_ROOMMAKE_CNAVAS = room_path + "/roomMake_Canvas";
	public static final String VIEW_ROOMMAKE_ROOMNAME = room_path + "/roomMake_RoomName";

	public static final String VIEW_DESIGNROOM_INCLUDE = design_room_path + "/designRoom_Include";
	public static final String VIEW_DESIGNROOM_CANVAS = design_room_path + "/designRoom_Canvas";
	public static final String VIEW_DESIGNROOM_SELECT = design_room_path + "/designRoom_Select";
	public static final String VIEW_DESIGNROOM_NAME = design_room_path + "/designRoom_Name";

	public static final String VIEW_DESIGNROOM_BUTTON1 = design_room_path + "/designRoom_Button1";
	public static final String VIEW_DESIGNROOM_BUTTON2 = design_room_path + "/designRoom_Button2";
	public static final String VIEW_DESIGNROOM_BUTTON3 = design_room_path + "/designRoom_Button3";
	
	
	public static final String VIEW_DESIGNROOM_UP_INCLUDE = design_room_Updata_path+ "/designRoom_Up_Include";
	public static final String VIEW_DESIGNROOM_UP_CANVAS = design_room_Updata_path+ "/designRoom_Up_Canvas";
	public static final String VIEW_DESIGNROOM_UP_BUTTON1 = design_room_Updata_path+ "/designRoom_Up_Button1";
	
	public static final String VIEW_DESIGNROOM_UP_NAME = design_room_Updata_path+ "/designRoom_Up_Name";
	public static final String VIEW_DESIGNROOM_UP_BUTTON2 = design_room_Updata_path+"/designRoom_Up_Button2";
	
	

	// main page
	public static final String VIEW_HOME = "/main";

	// error 페이지
	public static final String VIEW_ERROR = "/error";
	public static final String VIEW_NULL_ERROR = "/null_error";
	public static final String VIEW_ERROR_404 = "/404_error";

}
