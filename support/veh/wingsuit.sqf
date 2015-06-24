_pos = getPosATL player;

//_glider = createVehicle ["FLAY_Wingsuit", _pos,[], 0, "FLY"];
_glider = "FLAY_Wingsuit" createVehicle _pos;
_glider setPosATL (player modelToWorld [0,1,0]);
_glider setDir (getDir player);

_vel = velocity _glider;
_dir = direction _glider;
_speed = 10;
_glider setVelocity [(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2)];

player moveindriver _glider;