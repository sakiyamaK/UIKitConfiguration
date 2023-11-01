//
//  UIBarButtonItem+.swift
//  
//
//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UIBarButtonItem

public extension UIBarButtonItem {
    struct UIKitConfiguration {
        private var configurators: [(UIBarButtonItem) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UIBarButtonItem, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UIBarButtonItem) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(configuration: UIBarButtonItem.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
