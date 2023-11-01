//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UIAlertController

public extension UIAlertController {
    struct UIKitConfiguration {
        private var configurators: [(UIAlertController) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UIAlertController, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UIAlertController) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: UIAlertController.UIKitConfiguration) {
        self.init()
        uiKitConfiguration.apply(to: self)
    }
}
