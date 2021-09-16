import Flutter
import UIKit
import LiveChat

public class SwiftFLiveChatPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "f_live_chat", binaryMessenger: registrar.messenger())
        let instance = SwiftFLiveChatPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "init":
            let args = call.arguments as! [String : Any]
            LiveChat.licenseId = args["license_id"] as? String
            if let groupId = args["group_id"] as? String {
                LiveChat.groupId = groupId
            }
            if let email = args["email"] as? String {
                LiveChat.email = email
            }
            if let name = args["name"] as? String {
                LiveChat.name = name
            }
            result(nil)
        case "showChat":
            LiveChat.presentChat()
            result(nil)
        case "setVariable":
            let args = call.arguments as! [String : Any]
            for (key, value) in args {
                let v = (value as? String) ?? ""
                LiveChat.setVariable(withKey: key, value: v)
            }
            result(nil)
        case "clearSession":
            LiveChat.clearSession()
            result(nil)
        case "updateConfiguration":
            let args = call.arguments as! [String : Any]
            
            if let groupId = args["group_id"] as? String {
                LiveChat.groupId = groupId
            }
            if let email = args["email"] as? String {
                LiveChat.email = email
            }
            if let name = args["name"] as? String {
                LiveChat.name = name
            }
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
