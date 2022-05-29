// Inherit the parent event
event_inherited();

//_start
startVal = 0;
//_range
range = 0;

//value
currentValue = 0;

/*
_id -> [ID] Instance ID of whichever object has the variable to be tweened
[_callback] -> [Function] Callback function to run once tween is complete [NOTE: This MUST be specified using method(id, func)]
[_type] -> [Int] Determines behavior of the tween after completion (0: persist, 1: loop, 2: remove)

Ex: self.fadeTween = NumTween(self.id, method(self.id, self.fadeInCallback), 2);
This will prepare the object to run a tween.
The tween() function is used to set up the value to tween and to perform the actual tween itself.
On completion, the parent object will call the function "fadeInCallback".
*/
function NumTween(_callback = noone, _type = 0) {
	self.Tween(0, _type, _callback);
}

/*
_var -> [String] Name of the variable which should be tweened
_toValue -> [Number] The final value which should be reached for the given _var
_duration -> [Number] The number of frames the tween should run for
[_easeFunction] -> [Function] Which easing function should be used
					Can be supplied by scr_Ease or user defined
					Defaults to noone, performs a linear tween
					[NOTE: This MUST be specified using method(undefined, func)]
					
Ex: self.fadeTween.tween("image_alpha", 1, 4 * room_speed, method(undefined, bounceIn));
This will fade the image in from the current alpha value to 1 (full opacity) over 4 seconds.
It will be eased in using the bounceIn() function (defined in scr_Ease and found in net.flashpunk.utils.Ease)
*/
function tween(_fromValue, _toValue, _duration, _easeFunction = noone) {
	
	self.startValue = self.currentValue = _fromValue;
	
	self.range = _toValue - self.currentValue;
	self.targetTime = _duration;
	self.easeFunction = _easeFunction;
	self.start();
	
}