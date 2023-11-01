//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UIButton

public extension UIButton {
    struct UIKitConfiguration {
        private var configurators: [(UIButton) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UIButton, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UIButton) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(configuration: UIButton.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
