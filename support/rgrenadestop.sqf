if (_this select 2 == "HandGrenadeMuzzle" || _this select 2 == "MiniGrenadeMuzzle" || _this select 2 == "DIrectionalMineRemoteMuzzle" || _this select 2 == "DemoChargeMuzzle" || _this select 2 == "PipeBombMuzzle" || _this select 2 == "ClassicMineWireMuzzle" || _this select 2 == "DirectionalMineRangeMuzzle" || _this select 2 == "BoundingMineRangeMuzzle" || _this select 2 == "ClassicMineRangeMuzzle" || _this select 2 == "MineMuzzle") then
{
	deleteVehicle (_this select 6);
};