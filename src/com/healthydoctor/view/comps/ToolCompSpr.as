package com.healthydoctor.view.comps
{
	import ext.wm.feathers.FeaSprite;
	import ext.wm.feathers.IRenderClickHandler;
	
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.layout.TiledColumnsLayout;
	import feathers.layout.TiledRowsLayout;
	
	public class ToolCompSpr extends FeaSprite implements IRenderClickHandler
	{
		private var _title:Label;
		private var _list:List;
		private var _data:Object;
		
		public function ToolCompSpr()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_title = new Label();
			addChild(_title);
			
			const listLayout:TiledColumnsLayout = new TiledColumnsLayout();
			listLayout.paging = TiledColumnsLayout.PAGING_VERTICAL;
			listLayout.useSquareTiles = false;
			listLayout.tileVerticalAlign = TiledColumnsLayout.TILE_VERTICAL_ALIGN_MIDDLE;
			listLayout.verticalAlign = TiledColumnsLayout.VERTICAL_ALIGN_TOP;
			listLayout.tileHorizontalAlign = TiledColumnsLayout.TILE_HORIZONTAL_ALIGN_CENTER;
			listLayout.tileVerticalAlign = TiledColumnsLayout.TILE_VERTICAL_ALIGN_MIDDLE;
//			listLayout.verticalGap = 10;
			listLayout.gap = 20;
			listLayout.paddingTop = 10;
			listLayout.paddingRight = 15;
			listLayout.paddingBottom = 10;
			listLayout.paddingLeft = 15;
			listLayout.manageVisibility = true;
			
			this._list = new List();
			this._list.layout = listLayout;
			this._list.scrollBarDisplayMode = List.SCROLL_BAR_DISPLAY_MODE_NONE;
			this._list.verticalScrollPolicy = List.SCROLL_POLICY_ON;
//			this._list.itemRendererProperties.gap = 10;
			this._list.itemRendererFactory = tileListItemRendererFactory;
			this.addChild(this._list);
			_list.width = stage.stageWidth;
			_list.y = 40;
			_list.validate();
		}
		
		protected function tileListItemRendererFactory():IListItemRenderer
		{
			var renderer:ToolCompListRender = new ToolCompListRender(this,stage.stageWidth/2-40,80);
			return renderer;
		}
		
		public function set data(data:Object):void
		{
			if(_data == data)
				return;
			_data = data;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		public function get data():Object
		{
			return _data;
		}
		
		override protected function draw():void
		{
			super.draw();
			const dataInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_DATA);
			
			if(dataInvalid)
			{
				commitData();
			}
		}
		
		private function commitData():void
		{
			if(data)
			{
				_title.text = data.title + '';
				_list.dataProvider = new ListCollection(data.list);// {icon:url, title:xxx, callback:fun, callbackparams:null}
			}
		}
		
		public function clickItem(data:Object):void
		{
			if(data && data.callback)
			{
				data.callback.apply(null, data.callbackparams);
			}
		}
	}
}