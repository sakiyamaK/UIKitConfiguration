//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UITabBarController

public extension UITabBarController {
    struct UIKitConfiguration {
        private var configurators: [(UITabBarController) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UITabBarController, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UITabBarController) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: UITabBarController.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
