//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UIMenu

public extension UIMenu {
    struct UIKitConfiguration {
        private var configurators: [(UIMenu) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UIMenu, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UIMenu) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: UIMenu.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
