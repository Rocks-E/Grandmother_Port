if(self.active) {
	
	self.framesElapsed++;
	self.timeScale = self.framesElapsed / self.targetTime;
	
	if(is_method(self.easeFunction) && self.timeScale > 0 && self.timeScale < 1) self.timeScale = self.easeFunction(self.timeScale);
	if(self.framesElapsed >= self.targetTime) {
		self.timeScale = 1;
		self.tweenFinish = true;
	}
	
	self.currentValue = self.startVal + self.range * self.timeScale;
	
	if(self.tweenFinish) {
		self.finish();
	}
	
}