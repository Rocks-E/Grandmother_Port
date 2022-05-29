// Inherit the parent event
event_inherited();

//_fromX
fromX = 0;
//_fromY
fromY = 0;
//_moveX
moveX = 0;
//_moveY
moveY = 0;
//_distance
dist = -1;

function LinearMotion(_callback = noone, _type = 0) {
	self.Tween(0, _type, _callback);
}

function setMotion(_fromX, _fromY, _toX, _toY, _duration, _easeFunction) {
	self.dist = -1;
	self.fromX = _fromX;
	self.x = _fromX;
	self.fromY = _fromY;
	self.y = _fromY;
	self.moveX = _toX - _fromX;
	self.moveY = _toY - _fromY;
	self.targetTime = _duration;
	self.easeFunction = _easeFunction;
	self.start();
}

function setMotionSpeed(_fromX, _fromY, _toX, _toY, _speed, _easeFunction = noone) {
	self.dist = -1;
	self.fromX = _fromX;
	self.x = _fromX;
	self.fromY = _fromY;
	self.y = _fromY;
	self.moveX = _toX - _fromX;
	self.moveY = _toY - _fromY;
	self.targetTime = self.distance() / _speed;
}

function distance() {
	if(self.dist < 0) {
		self.dist = sqrt(self.moveX * self.moveX + self.moveY * self.moveY);
	}
	return self.dist;
}