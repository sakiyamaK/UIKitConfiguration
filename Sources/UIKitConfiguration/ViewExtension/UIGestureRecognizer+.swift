//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UIGestureRecognizer

public extension UIGestureRecognizer {
    struct UIKitConfiguration {
        private var configurators: [(UIGestureRecognizer) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UIGestureRecognizer, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UIGestureRecognizer) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(configuration: UIGestureRecognizer.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
