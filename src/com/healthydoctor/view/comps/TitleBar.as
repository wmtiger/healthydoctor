package com.healthydoctor.view.comps
{
	import ext.wm.feathers.FeaSprite;
	
	import feathers.controls.Label;
	
	import starling.display.Quad;
	
	public class TitleBar extends FeaSprite
	{
		private var _bg:Quad;
		private var _label:Label;
		
		public function TitleBar()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_bg = new Quad(stage.stageWidth,60,0x0);
			addChild(_bg);
			
			_label = new Label();
			addChild(_label);
		}
		
		public function setTitle(title:String):void
		{
			if(_label.text == '' + title)
				return;
			_label.text = '' + title;
			_label.validate();
			_label.x = stage.stageWidth - _label.width >> 1;
			_label.y = 60 - _label.height >> 1;
		}
	}
}