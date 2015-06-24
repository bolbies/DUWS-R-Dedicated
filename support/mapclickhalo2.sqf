_position = _this select 0;

_marker = format["jump",_position]; // Define marker name
_markerstr = createMarker [str(_marker), _position];
_markerstr setMarkerShape "ICON";
str(_marker) setMarkerType "hd_end";
str(_marker) setMarkerColor "ColorGreen";
str(_marker) setMarkerText "JUMP";

clickedPos = _position;
TakeOff = true;

sleep 120;

deleteMarker str(_marker);