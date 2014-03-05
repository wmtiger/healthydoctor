package com.healthydoctor.view.home
{
	import ext.wm.feathers.IRenderClickHandler;
	import ext.wm.feathers.WmListItemRender;
	
	import feathers.controls.ImageLoader;
	
	import starling.display.Quad;
	
	public class AdPicItemRender extends WmListItemRender
	{
		private var _img:ImageLoader;
		private var _w:int;
		private var _h:int;
		
		public function AdPicItemRender(handler:IRenderClickHandler=null, w:int = 640, h:int = 150)
		{
			_w = w;
			_h = h;
			super(handler);
		}
		
		override protected function createChildren():void
		{
			var q:Quad = new Quad(_w,_h,0x4563f2);
			addChild(q);
			q.alpha = 0;
			
			_img = new ImageLoader();
			addChild(_img);
		}
		
		override protected function commitData():void
		{
			if(data)
			{
				trace(data.source);
				_img.source = data.source;
			}
		}
	}
}