package com.healthydoctor.view.home.nearpage
{
	import ext.wm.feathers.FeaSprite;
	import com.healthydoctor.view.comps.TitleBar;
	
	public class NearPageView extends FeaSprite
	{
		private var _title:TitleBar;
		
		public function NearPageView()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_title = new TitleBar();
			addChild(_title);
			_title.setTitle('附近');
		}
	}
}