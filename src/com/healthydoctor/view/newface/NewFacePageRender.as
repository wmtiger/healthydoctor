package com.healthydoctor.view.newface
{
	import ext.wm.feathers.WmListItemRender;
	
	import feathers.controls.Button;
	
	import starling.display.Quad;
	import starling.events.Event;
	
	public class NewFacePageRender extends WmListItemRender
	{
		private var _btn:Button;
		
		public function NewFacePageRender()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			var q:Quad = new Quad(stage.stageWidth-10, stage.stageHeight-10);
			addChild(q);
			q.x = 5;
			q.y = 5;
			q.alpha = 0.2;
			
		}
		
		override protected function commitData():void
		{
			if(data && data.cb != null)
			{
				_btn = new Button();
				_btn.label = "" + data.cbLabel;
				_btn.addEventListener(Event.TRIGGERED, click_cb);
				this.addChild(_btn);
				_btn.x = stage.stageWidth - _btn.width >> 1;
				_btn.y = stage.stageHeight - 100;
			}
			if(data && itemLabel)
			{
				itemLabel.text = data.label;
				itemLabel.x = 100;
				itemLabel.y = 100;
				itemLabel.visible = true;
			}
		}
		
		private function click_cb(e:Event):void
		{
			data.cb.call();
		}
	}
}