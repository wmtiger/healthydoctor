package com.healthydoctor.view.manhome
{
	import com.healthydoctor.setting.Setting;
	import com.wow.mgr.GameMgr;
	import com.wow.setting.Setting;
	
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.layout.AnchorLayout;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class ManHomeScreen extends WmPanelScreen
	{
		private var _backBtn:Button;
		public function ManHomeScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();
			initHeader();
		}
		
		private function initHeader():void
		{
			this.headerProperties.title = "男神定制";
			
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