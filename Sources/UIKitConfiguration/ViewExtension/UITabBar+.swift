//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UITabBar

public extension UITabBar {
    struct UIKitConfiguration {
        private var configurators: [(UITabBar) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UITabBar, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UITabBar) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(configuration: UITabBar.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
