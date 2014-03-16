package com.healthydoctor.view.home.userpage
{
	import com.healthydoctor.view.comps.TitleBar;
	
	import ext.wm.feathers.FeaSprite;
	
	import feathers.controls.Button;
	import feathers.controls.TextInput;
	import feathers.layout.AnchorLayoutData;
	
	import starling.events.Event;
	
	public class UserPageView extends FeaSprite
	{
		private var _title:TitleBar;
		private var _input:TextInput;
		private var _inputPwd:TextInput;
		private var _normalButton:Button;
		private var _regButton:Button;
		
		public function UserPageView()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_title = new TitleBar();
			addChild(_title);
			_title.setTitle('用户中心');
			
			this._input = new TextInput();
			this._input.prompt = "Type Your Name";
			this._input.isEditable = true;
			const inputLayoutData:AnchorLayoutData = new AnchorLayoutData();
			inputLayoutData.horizontalCenter = 0;
			inputLayoutData.verticalCenter = 0;
			this._input.layoutData = inputLayoutData;
			this.addChild(this._input);
			_input.validate();
			_input.x = stage.stageWidth - _input.width >> 1;
			_input.y = 100;
			
			this._inputPwd = new TextInput();
			this._inputPwd.prompt = "";
			this._inputPwd.isEditable = true;
			this._inputPwd.displayAsPassword = true;
			const inputLayoutData1:AnchorLayoutData = new AnchorLayoutData();
			inputLayoutData1.horizontalCenter = 0;
			inputLayoutData1.verticalCenter = 0;
			this._inputPwd.layoutData = inputLayoutData1;
			this.addChild(this._inputPwd);
			_inputPwd.validate();
			_inputPwd.x = stage.stageWidth - _inputPwd.width >> 1;
			_inputPwd.y = 200;
			
			this._normalButton = new Button();
			this._normalButton.label = "登陆";
			this._normalButton.addEventListener(Event.TRIGGERED, normalButton_triggeredHandler);
			this.addChild(this._normalButton);
			_normalButton.validate();
			_normalButton.x = stage.stageWidth - _normalButton.width >> 1;
			_normalButton.y = 300;
			
			this._regButton = new Button();
			this._regButton.label = "注册";
			this._regButton.addEventListener(Event.TRIGGERED, regButton_triggeredHandler);
			this.addChild(_regButton);
			_regButton.validate();
			_regButton.x = stage.stageWidth - _regButton.width >> 1;
			_regButton.y = 400;
		}
		
		private function normalButton_triggeredHandler():void
		{
			
		}
		
		private function regButton_triggeredHandler():void
		{
			
		}
	}
}