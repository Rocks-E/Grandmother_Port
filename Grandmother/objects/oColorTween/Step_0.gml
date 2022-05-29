if(self.active) {
	self.framesElapsed++;
	self.timeScale = self.framesElapsed / self.targetTime;
	if(is_method(self.easeFunction) && self.timeScale > 0 && self.timeScale < 1) self.timeScale = self.easeFunction(timeScale);
	if(self.framesElapsed >= self.targetTime) {
		self.timeScale = 1;
		self.tweenFinish = true;
	}
	
	self.image_alpha = self.startAlpha + self.rangeAlpha * self.timeScale;
	self.red = (self.startRed + self.rangeRed * self.timeScale) * 255;
	self.green = (self.startGreen + self.rangeGreen * self.timeScale) * 255;
	self.blue = (self.startBlue + self.rangeBlue * self.timeScale) * 255;
	self.image_blend = self.rgb();
	
	if(self.tweenFinish) {
		self.finish();
	}

}