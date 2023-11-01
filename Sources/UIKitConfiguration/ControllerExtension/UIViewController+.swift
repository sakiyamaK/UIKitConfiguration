//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UIViewController

public extension UIViewController {
    struct UIKitConfiguration {
        private var configurators: [(UIViewController) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UIViewController, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UIViewController) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: UIViewController.UIKitConfiguration) {
        self.init()
        uiKitConfiguration.apply(to: self)
    }
}
