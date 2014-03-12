package com.healthydoctor.view.comps
{
	import ext.wm.feathers.IRenderClickHandler;
	import ext.wm.feathers.WmListItemRender;
	
	import feathers.controls.ImageLoader;
	import feathers.controls.Label;
	
	import starling.display.Quad;
	
	public class ToolCompListRender extends WmListItemRender
	{
		private var _w:int;
		private var _h:int;
//		private var _img:ImageLoader;
		private var _title:Label;
		
		public function ToolCompListRender(handler:IRenderClickHandler=null,w:int = 300, h:int = 80)
		{
			_w = w;
			_h = h;
			super(handler);
		}
		
		override protected function createChildren():void
		{
			var q:Quad = new Quad(_w,_h,0x4563f2);
			addChild(q);
			q.alpha = 0.2;
			
//			_img = new ImageLoader();
//			addChild(_img);
			
			_title = new Label();
			addChild(_title);
			_title.touchable = false;
		}
		
		override protected function commitData():void
		{
			if(data)
			{
//				_img.source = data.source;
				_title.text = data.title + "";
			}
		}
	}
}