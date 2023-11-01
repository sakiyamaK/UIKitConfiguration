//
//  MKPointAnnotation+.swift
//
//
//  Created by sakiyamaK on 2023/10/05.
//

import MapKit

public extension MKPointAnnotation {
    struct UIKitConfiguration {
        private var configurators: [(MKPointAnnotation) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<MKPointAnnotation, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: MKPointAnnotation) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(uiKitConfiguration: MKPointAnnotation.UIKitConfiguration) {
        self.init()
        uiKitConfiguration.apply(to: self)
    }
}
