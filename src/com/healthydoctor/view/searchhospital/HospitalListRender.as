package com.healthydoctor.view.searchhospital
{
	import ext.wm.feathers.IRenderClickHandler;
	import ext.wm.feathers.WmListItemRender;
	
	import feathers.controls.Label;
	
	import starling.display.Quad;
	
	public class HospitalListRender extends WmListItemRender
	{
		private var _w:int;
		private var _h:int;
		private var _title:Label;
		private var _level:Label;
		private var _type:Label;
		
		public function HospitalListRender(handler:IRenderClickHandler=null,w:int = 640, h:int = 100)
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
			
			_level = new Label();
			addChild(_level);
			_level.touchable = false;
			
			_type = new Label();
			addChild(_type);
			_type.touchable = false;
		}
		
		override protected function commitData():void
		{
			if(data)
			{
				//				_img.source = data.source;
				_title.text = data.name + "";
				_level.text = data.level + "";
				_type.text = data.sp + "";
				
				_level.y = 30;
				_type.y = 60;
			}
		}
	}
}