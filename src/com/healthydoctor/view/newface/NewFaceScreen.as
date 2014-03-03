package com.healthydoctor.view.newface
{
	import com.healthydoctor.setting.Setting;
	
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.List;
	import feathers.controls.PageIndicator;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.layout.TiledRowsLayout;
	
	import starling.events.Event;

	public class NewFaceScreen extends WmPanelScreen
	{
		private var _list:List;
		private var _pageIndicator:PageIndicator;
		
		public function NewFaceScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			const collection:ListCollection = new ListCollection(
				[
					{ label: "第一页" },
					{ label: "第2页" },
					{ label: "第3页", cb: gotoHomeScreen, cbLabel: "开始体验" }
				]);
			
			const listLayout:TiledRowsLayout = new TiledRowsLayout();
			listLayout.paging = TiledRowsLayout.PAGING_HORIZONTAL;
			listLayout.useSquareTiles = false;
			listLayout.tileHorizontalAlign = TiledRowsLayout.TILE_HORIZONTAL_ALIGN_CENTER;
			listLayout.horizontalAlign = TiledRowsLayout.HORIZONTAL_ALIGN_CENTER;
			listLayout.manageVisibility = true;
			
			this._list = new List();
			this._list.dataProvider = collection;
			this._list.layout = listLayout;
			this._list.snapToPages = true;
			this._list.scrollBarDisplayMode = List.SCROLL_BAR_DISPLAY_MODE_NONE;
			this._list.horizontalScrollPolicy = List.SCROLL_POLICY_ON;
			this._list.itemRendererFactory = tileListItemRendererFactory;
			this._list.addEventListener(Event.SCROLL, list_scrollHandler);
			this.addChild(this._list);
			
			this._pageIndicator = new PageIndicator();
			this._pageIndicator.direction = PageIndicator.DIRECTION_HORIZONTAL;
			this._pageIndicator.pageCount = 1;
			this._pageIndicator.gap = 3;
			this._pageIndicator.paddingTop = this._pageIndicator.paddingRight = this._pageIndicator.paddingBottom =
				this._pageIndicator.paddingLeft = 6;
			this._pageIndicator.addEventListener(Event.CHANGE, pageIndicator_changeHandler);
			this.addChild(this._pageIndicator);
			
			this._pageIndicator.width = this.stage.stageWidth;
			this._pageIndicator.validate();
			this._pageIndicator.y = this.stage.stageHeight - this._pageIndicator.height;
			
//			const shorterSide:Number = Math.min(this.stage.stageWidth, this.stage.stageHeight);
//			const layout:TiledRowsLayout = TiledRowsLayout(this._list.layout);
//			layout.paddingTop = layout.paddingRight = layout.paddingBottom =
//				layout.paddingLeft = shorterSide * 0.06;
//			layout.gap = shorterSide * 0.04;
			
			this._list.itemRendererProperties.gap = 10;
			
			this._list.width = this.stage.stageWidth;
			this._list.height = this.stage.stageHeight;
//			this._list.height = this._pageIndicator.y;
			this._list.validate();
			
			this._pageIndicator.pageCount = this._list.horizontalPageCount;
		}
		
		protected function gotoHomeScreen():void
		{
			this.dispatchEventWith(Setting.SHOW_HOME);
		}
		
		protected function tileListItemRendererFactory():IListItemRenderer
		{
			const renderer:NewFacePageRender = new NewFacePageRender();
			renderer.width = stage.stageWidth;
			renderer.height = stage.stageHeight;
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