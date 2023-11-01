//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UITableView

public extension UITableView {
    struct UIKitConfiguration {
        private var configurators: [(UITableView) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UITableView, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UITableView) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(configuration: UITableView.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
