import UIKit

class NavigationController: UINavigationController {
    override var shouldAutorotate: Bool {
        return topViewController?.shouldAutorotate ?? super.shouldAutorotate
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? super.supportedInterfaceOrientations
    }
}
