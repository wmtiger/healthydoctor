package com.healthydoctor.view.home
{
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.layout.AnchorLayout;
	
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;
	
	public class HomeScreen extends WmPanelScreen implements IHomeScreen
	{
		private var _searchBar:SearchBar;
		private var _adPic:AdPicBar;
		private var _manBtn:Button;
		private var _womanBtn:Button;
		
		public function HomeScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();
			
			_searchBar = new SearchBar();
			addChild(_searchBar);
			
			_adPic = new AdPicBar(stage.stageWidth);
			addChild(_adPic);
			_adPic.y = 60;
			
			_manBtn = new Button();
			_manBtn.label = "男神";
			_manBtn.addEventListener(Event.TRIGGERED, manButton_triggeredHandler);
			this.addChild(_manBtn);
			_manBtn.x = 50;
			_manBtn.y = 240;
			_manBtn.width = 100;
			_manBtn.height = 100;
			
			_womanBtn = new Button();
			_womanBtn.label = "女神";
			_womanBtn.addEventListener(Event.TRIGGERED, womanButton_triggeredHandler);
			this.addChild(_womanBtn);
			_womanBtn.width = 100;
			_womanBtn.height = 100;
			_womanBtn.validate();
			_womanBtn.x = stage.stageWidth - _womanBtn.width - 50;
			_womanBtn.y = 240;
		}
		
		private function manButton_triggeredHandler():void
		{
			
		}
		
		private function womanButton_triggeredHandler():void
		{
			
		}
		
		public function getHomeScreenRoot():DisplayObjectContainer
		{
			return this;
		}
	}
}