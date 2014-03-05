package com.healthydoctor.view.home
{
	import ext.wm.feathers.FeaSprite;
	
	import feathers.controls.List;
	import feathers.controls.PageIndicator;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.layout.TiledRowsLayout;
	
	import starling.display.Quad;
	import starling.events.Event;
	
	public class AdPicBar extends FeaSprite
	{
		private var _list:List;
		private var _adCollection:ListCollection;
		private var _w:int;
		private var _h:int;
		private var _pageIndicator:PageIndicator;
		
		public function AdPicBar(w:int = 640, h:int = 150)
		{
			_w = w;
			_h = h;
			super();
		}
		
		override protected function initialize():void
		{
			var q:Quad = new Quad(_w,_h,0x4563f2);
			addChild(q);
			q.alpha = 0;
			
			createList();
		}
		
		private function createList():void
		{
			_adCollection = new ListCollection([{source:"/assets/ad/t1.png"},{source:"/assets/ad/t2.png"},{source:"/assets/ad/t3.png"}]);
			
			const listLayout:TiledRowsLayout = new TiledRowsLayout();
			listLayout.paging = TiledRowsLayout.PAGING_HORIZONTAL;
			listLayout.useSquareTiles = false;
			listLayout.tileHorizontalAlign = TiledRowsLayout.TILE_HORIZONTAL_ALIGN_CENTER;
			listLayout.horizontalAlign = TiledRowsLayout.HORIZONTAL_ALIGN_CENTER;
			listLayout.manageVisibility = true;
			
			this._list = new List();
			this._list.dataProvider = _adCollection;
			this._list.layout = listLayout;
			this._list.snapToPages = true;
			this._list.scrollBarDisplayMode = List.SCROLL_BAR_DISPLAY_MODE_NONE;
			this._list.horizontalScrollPolicy = List.SCROLL_POLICY_ON;
//			this._list.itemRendererType = AdPicItemRender;
			this._list.itemRendererFactory = tileListItemRendererFactory;
			this._list.addEventListener(Event.SCROLL, list_scrollHandler);
			this.addChild(this._list);
			
			this._pageIndicator = new PageIndicator();
			this._pageIndicator.direction = PageIndicator.DIRECTION_HORIZONTAL;
			this._pageIndicator.pageCount = 3;
			this._pageIndicator.gap = 3;
			this._pageIndicator.paddingTop = this._pageIndicator.paddingRight = this._pageIndicator.paddingBottom =
				this._pageIndicator.paddingLeft = 6;
			this._pageIndicator.addEventListener(Event.CHANGE, pageIndicator_changeHandler);
			this.addChild(this._pageIndicator);
			
			this._pageIndicator.width = _w;
			this._pageIndicator.validate();
			this._pageIndicator.y = _h - this._pageIndicator.height;
			
			this._list.itemRendererProperties.gap = 0;
			
			this._list.width = _w;
			this._list.height = _h;
			this._list.validate();
			
			this._pageIndicator.pageCount = this._list.horizontalPageCount;
		}
		
		protected function tileListItemRendererFactory():IListItemRenderer
		{
			var renderer:AdPicItemRender = new AdPicItemRender(null,_w,_h);
			return renderer;
		}
		
		protected function list_scrollHandler(event:Event):void
		{
			this._pageIndicator.selectedIndex = this._list.horizontalPageIndex;
		}
		
		protected function pageIndicator_changeHandler(event:Event):void
		{
			this._list.scrollToPageIndex(this._pageIndicator.selectedIndex, 0, this._list.pageThrowDuration);
		}
		
		override public function dispose():void
		{
			super.dispose();
		}
	}
}