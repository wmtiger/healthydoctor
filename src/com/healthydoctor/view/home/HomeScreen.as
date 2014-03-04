package com.healthydoctor.view.home
{
	import ext.wm.feathers.WmPanelScreen;
	
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;
	
	public class HomeScreen extends WmPanelScreen implements IHomeScreen
	{
		private var _searchBar:SearchBar;
		
		public function HomeScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			_searchBar = new SearchBar();
			addChild(_searchBar);
		}
		
		public function getHomeScreenRoot():DisplayObjectContainer
		{
			return this;
		}
	}
}