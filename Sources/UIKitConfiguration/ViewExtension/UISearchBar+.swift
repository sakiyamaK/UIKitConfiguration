//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UISearchBar

public extension UISearchBar {
    struct UIKitConfiguration {
        private var configurators: [(UISearchBar) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UISearchBar, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UISearchBar) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(configuration: UISearchBar.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
