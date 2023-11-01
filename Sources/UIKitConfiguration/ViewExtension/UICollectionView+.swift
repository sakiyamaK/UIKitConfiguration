//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UICollectionView

public extension UICollectionView {
    struct UIKitConfiguration {
        private var configurators: [(UICollectionView) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UICollectionView, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UICollectionView) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(configuration: UICollectionView.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
