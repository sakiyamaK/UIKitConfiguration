//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UIStackView

public extension UIStackView {
    struct UIKitConfiguration {
        private var configurators: [(UIStackView) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UIStackView, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UIStackView) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: UIStackView.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
