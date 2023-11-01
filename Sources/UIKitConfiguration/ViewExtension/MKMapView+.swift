import MapKit

public extension MKMapView {
    struct UIKitConfiguration {
        private var configurators: [(MKMapView) -> Void] = []
        
        public init() { }
                
        public subscript<T>(_ keyPath: ReferenceWritableKeyPath<MKMapView, T>) -> T? {
            get { nil }
            set {
                guard let newValue else { return }
                configurators.append { element in
                    element[keyPath: keyPath] = newValue
                }
            }
        }
        
        fileprivate func apply(to element: MKMapView) {
            for configurator in configurators {
                configurator(element)
            }
        }
    }
    
    convenience init(configuration: MKMapView.UIKitConfiguration) {
        self.init()
        configuration.apply(to: self)
    }
}
