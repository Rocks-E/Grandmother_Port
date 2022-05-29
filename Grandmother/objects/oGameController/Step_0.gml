if(instance_exists(global.mouseController)) {
	if(global.dust.cleaned && global.mouseController.lastPressCounter >= global.WAIT_TO_DROP_BUCKET && !global.bucketDropped) {
		self.dropBucket();
		global.sponge.image_alpha = 0;
	}

	if(global.bucketDropped && global.vase.filled && !global.endingStarted) {
		global.endingStarted = true;
		global.mouseController.destroy();
		var endFade = instance_create_depth(0, 0, 0, oTween);
		if(global.LONG_ENDING) {
			alarm[0] = (global.WAIT_TO_FADE - global.PHOTO_FADE_IN_DURATION) * room_speed;
		}
		else {
			alarm[1] = global.WAIT_TO_FADE * room_speed;
		}
	}
}