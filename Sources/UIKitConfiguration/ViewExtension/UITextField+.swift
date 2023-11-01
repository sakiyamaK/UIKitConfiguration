//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UITextField

public extension UITextField {
    struct UIKitConfiguration {
        private var configurators: [(UITextField) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UITextField, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UITextField) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: UITextField.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
