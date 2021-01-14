using Toybox.Application;
using Toybox.WatchUi;
using Toybox.Communications as Comm;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.Background;
using Util;

class CallControlsApp extends Application.AppBase {
	var view;
	var delegate;
	var currentCall;
	
    function initialize() {
    
//    	// Register our service
//	    if(System has :ServiceDelegate) {
//			Background.registerForPhoneAppMessageEvent();
//			var sd = AppBase.getServiceDelegate()[0];
//			System.println(sd);
////			System.println(Background.getPhoneAppMessageEventRegistered());
//		} else {
//			System.println("****background not available on this device****");
//		}
    
//    	System.println("yay");
        AppBase.initialize();

        Comm.registerForPhoneAppMessages(method(:onPhoneMessageReceived));
        Comm.transmit(WatchUi.loadResource(Rez.Strings.get_last), {}, new Comm.ConnectionListener());
    }
    
//    function onBackgroundData(data) {
//    	if (data) {
//    		System.println("Got some BG data");
//    		handlePhoneAppMessage(data);
//    	} else {
//    		System.println("Empty bg data");
//    	}
//    }
    
    function onPhoneMessageReceived(msg) {
		handlePhoneAppMessage(msg.data);
    }
    
    function handlePhoneAppMessage(data) {
    	var msgSplit = Util.splitString(data, "|");
    	System.println(msgSplit);
    	
    	switch (msgSplit[0]) {
    	
    		// New Call
    		case WatchUi.loadResource(Rez.Strings.state_call):
    			var callWith = msgSplit[1];
    			var startedAt = msgSplit[2];
    			
//    			System.println("In call with " + callWith + " Started at: " + startedAt);
    	
		    	// Stops the timer in it to prevent having two at the same, 
		    	//if the previous call hung up while the connection was inactive
		    	if (currentCall != null) {
		    		currentCall.onHangup();
		    	}
		    	currentCall = new CallManager(callWith, startedAt, view);
    			break;
    			
    		// Call Hungup
    		case WatchUi.loadResource(Rez.Strings.state_hangup):
//    			System.println("Ended call with " + msgSplit[1]);
    			
		    	if (currentCall != null) {
			    	currentCall.onHangup();
			    	currentCall = null;
		    	}
    			break;
    			
    		// Mic Mute
    		case WatchUi.loadResource(Rez.Strings.state_mute):
    			if (currentCall != null) {
			    	currentCall.onMuteToggle(msgSplit[1]);
			    	currentCall = null;
		    	}
    			break;
    			
    	}
//    	System.println(msg.data);
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        view = new CallControlsView();
        delegate = new CallControlsDelegate();
        return [ view, delegate ];
    }
    
//    function hangUp() {
//    	System.println("yay");
//    }

}
