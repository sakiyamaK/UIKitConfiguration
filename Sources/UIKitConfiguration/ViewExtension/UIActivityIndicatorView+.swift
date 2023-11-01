//
//  UIActivityIndicatorView+.swift
//  
//
//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UIActivityIndicatorView

public extension UIActivityIndicatorView {
    struct UIKitConfiguration {
        private var configurators: [(UIActivityIndicatorView) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UIActivityIndicatorView, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UIActivityIndicatorView) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: UIActivityIndicatorView.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
