/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

@IBDesignable
class AvatarView: UIView {
  
  let margin: CGFloat = 30.0
  let labelName = UILabel()
  let imageView = UIImageView()
    
    let strokeColor = UIColor.black
    
    let layerGradient = CAGradientLayer()
    
    let startColor = UIColor.white
    let endColor = UIColor.blue
  
  
  @IBInspectable var imageAvatar: UIImage? {
    didSet {
      configure()
    }
  }
  
  @IBInspectable var avatarName: String = "" {
    didSet {
      configure()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
  }

  func setup() {
    
    layer.addSublayer(layerGradient)
    
    // Setup image view
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    imageView.clipsToBounds = true
    imageView.layer.borderColor = strokeColor.cgColor
    imageView.layer.borderWidth = 5.0
    
    addSubview(imageView)
    
    // Setup label
    labelName.font = UIFont(name: "AvenirNext-Bold", size: 28.0)
    labelName.textColor = UIColor.black
    labelName.translatesAutoresizingMaskIntoConstraints = false
    addSubview(labelName)
    
    labelName.setContentCompressionResistancePriority(1000, for: .vertical)
    
    // Add constraints for label
    let labelCenterX = labelName.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    let labelBottom = labelName.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    NSLayoutConstraint.activate([labelCenterX, labelBottom])
    
    // Add constraints for imageView
    let imageViewCenterX = imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    let imageViewTop = imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: margin)
    let imageViewBottom = imageView.bottomAnchor.constraint(equalTo: labelName.topAnchor, constant: -margin)
    let imageViewWidth = imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
    NSLayoutConstraint.activate([imageViewCenterX, imageViewTop, imageViewBottom, imageViewWidth])
  }
  
  func configure() {

    // Configure image view and label
    imageView.image = imageAvatar
    labelName.text = avatarName
    
    layerGradient.colors = [startColor.cgColor, endColor.cgColor]
    layerGradient.startPoint = CGPoint(x: 0.5, y: 0)
    layerGradient.endPoint = CGPoint(x: 0.5, y: 1)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    imageView.layer.cornerRadius = imageView.frame.height / 2
    
    layerGradient.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.imageView.frame.height / 2)
  }
  
}
