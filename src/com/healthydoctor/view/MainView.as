package com.healthydoctor.view
{
	
	import com.healthydoctor.setting.Setting;
	import com.healthydoctor.themes.HealthyDoctorTheme;
	import com.healthydoctor.view.login.LoginScreen;
	import com.healthydoctor.view.manhome.ManHomeScreen;
	import com.healthydoctor.view.newface.NewFaceScreen;
	import com.healthydoctor.view.womanhome.WomanHomeScreen;
	
	import feathers.controls.Drawers;
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.events.FeathersEventType;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	
	import starling.events.Event;
	
	public class MainView extends Drawers
	{
		private var _navigator:ScreenNavigator;
		private var _transitionManager:ScreenSlidingStackTransitionManager;
		private var _login:LoginScreen;
		
		public function MainView()
		{
			super();
			this.addEventListener(FeathersEventType.INITIALIZE, initializeHandler);
		}
		
		private function initializeHandler(event:Event):void
		{
			new HealthyDoctorTheme();
			
			this._navigator = new ScreenNavigator();
			this.content = this._navigator;
			
			this._transitionManager = new ScreenSlidingStackTransitionManager(this._navigator);
			this._transitionManager.duration = 0.4;
			
			this._navigator.addScreen(Setting.LOGIN, new ScreenNavigatorItem(LoginScreen, Setting.LOGIN_EVENTS));
			
			this._navigator.addScreen(Setting.NEW_FACE, new ScreenNavigatorItem(NewFaceScreen, Setting.NEW_FACE_EVENTS));
			
			this._navigator.addScreen(Setting.HOME, new ScreenNavigatorItem(NewFaceScreen, Setting.HOME_EVENTS));
			
			this._navigator.addScreen(Setting.MAN_HOME, new ScreenNavigatorItem(ManHomeScreen, Setting.MAN_HOME_EVENTS));
			
			this._navigator.addScreen(Setting.WOMAN_HOME, new ScreenNavigatorItem(WomanHomeScreen, Setting.WOMAN_HOME_EVENTS));
			
//			const idx:Object = {};
//			this._navigator.addScreen(Setting.CARD_MGR, new ScreenNavigatorItem(CardsMgrScreen, Setting.CARD_MGR_EVENTS, {selectedCardGroup:idx}));
			
			this._navigator.showScreen(Setting.NEW_FACE);
		}
	}
}

