if(self.active) {
	
	self.framesElapsed++;
	self.timeScale = self.framesElapsed / self.targetTime;
	if(noone != self.easeFunction && self.timeScale > 0 && self.timeScale < 1) self.timeScale = self.easeFunction(self.timeScale);
	if(self.framesElapsed >= self.targetTime) {
		self.timeScale = 1;
		self.tweenFinish = true;
	}
	
	self.x = self.fromX + self.moveX * self.timeScale;
	self.y = self.fromY + self.moveY * self.timeScale;
	
	if(self.tweenFinish) {
		self.finish();
	}
	
}
