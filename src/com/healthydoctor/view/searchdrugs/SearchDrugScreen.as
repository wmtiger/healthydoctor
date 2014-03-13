package com.healthydoctor.view.searchdrugs
{
	import com.healthydoctor.setting.Setting;
	import com.healthydoctor.view.searchhospital.SelectHospitalBar;
	
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.controls.TabBar;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class SearchDrugScreen extends WmPanelScreen
	{
		private var _backBtn:Button;
//		private var _searchDrugBar:SelectDrugBar;
		
		private var _tabBar:TabBar;
		
		public function SearchDrugScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();
			initHeader();
			
			this._tabBar = new TabBar();
			this._tabBar.dataProvider = new ListCollection(
				[
					{ label: "对症找药" },
					{ label: "常用药" }
				]);
			this._tabBar.addEventListener(Event.CHANGE, tabBar_changeHandler);
//			this._tabBar.layoutData = new AnchorLayoutData(NaN, 0, 0, 0);
			this.addChild(this._tabBar);
			
			_tabBar.selectedIndex = 0;
//			_searchDrugBar = new SelectDrugBar();
//			addChild(_searchDrugBar);
		}
		
		private function tabBar_changeHandler(event:Event):void
		{
			//			this._label.text = "selectedIndex: " + this._tabBar.selectedIndex.toString();
			if(this._tabBar.selectedIndex == 0)
			{
				showDiseaseDrugsPageView();
			}
			else if(this._tabBar.selectedIndex == 1)
			{
				showNormalDrugsPageView();
			}
		}
		
		private function showDiseaseDrugsPageView():void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function showNormalDrugsPageView():void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function initHeader():void
		{
			this.headerProperties.title = "问药";
			
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
		
	}
}