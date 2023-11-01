//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UIScrollView

public extension UIScrollView {
    struct UIKitConfiguration {
        private var configurators: [(UIScrollView) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UIScrollView, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UIScrollView) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: UIScrollView.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
