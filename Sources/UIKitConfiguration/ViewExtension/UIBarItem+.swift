//
//  UIBarItem+.swift
//  
//
//  Created by sakiyamaK on 2023/10/05.
//

import UIKit.UIBarItem

public extension UIBarItem {
    struct UIKitConfiguration {
        private var configurators: [(UIBarItem) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<UIBarItem, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: UIBarItem) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: UIBarItem.UIKitConfiguration) {
        self.init()
        uiKitConfiguration.apply(to: self)
    }
}
