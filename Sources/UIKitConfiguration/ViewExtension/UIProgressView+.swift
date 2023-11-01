//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UIProgressView

public extension UIProgressView {
    struct UIKitConfiguration {
        private var configurators: [(UIProgressView) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UIProgressView, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UIProgressView) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(configuration: UIProgressView.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
