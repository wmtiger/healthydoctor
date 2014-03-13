package com.healthydoctor.view.searchhospital
{
	public interface ISearchHospitalScreen
	{
		function showAllHospitalList():void;
		
		function showHospitalListByLevel(level:String):void;
		
		function showHospitalListByClassType(type:String):void;
		
		function showHospitalById(id:String):void;
	}
}