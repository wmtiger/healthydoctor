package com.healthydoctor.view.home.userpage
{
	import com.healthydoctor.view.comps.TitleBar;
	
	import ext.wm.feathers.FeaSprite;
	
	public class UserPageView extends FeaSprite
	{
		private var _title:TitleBar;
		public function UserPageView()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_title = new TitleBar();
			addChild(_title);
			_title.setTitle('用户中心');
		}
	}
}