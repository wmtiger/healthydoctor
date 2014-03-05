package com.healthydoctor.view.home
{
	import ext.wm.feathers.FeaSprite;
	
	import feathers.controls.Button;
	
	import starling.display.Quad;
	
	public class HomeMenuBar extends FeaSprite
	{
		private var _homeBtn:Button;
		
		public function HomeMenuBar()
		{
			super();
		}
		
		override protected function initialize():void
		{
			var q:Quad = new Quad(stage.stageWidth, 60 ,0x4563f2);
			addChild(q);
			q.alpha = 0;
			
			createBtns();
		}
		
		private function createBtns():void
		{
			
		}
	}
}