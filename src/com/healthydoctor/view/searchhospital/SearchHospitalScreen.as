package com.healthydoctor.view.searchhospital
{
	import com.healthydoctor.setting.Setting;
	import com.healthydoctor.view.comps.ToolCompListRender;
	
	import ext.wm.feathers.IRenderClickHandler;
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayout;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class SearchHospitalScreen extends WmPanelScreen implements IRenderClickHandler
	{
		private var _backBtn:Button;
		private var _searchHosBar:SelectHospitalBar;
		
		private var _list:List;
		
		public function SearchHospitalScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();
			initHeader();
			
			_searchHosBar = new SelectHospitalBar();
			addChild(_searchHosBar);
			_searchHosBar.validate();
			
			_list = new List();
			_list.itemRendererFactory = listItemRendererFactory;
			addChild(_list);
			_list.y = _searchHosBar.y + _searchHosBar.height;
			_list.width = stage.stageWidth;
			_list.height = stage.stageHeight - _searchHosBar.y - _searchHosBar.height;
			
			var testData:Array = [{id:'1',name:'A医院',level:'三级甲等',sp:'儿科'},
				{id:'2',name:'B医院',level:'三级乙等',sp:'妇科'},
				{id:'3',name:'C医院',level:'三级甲等',sp:'眼科'}
			];
			_list.dataProvider = new ListCollection(testData);
		}
		
		protected function listItemRendererFactory():IListItemRenderer
		{
			var renderer:HospitalListRender = new HospitalListRender(this,stage.stageWidth,100);
			return renderer;
		}
		
		private function initHeader():void
		{
			this.headerProperties.title = "寻医";
			
			this._backBtn = new Button();
			this._backBtn.nameList.add(Button.ALTERNATE_NAME_BACK_BUTTON);
			this._backBtn.label = "后退";
			this._backBtn.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);
			
			this.headerProperties.leftItems = new <DisplayObject>
				[
					this._backBtn
				];
		}
		
		private function backButton_triggeredHandler(e:Event):void
		{
			this.dispatchEventWith(Setting.SHOW_HOME);
		}
		
		override protected function removeHeader():void {}
		
		public function clickItem(data:Object):void
		{
			
		}
	}
}