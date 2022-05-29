//active
active = false;
//complete
callbackFunction = noone;
//_ease
easeFunction = noone;
//_t
timeScale = 0;
//_time
framesElapsed = 0;
//_target
targetTime = 0;
//_finish
tweenFinish = false;
//type (0: PERSIST, 1: LOOPING, 2: ONESHOT)
tweenType = 0;

function Tween(_duration, _type = 0, _callback = noone, _ease = noone) {
	self.targetTime = _duration;
	self.tweenType = _type < 3 ? _type : 2;
	self.callbackFunction = _callback;
	self.easeFunction = _ease;
}

function start() {
	self.framesElapsed = 0;
	if(self.targetTime == 0) {
		self.active = false;
		return;
	}
	self.active = true;
}

function cancel() {
	self.active = false;
	instance_destroy(self.id);
}

function finish() {
	switch(self.tweenType) {
		case 0:
			self.framesElapsed = self.targetTime;
			self.active = false;
			break;
		case 1:
			self.framesElapsed %= self.targetTime;
			self.timeScale = self.framesElapsed / self.targetTime;
			if(is_method(self.easeFunction) && self.timeScale > 0 && self.timeScale < 1) self.timeScale = self.easeFunction(self.timeScale);
			self.start();
			break;
		case 2:
			self.framesElapsed = self.targetTime;
			self.active = false;
			instance_destroy(self.id);
			break;
	}
	self.tweenFinish = false;
	if(is_method(self.callbackFunction)) self.callbackFunction();
}

function getPercent() {
	return self.framesElapsed / self.targetTime;	
}

function setPercent(_val) {
	self.framesElapsed = self.targetTime * _val;	
}

function scale() {
	return self.timeScale;
}