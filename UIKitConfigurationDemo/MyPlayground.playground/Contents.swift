import UIKit
import UIKitConfiguration

func testUILabel() {
    // setup UILabel Configuration
    var labelConfiguration = UILabel.UIKitConfiguration()
    labelConfiguration[\.textColor] = .white
    labelConfiguration[\.font] = UIFont.systemFont(ofSize: 18, weight: .bold)
    labelConfiguration[\.numberOfLines] = 0
    labelConfiguration[\.backgroundColor] = .black
    
    // apply UILabelConfiguration to UILabel
    let label1 = UILabel(uiKitConfiguration: labelConfiguration)
    label1.text = "label1 with labelConfiguration applied."
    let label2 = UILabel(uiKitConfiguration: labelConfiguration)
    label2.text = "label2 with labelConfiguration applied."
}

func testUIImageView() {
    // setup UIImageView Configuration
    var imageViewConfiguration = UIImageView.UIKitConfiguration()
    imageViewConfiguration[\.backgroundColor] = .black
    imageViewConfiguration[\.contentMode] = .scaleAspectFit
    imageViewConfiguration[\.image] = UIImage(systemName: "swift")
    
    // apply UIImageViewConfiguration to UIImageView
    let imageView1 = UIImageView(uiKitConfiguration: imageViewConfiguration)
    let imageView2 = UIImageView(uiKitConfiguration: imageViewConfiguration)
}

testUILabel()
testUIImageView()

// Various other classes of UIKitConfiguration are available...

