//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UITabBarItem

public extension UITabBarItem {
    struct UIKitConfiguration {
        private var configurators: [(UITabBarItem) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UITabBarItem, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UITabBarItem) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: UITabBarItem.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
