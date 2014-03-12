package com.healthydoctor.view.manhome
{
	import com.healthydoctor.setting.Setting;
	import com.healthydoctor.view.comps.ToolCompSpr;
	
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.layout.AnchorLayout;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class ManHomeScreen extends WmPanelScreen
	{
		private var _backBtn:Button;
		
		private var _manTools:ToolCompSpr;
		private var _manKepu:ToolCompSpr;
		
		public function ManHomeScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();
			initHeader();
			
			var toolData:Array = [{icon:'', title:'计步器', callback:startup_jibuqi, callbackparams:null},
				{icon:'', title:'心理顾问', callback:startup_xinliguwen, callbackparams:null}];
			_manTools = new ToolCompSpr();
			addChild(_manTools);
			_manTools.data = {title:'男神神器', list:toolData};
			_manTools.validate();
			
			var kepuData:Array = [{icon:'', title:'男神生活', callback:startup_kepu, callbackparams:null},
				{icon:'', title:'男神操练', callback:startup_kepu, callbackparams:null},
				{icon:'', title:'追爱手册', callback:startup_kepu, callbackparams:null}];
			_manKepu = new ToolCompSpr();
			addChild(_manKepu);
			_manKepu.data = {title:'科普', list:kepuData};
			_manKepu.y = _manTools.y + _manTools.height + 50;
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
		
		public function startup_jibuqi():void
		{
			trace('startup_jibuqi');
		}
		
		public function startup_xinliguwen():void
		{
			trace('startup_xinliguwen');
		}
		
		public function startup_kepu():void
		{
			trace('startup_kepu');
		}
	}
}