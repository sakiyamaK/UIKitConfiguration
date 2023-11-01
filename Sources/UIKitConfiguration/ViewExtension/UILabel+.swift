import UIKit.UILabel

public extension UILabel {
    struct UIKitConfiguration {
        private var configurators: [(UILabel) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UILabel, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UILabel) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: UILabel.UIKitConfiguration) {
        self.init()
        uiKitConfiguration.apply(to: self)
    }
}
