package com.healthydoctor.view.searchhospital
{
	import com.healthydoctor.setting.Setting;
	
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.layout.AnchorLayout;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class SearchHospitalScreen extends WmPanelScreen
	{
		private var _backBtn:Button;
		private var _searchHosBar:SelectHospitalBar;
		
		public function SearchHospitalScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();
			initHeader();
			
			_searchHosBar = new SelectHospitalBar();
			addChild(_searchHosBar);
		}
		
		private function initHeader():void
		{
			this.headerProperties.title = "寻医";
			
			this._backBtn = new Button();
			this._backBtn.nameList.add(Button.ALTERNATE_NAME_BACK_BUTTON);
			this._backBtn.label = "后退";
			this._backBtn.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);
			
			this.headerProperties.leftItems = new <DisplayObject>
				[
					this._backBtn
				];
		}
		
		private function backButton_triggeredHandler(e:Event):void
		{
			this.dispatchEventWith(Setting.SHOW_HOME);
		}
		
		override protected function removeHeader():void {}
		
	}
}