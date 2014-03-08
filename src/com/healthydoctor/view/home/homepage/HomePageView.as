package com.healthydoctor.view.home.homepage
{
	
	import com.healthydoctor.setting.Setting;
	import com.healthydoctor.view.home.IHomeScreen;
	
	import ext.wm.feathers.FeaSprite;
	
	import feathers.controls.Button;
	
	import starling.events.Event;
	
	public class HomePageView extends FeaSprite
	{
		private var _searchBar:SearchBar;
		private var _adPic:AdPicBar;
		
		private var _manBtn:Button;
		private var _womanBtn:Button;
		private var _searchHospitalBtn:Button;
		private var _askDrugsBtn:Button;
		private var _examinationBtn:Button;
		private var _toolsBtn:Button;
		
		private var _handler:IHomeScreen;
		
		public function HomePageView(handler:IHomeScreen)
		{
			_handler = handler;
			super();
		}
		
		override protected function initialize():void
		{
			_searchBar = new SearchBar();
			addChild(_searchBar);
			
			_adPic = new AdPicBar(stage.stageWidth,200);
			addChild(_adPic);
			_adPic.y = 60;
			
			_manBtn = new Button();
			_manBtn.label = "男神";
			_manBtn.addEventListener(Event.TRIGGERED, manButton_triggeredHandler);
			this.addChild(_manBtn);
			_manBtn.x = 50;
			_manBtn.y = 320;
			_manBtn.width = 150;
			_manBtn.height = 150;
			
			_womanBtn = new Button();
			_womanBtn.label = "女神";
			_womanBtn.addEventListener(Event.TRIGGERED, womanButton_triggeredHandler);
			this.addChild(_womanBtn);
			_womanBtn.width = 150;
			_womanBtn.height = 150;
			_womanBtn.validate();
			_womanBtn.x = stage.stageWidth - _womanBtn.width - 50;
			_womanBtn.y = 320;
			
			_searchHospitalBtn = new Button();
			_searchHospitalBtn.label = "寻医";
			_searchHospitalBtn.addEventListener(Event.TRIGGERED, searchHospitalHandler);
			this.addChild(_searchHospitalBtn);
			_searchHospitalBtn.width = 100;
			_searchHospitalBtn.validate();
			_searchHospitalBtn.x = 20;
			_searchHospitalBtn.y = 600;
			
			_askDrugsBtn = new Button();
			_askDrugsBtn.label = "问药";
			_askDrugsBtn.addEventListener(Event.TRIGGERED, askDrugsHandler);
			this.addChild(_askDrugsBtn);
			_askDrugsBtn.width = 100;
			_askDrugsBtn.validate();
			_askDrugsBtn.x = _searchHospitalBtn.x + _searchHospitalBtn.width + 20;
			_askDrugsBtn.y = 600;
			
			_examinationBtn = new Button();
			_examinationBtn.label = "体检";
			_examinationBtn.addEventListener(Event.TRIGGERED, examinationHandler);
			this.addChild(_examinationBtn);
			_examinationBtn.width = 100;
			_examinationBtn.validate();
			_examinationBtn.x = _askDrugsBtn.x + _askDrugsBtn.width + 20;
			_examinationBtn.y = 600;
			
			_toolsBtn = new Button();
			_toolsBtn.label = "工具";
			_toolsBtn.addEventListener(Event.TRIGGERED, toolsHandler);
			this.addChild(_toolsBtn);
			_toolsBtn.width = 100;
			_toolsBtn.validate();
			_toolsBtn.x = _examinationBtn.x + _examinationBtn.width + 20;
			_toolsBtn.y = 600;
		}
		
		private function manButton_triggeredHandler():void
		{
			_handler.showManScreen();
		}
		
		private function womanButton_triggeredHandler():void
		{
			_handler.showWomanScreen();
		}
		
		private function searchHospitalHandler():void
		{
			_handler.showSearchHospitalScreen();	
		}
		
		private function askDrugsHandler():void
		{
			_handler.showSearchDrugsScreen();
		}
		
		private function examinationHandler():void
		{
			_handler.showExaminationScreen();
		}
		
		private function toolsHandler():void
		{
			_handler.showToolsScreen();
		}
		
	}
}