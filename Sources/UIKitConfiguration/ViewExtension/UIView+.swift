import UIKit.UIView

public extension UIView {
    struct UIKitConfiguration {
        private var configurators: [(UIView) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UIView, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UIView) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: UIView.UIKitConfiguration) {
        self.init()
        uiKitConfiguration.apply(to: self)
    }
}
