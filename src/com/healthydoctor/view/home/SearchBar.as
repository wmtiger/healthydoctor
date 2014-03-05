package com.healthydoctor.view.home
{
	import ext.wm.feathers.FeaSprite;
	
	import feathers.controls.List;
	import feathers.controls.PickerList;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayoutData;
	
	import starling.display.Quad;
	
	public class SearchBar extends FeaSprite
	{
		private var _cityList:PickerList;
		private var _typeList:PickerList;
		private var _searchText:SearchTextField;
		
		public function SearchBar()
		{
			super();
		}
		
		override protected function initialize():void
		{
			var q:Quad = new Quad(stage.stageWidth,60,0x4563f2);
			addChild(q);
			q.alpha = 0.5;
			
			createCityList();
			createTypeList();
			createSearchText();
		}
		
		private function createSearchText():void
		{
			_searchText = new SearchTextField();
			addChild(_searchText);
			
			_searchText.validate();
			_searchText.x = _typeList.x + _typeList.width + 10;
			_searchText.y = 60 - _searchText.height >> 1;
		}
		
		private function createTypeList():void
		{
			var items:Array = [{text: "医院"},{text: "药品"},{text: "病症"}];
			this._typeList = new PickerList();
			this._typeList.prompt = "医院";
			this._typeList.dataProvider = new ListCollection(items);
			this._typeList.selectedIndex = -1;
			const listLayoutData:AnchorLayoutData = new AnchorLayoutData();
			listLayoutData.horizontalCenter = 0;
			listLayoutData.verticalCenter = 0;
			this._typeList.layoutData = listLayoutData;
			this.addChild(this._typeList);
			
			this._typeList.typicalItem = { text: "医院" };
			this._typeList.labelField = "text";
			
			this._typeList.listFactory = function():List
			{
				var list:List = new List();
				list.typicalItem = { text: "医院" };
				list.itemRendererFactory = function():IListItemRenderer
				{
					var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
					renderer.labelField = "text";
					return renderer;
				};
				return list;
			};
			
			_typeList.validate();
			_typeList.x = _cityList.x + _cityList.width + 10;
			_typeList.y = 60 - _typeList.height >> 1;
		}
		
		private function createCityList():void
		{
			var items:Array = [{text: "杭州"},{text: "上海"},{text: "北京"}];
			this._cityList = new PickerList();
			this._cityList.prompt = "杭州";
			this._cityList.dataProvider = new ListCollection(items);
			this._cityList.selectedIndex = -1;
			const listLayoutData:AnchorLayoutData = new AnchorLayoutData();
			listLayoutData.horizontalCenter = 0;
			listLayoutData.verticalCenter = 0;
			this._cityList.layoutData = listLayoutData;
			this.addChild(this._cityList);
			
			this._cityList.typicalItem = { text: "杭州" };
			this._cityList.labelField = "text";
			
			this._cityList.listFactory = function():List
			{
				var list:List = new List();
				list.typicalItem = { text: "杭州" };
				list.itemRendererFactory = function():IListItemRenderer
				{
					var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
					renderer.labelField = "text";
					return renderer;
				};
				return list;
			};
			
			_cityList.validate();
			_cityList.x = 10;
			_cityList.y = 60 - _cityList.height >> 1;
			
		}
		
	}
}