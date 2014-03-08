package com.healthydoctor.setting
{
	public class Setting
	{
		public static const LOGIN:String = "login";// 登陆页面
		public static const NEW_FACE:String = "newFace";// 新版体验页面
		public static const HOME:String = "home";// 首页
		public static const CITY_LIST:String = "cityList";// 城市列表
		public static const SEARCH_RESULT:String = "searchResult";// 搜索结果界面
		public static const MAN_HOME:String = "manHome";// 男人主页
		public static const WOMAN_HOME:String = "womanHome";// 女人主页
		public static const SEARCH_HOSPITAL:String = "searchHospital";//寻医
		public static const SEARCH_DRUGS:String = "searchDrugs";//问药
		public static const EXAMINATION:String = "examination";//体检
		public static const TOOLS:String = "tools";//工具
		
		public static const SHOW_LOGIN:String = "showLogin";
		public static const SHOW_NEW_FACE:String = "showNewFace";
		public static const SHOW_HOME:String = "showHome";
		public static const SHOW_CITY_LIST:String = "showCityList";
		public static const SHOW_SEARCH_RESULT:String = "showSearchResult";
		public static const SHOW_MAN_HOME:String = "showManHome";
		public static const SHOW_WOMAN_HOME:String = "showWomanHome";
		public static const SHOW_SEARCH_HOSPITAL:String = "showSearchHospital";
		public static const SHOW_SEARCH_DRUGS:String = "showSearchDrugs";
		public static const SHOW_EXAMINATION:String = "showExamination";
		public static const SHOW_TOOLS:String = "showTools";
		
		public static var STAGE_WIDTH:int;
		public static var STAGE_HEIGHT:int;
		
		public static const LOGIN_EVENTS:Object =
			{
//				showCreateRole: CREATE_ROLE,
//				showBattleField: BATTLE_FIELD,
//				showUser: USER
			};
		public static const NEW_FACE_EVENTS:Object =
			{
				showLogin: LOGIN,
				showHome: HOME
			};
		public static const HOME_EVENTS:Object =
			{
				showManHome: MAN_HOME,
				showWomanHome: WOMAN_HOME,
				showSearchHospital: SEARCH_HOSPITAL,
				showSearchDrugs: SEARCH_DRUGS,
				showExamination: EXAMINATION,
				showTools: TOOLS
			};
		public static const MAN_HOME_EVENTS:Object =
			{
				showHome: HOME
			};
		public static const WOMAN_HOME_EVENTS:Object =
			{
				showHome: HOME
			};
		public static const SEARCH_HOSPITAL_EVENTS:Object =
			{
				showHome: HOME
			};
		public static const SEARCH_DRUGS_EVENTS:Object =
			{
				showHome: HOME
			};
		public static const EXAMINATION_EVENTS:Object =
			{
				showHome: HOME
			};
		public static const TOOLS_EVENTS:Object =
			{
				showHome: HOME
			};
		
		public function Setting()
		{
		}
	}
}

