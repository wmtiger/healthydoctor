package com.healthydoctor.view.home
{
	import com.healthydoctor.setting.Setting;
	import com.healthydoctor.view.home.homepage.HomePageView;
	import com.healthydoctor.view.home.morepage.MorePageView;
	import com.healthydoctor.view.home.nearpage.NearPageView;
	import com.healthydoctor.view.home.userpage.UserPageView;
	
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.TabBar;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	
	import starling.events.Event;
	
	public class HomeScreen extends WmPanelScreen implements IHomeScreen
	{
		private var _tabBar:TabBar;
		private var _homePageView:HomePageView;
		private var _nearPageView:NearPageView;
		private var _userPageView:UserPageView;
		private var _morePageView:MorePageView;
		
		public function HomeScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();
			
			this._tabBar = new TabBar();
			this._tabBar.dataProvider = new ListCollection(
				[
					{ label: "首页" },
					{ label: "附近" },
					{ label: "个人中心" },
					{ label: "更多" }
				]);
			this._tabBar.addEventListener(Event.CHANGE, tabBar_changeHandler);
			this._tabBar.layoutData = new AnchorLayoutData(NaN, 0, 0, 0);
			this.addChild(this._tabBar);
			
			_tabBar.selectedIndex = 0;
			showHomePageView();
		}
		
		protected function showHomePageView():void
		{
			if(_homePageView == null)
			{
				_homePageView = new HomePageView(this);
				addChild(_homePageView);
			}
			_homePageView.visible = true;
			if(_nearPageView)
				_nearPageView.visible = false;
			if(_userPageView)
				_userPageView.visible = false;
			if(_morePageView)
				_morePageView.visible = false;
		}
		
		protected function showNearPageView():void
		{
			if(_nearPageView == null)
			{
				_nearPageView = new NearPageView();
				addChild(_nearPageView);
			}
			_nearPageView.visible = true;
			if(_homePageView)
				_homePageView.visible = false;
			if(_userPageView)
				_userPageView.visible = false;
			if(_morePageView)
				_morePageView.visible = false;
		}
		
		protected function showUserPageView():void
		{
			if(_userPageView == null)
			{
				_userPageView = new UserPageView();
				addChild(_userPageView);
			}
			_userPageView.visible = true;
			if(_homePageView)
				_homePageView.visible = false;
			if(_nearPageView)
				_nearPageView.visible = false;
			if(_morePageView)
				_morePageView.visible = false;
		}
		
		protected function showMorePageView():void
		{
			if(_morePageView == null)
			{
				_morePageView = new MorePageView();
				addChild(_morePageView);
			}
			_morePageView.visible = true;
			if(_homePageView)
				_homePageView.visible = false;
			if(_nearPageView)
				_nearPageView.visible = false;
			if(_userPageView)
				_userPageView.visible = false;
		}
		
		private function tabBar_changeHandler(event:Event):void
		{
//			this._label.text = "selectedIndex: " + this._tabBar.selectedIndex.toString();
			if(this._tabBar.selectedIndex == 0)
			{
				showHomePageView();
			}
			else if(this._tabBar.selectedIndex == 1)
			{
				showNearPageView();
			}
			else if(this._tabBar.selectedIndex == 2)
			{
				showUserPageView();
			}
			else if(this._tabBar.selectedIndex == 3)
			{
				showMorePageView();
			}
			
		}
		
		public function showManScreen():void
		{
			this.dispatchEventWith(Setting.SHOW_MAN_HOME);
		}
		
		public function showWomanScreen():void
		{
			this.dispatchEventWith(Setting.SHOW_WOMAN_HOME);
		}
		
		public function showSearchHospitalScreen():void
		{
			this.dispatchEventWith(Setting.SHOW_SEARCH_HOSPITAL);
		}
		
		public function showSearchDrugsScreen():void
		{
			this.dispatchEventWith(Setting.SHOW_SEARCH_DRUGS);
		}
		
		public function showExaminationScreen():void
		{
			this.dispatchEventWith(Setting.SHOW_EXAMINATION);
		}
		
		public function showToolsScreen():void
		{
			this.dispatchEventWith(Setting.SHOW_TOOLS);
		}
		
	}
}