package com.healthydoctor.view.home
{
	import ext.wm.feathers.FeaSprite;
	
	import feathers.controls.TextInput;
	import feathers.layout.AnchorLayoutData;
	
	public class SearchTextField extends FeaSprite
	{
		private var _input:TextInput;
		
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
		}
	}
}