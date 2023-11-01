import UIKit.UIImageView

public extension UIImageView {
    struct UIKitConfiguration {
        private var configurators: [(UIImageView) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UIImageView, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UIImageView) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: UIImageView.UIKitConfiguration) {
        self.init()
        uiKitConfiguration.apply(to: self)
    }
}
