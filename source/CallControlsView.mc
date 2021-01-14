using Toybox.WatchUi;
using Toybox.Graphics as Gfx;

class CallControlsView extends WatchUi.View {

	hidden var valueFormat = "%d";
	var height, width;
	var iconMute;
	var hangup_button;
	var iconHangup;
	var buttonHangup;
	var x;

    function initialize() {
        View.initialize();
        
        System.println("On Init");

//        iconMute = new WatchUi.Bitmap({
//            :rezId=>Rez.Drawables.IconMute,
//            :locX=>null,
//            :locY=>null
//        });
        x = 0;
    }

    // Load your resources here
    function onLayout(dc) {
//    	System.println("On Layout");
    	
    	if(dc has :setAntiAlias) {
//			System.println("Anti-Aliasing");
			dc.setAntiAlias(true);
		}
		
//		width = dc.getWidth();
//        height = dc.getHeight();
		
      setLayout(Rez.Layouts.MainLayout(dc));

//		buttonHangup = new WatchUi.Button({
////        	:background=>new WatchUi.Bitmap({:rezId=>Rez.Drawables.IconHangup}), 
//			:backgreund=>Gfx.COLOR_WHITE,
//        	:behavior=>method(:hangUp),
//        	:width=>200,
//        	:height=>200,
//        	:locX=>width / 3,
//			:locY=>height / 2
//        });
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
//    	System.println("On Show");
    }

    // Update the view
    function onUpdate(dc) {
//    	System.println("On Update");
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
//
//        var textCenter = Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER;
//        var backgroundColor = Gfx.COLOR_BLACK;  // dc.getBackgroundColor();
//        // set background color
//        dc.setColor(backgroundColor, Graphics.COLOR_TRANSPARENT);
//        dc.fillRectangle (0, 0, width, height);
//        // set foreground color
//        dc.setColor((backgroundColor == Gfx.COLOR_BLACK) ? Gfx.COLOR_WHITE : Gfx.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
// 
//        // do layout
//        dc.drawText(width / 2, height / 4, Gfx.FONT_MEDIUM, "Caller Name", textCenter);
//        dc.drawText(width / 2, height / 2.75, Gfx.FONT_XTINY, "13:37", textCenter);
//        
////        dc.drawBitmap({
////            :rezId=>Rez.Drawables.IconMute,
////            :locX=>10,
////            :locY=>30
////        });

//		new WatchUi.Button(new WatchUi.Bitmap({
//            :rezId=>Rez.Drawables.IconHangup,
//            :locX=>width / 3,
//            :locY=>height / 2
//        }), hangUp).draw();
//        
////        var hangup = new WatchUi.Bitmap({
////            :rezId=>Rez.Drawables.IconHangup,
////            :locX=>width / 3,
////            :locY=>height / 2
////        });
////        
////        hangup_button = new WatchUi.Button({:background=>hangup, :behavior=>method(:hangUp)});
////        
////        hangup_button.draw(dc);
//
//		
////		buttonHangup.background.setLocation(x, height / 2);
//		buttonHangup.draw(dc);
//		System.println(x);
//		
////		iconMute.draw(dc);
//		x += 1;
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    	System.println("On Hide");
    }

}
