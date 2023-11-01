//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UISwitch

public extension UISwitch {
    struct UIKitConfiguration {
        private var configurators: [(UISwitch) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UISwitch, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UISwitch) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: UISwitch.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
