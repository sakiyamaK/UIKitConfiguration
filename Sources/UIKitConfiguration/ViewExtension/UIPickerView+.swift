//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UIPickerView

public extension UIPickerView {
    struct UIKitConfiguration {
        private var configurators: [(UIPickerView) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UIPickerView, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UIPickerView) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: UIPickerView.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
