//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UITextView

public extension UITextView {
    struct UIKitConfiguration {
        private var configurators: [(UITextView) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UITextView, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UITextView) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(configuration: UITextView.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
