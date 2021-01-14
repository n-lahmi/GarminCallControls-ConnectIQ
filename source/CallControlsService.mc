//using Toybox.Background;
//using Toybox.Communications;
//using Toybox.System;
//
//(:background)
//class CallControlsService extends System.ServiceDelegate {
//	function initialize() {
//		ServiceDelegate.initialize();
//		System.println("Background init");
//	}
//
//	function onPhoneAppMessage(msg) {
//		System.println("Background babyyyy");
//		// Exit and send the data to the main app
//		Background.requestApplicationWake("Launch Cool App?");
//		Background.exit(msg.data);
//	}
//}