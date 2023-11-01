//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UIControl

public extension UIControl {
    struct UIKitConfiguration {
        private var configurators: [(UIControl) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UIControl, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UIControl) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: UIControl.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
