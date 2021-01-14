using Toybox.WatchUi;
using Toybox.Communications as Comm;
//using ProperButton;

class CallControlsDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new CallControlsMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
    
    function onMessageSuccess() {
    	System.println("success");
    }
    
    function onMessageFailure() {
    	System.println("failure");
    }
    
    function hangUp() {
    	System.println("Detected Click on Hangup");
		Comm.transmit(WatchUi.loadResource(Rez.Strings.action_hangup), {}, new Comm.ConnectionListener());
    }
    
    function toggleMute() {
    	System.println("Detected Click on Mute/Unmute");
		Comm.transmit(WatchUi.loadResource(Rez.Strings.action_mute), {}, new Comm.ConnectionListener());
    }
    
    function setAudioSource() {
    	System.println("Detected Click on Set Audio Source");
		Comm.transmit(WatchUi.loadResource(Rez.Strings.action_audsrc), {}, new Comm.ConnectionListener());
    }
    
    function volumeUp() {
    	System.println("Detected Click on Volume Up");
		Comm.transmit(WatchUi.loadResource(Rez.Strings.action_volup), {}, new Comm.ConnectionListener());
    }
    
    function volumeDown() {
    	System.println("Detected Click on Volume Down");
		Comm.transmit(WatchUi.loadResource(Rez.Strings.action_voldn), {}, new Comm.ConnectionListener());
    }
    
//    function onTap(evt) {
//    	var xy = evt.getCoordinates();
//    	System.println(xy);
//    	
////    	new ProperButton("btn_endcall");
//    }

}