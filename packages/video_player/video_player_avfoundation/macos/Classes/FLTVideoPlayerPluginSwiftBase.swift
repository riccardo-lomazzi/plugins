import Cocoa
import FlutterMacOS

public class FLTVideoPlayerPluginSwiftBase: NSObject, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        FLTVideoPlayerPlugin.register(with: registrar)
    }
    
}
