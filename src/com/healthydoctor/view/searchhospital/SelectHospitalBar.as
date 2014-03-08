package com.healthydoctor.view.searchhospital
{
	import ext.wm.feathers.FeaSprite;
	
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.PickerList;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayoutData;
	
	import starling.display.Quad;
	import starling.events.Event;
	
	public class SelectHospitalBar extends FeaSprite
	{
		private var _bg:Quad;
		private var _allHospitalBtn:Button;// 全部
		private var _hospitalLevelList:PickerList;// 医院等级
		private var _spellList:PickerList;// 特色
		
		public function SelectHospitalBar()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_bg = new Quad(stage.stageWidth,60,0x0);
			addChild(_bg);
			
			_allHospitalBtn = new Button();
			_allHospitalBtn.label = "全部医院";
			_allHospitalBtn.addEventListener(Event.TRIGGERED, allButton_triggeredHandler);
			this.addChild(_allHospitalBtn);
			_allHospitalBtn.width = stage.stageWidth / 4;
			
			createHospitalList();
			createSpellList();
		}
		
		private function allButton_triggeredHandler():void
		{
			
		}
		
		private function createHospitalList():void
		{
			var items:Array = [{text: "三级甲等"},{text: "三级乙等"},{text: "二级甲等"}];
			this._hospitalLevelList = new PickerList();
			this._hospitalLevelList.prompt = "全部";
			this._hospitalLevelList.dataProvider = new ListCollection(items);
			this._hospitalLevelList.selectedIndex = -1;
			const listLayoutData:AnchorLayoutData = new AnchorLayoutData();
			listLayoutData.horizontalCenter = 0;
			listLayoutData.verticalCenter = 0;
			this._hospitalLevelList.layoutData = listLayoutData;
			this.addChild(this._hospitalLevelList);
			
			this._hospitalLevelList.typicalItem = { text: "全部" };
			this._hospitalLevelList.labelField = "text";
			
			this._hospitalLevelList.listFactory = function():List
			{
				var list:List = new List();
				list.typicalItem = { text: "全部" };
				list.itemRendererFactory = function():IListItemRenderer
				{
					var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
					renderer.labelField = "text";
					return renderer;
				};
				return list;
			};
			
			_hospitalLevelList.width = stage.stageWidth / 3;
			_hospitalLevelList.validate();
			_hospitalLevelList.x = _allHospitalBtn.x + _allHospitalBtn.width + 10;
			_hospitalLevelList.y = 60 - _hospitalLevelList.height >> 1;
		}
		
		private function createSpellList():void
		{
			var items:Array = [{text: "儿科"},{text: "妇科"},{text: "眼科"}];
			this._spellList = new PickerList();
			this._spellList.prompt = "全部";
			this._spellList.dataProvider = new ListCollection(items);
			this._spellList.selectedIndex = -1;
			const listLayoutData:AnchorLayoutData = new AnchorLayoutData();
			listLayoutData.horizontalCenter = 0;
			listLayoutData.verticalCenter = 0;
			this._spellList.layoutData = listLayoutData;
			this.addChild(this._spellList);
			
			this._spellList.typicalItem = { text: "全部" };
			this._spellList.labelField = "text";
			
			this._spellList.listFactory = function():List
			{
				var list:List = new List();
				list.typicalItem = { text: "全部" };
				list.itemRendererFactory = function():IListItemRenderer
				{
					var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
					renderer.labelField = "text";
					return renderer;
				};
				return list;
			};
			
			_spellList.width = stage.stageWidth / 3;
			_spellList.validate();
			_spellList.x = _hospitalLevelList.x + _hospitalLevelList.width + 10;
			_spellList.y = 60 - _spellList.height >> 1;
			
		}
	}
}