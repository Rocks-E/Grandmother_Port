// Inherit the parent event
event_inherited();

//_r
red = 0;
//_g
green = 0;
//_b
blue = 0;
//_startA
startAlpha = 0;
//_startR
startRed = 0;
//_startG
startGreen = 0;
//_startB
startBlue = 0;
//_rangeA
rangeAlpha = 0;
//_rangeR
rangeRed = 0;
//_rangeG
rangeGreen = 0;
//_rangeB
rangeBlue = 0;

//alpha
image_alpha = 1.0;
//color
image_blend = 0;

function ColorTween(_callback = noone, _type = 0) {
	self.Tween(0, _type, _callback);
}

function tween(_duration, _fromColor, _toColor, _fromAlpha = 1, _toAlpha = 1, _easeFunction = noone) {

	//Remove alpha component
	_fromColor &= 0xFFFFFF;
	_toColor &= 0xFFFFFF;
	self.red = _fromColor >> 16 & 0xFF;
	self.green = _fromColor >> 8 & 0xFF;
	self.blue = _fromColor & 0xFF;
	self.startRed = self.red / 255;
	self.startGreen = self.green / 255;
	self.startBlue = self.blue / 255;
	self.rangeRed = ((_toColor >> 16 & 0xFF) / 255) - self.startRed;
	self.rangeGreen = ((_toColor >> 8 & 0xFF) / 255) - self.startGreen;
	self.rangeBlue = ((_toColor & 0xFF) / 255) - self.startBlue;
	self.startAlpha = _fromAlpha;
	self.image_alpha = _fromAlpha;
	self.image_blend = _fromColor;
	self.rangeAlpha = _toAlpha - _fromAlpha;
	self.targetTime = _duration;
	self.easeFunction = _easeFunction;
	self.start();

}

function rgb() {
	return (self.red << 16) | (self.green << 8) | (self.blue);	
}