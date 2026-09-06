import Flutter
import UIKit

class SceneDelegate: FlutterSceneDelegate {
    private var blurView: UIVisualEffectView?

    override func sceneWillResignActive(_ scene: UIScene) {
        if let window = self.window {
            let effect = UIBlurEffect(style: .dark)
            blurView = UIVisualEffectView(effect: effect)
            blurView?.frame = window.bounds
            blurView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            window.addSubview(blurView!)
        }
        super.sceneWillResignActive(scene)
    }

    override func sceneDidBecomeActive(_ scene: UIScene) {
        blurView?.removeFromSuperview()
        blurView = nil
        super.sceneDidBecomeActive(scene)
    }
}
