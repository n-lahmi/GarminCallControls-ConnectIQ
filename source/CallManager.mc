using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.System;
using Toybox.Timer;
using Util;

class CallManager {
	var callWith, startedAt, view;
	var timer;

	function initialize(with, at, v) {
		callWith = with;
		startedAt = new Time.Moment(at.toNumber());
		view = v;
		if (callWith == null or callWith == "") {
			callWith = "Unknown";
		}
		
//    	WatchUi.requestUpdate();
    	
    	// Start a timer to update duration every second
    	
    	timer = new Timer.Timer();
    	timer.start(method(:calcDuration), 1000, true);
//    	calcDuration();
	}
	
	function onHangup() {
		timer.stop();
		
		if (view != null) {
			view.findDrawableById("caller").setText("No Call");
			view.findDrawableById("duration").setText("00:00");
	    	WatchUi.requestUpdate();
    	} else {
    		System.println("View is null");
    	}
	}
	
	function onMuteToggle(status) {
    	if (status == "1") {
    		
    	} else {
    		
    	}
    }
	
	function calcDuration() {
		var durSeconds = new Time.Moment(Time.now().value()).compare(startedAt);

		var minutes = (durSeconds / 60).toNumber();
		var seconds = durSeconds % 60;
		
		minutes = Util.ljust(minutes.toString(), 2, "0");
		seconds = Util.ljust(seconds.toString(), 2, "0");
		
		view.findDrawableById("caller").setText(callWith);
		view.findDrawableById("duration").setText(minutes + ":" + seconds);
    	WatchUi.requestUpdate();
	}
}