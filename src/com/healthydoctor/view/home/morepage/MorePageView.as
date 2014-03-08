package com.healthydoctor.view.home.morepage
{
	import com.healthydoctor.view.comps.TitleBar;
	
	import ext.wm.feathers.FeaSprite;
	
	public class MorePageView extends FeaSprite
	{
		private var _title:TitleBar;
		public function MorePageView()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_title = new TitleBar();
			addChild(_title);
			_title.setTitle('更多');
		}
	}
}