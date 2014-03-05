package com.healthydoctor.view.home
{
	import ext.wm.feathers.FeaSprite;
	
	import feathers.controls.Button;
	import feathers.controls.TextInput;
	import feathers.layout.AnchorLayoutData;
	
	import starling.events.Event;
	
	public class SearchTextField extends FeaSprite
	{
		private var _input:TextInput;
		private var _searchBtn:Button;
		
		public function SearchTextField()
		{
			super();
		}
		
		override protected function initialize():void
		{
			this._input = new TextInput();
			this._input.prompt = "输入关键字";
			this._input.isEditable = true;
			const inputLayoutData:AnchorLayoutData = new AnchorLayoutData();
			inputLayoutData.horizontalCenter = 0;
			inputLayoutData.verticalCenter = 0;
			this._input.layoutData = inputLayoutData;
			this.addChild(this._input);
			_input.validate();
			
			_searchBtn = new Button();
			_searchBtn.label = "搜索";
			_searchBtn.addEventListener(Event.TRIGGERED, searchButton_triggeredHandler);
			this.addChild(_searchBtn);
			_searchBtn.x = _input.x + _input.width + 5;
		}
		
		private function searchButton_triggeredHandler():void
		{
			
		}
	}
}