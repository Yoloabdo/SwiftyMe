import UIKit



public struct ImageProcess{
    var imageWidth: Int?
    var imageHeight: Int?
    var processfile: UIImage?
    var rgbImage: RGBAImage?
    
    public var avgBlue = 0
    var avgRed = 0
    var avgGreen = 0

    public var sumAvg = 0
    
    public init(image: UIImage){
        rgbImage = RGBAImage(image: image)
        calculations(rgbImage!)
    }
    
    private mutating func calculations(rgbImage: RGBAImage){
        imageWidth = rgbImage.width
        imageHeight = rgbImage.height
        var totalRed = 0
        var totalGreen = 0
        var totalBlue = 0
        
        for y in 0..<imageHeight! {
            for x in 0..<imageWidth! {
                let index = y * imageWidth! + x
                let pixel = rgbImage.pixels[index]
                totalBlue += Int(pixel.blue)
                totalGreen += Int(pixel.green)
                totalRed += Int(pixel.red)
    
            }
        }
        let size = imageHeight! * imageWidth!
        
        avgBlue = Int(totalBlue) / size
        avgGreen = Int(totalGreen) / size
        avgRed = Int(totalRed) / size
        sumAvg = avgRed + avgGreen + avgBlue
        
    }
    
    public func contrast(scale: Int) -> UIImage? {
        if let image = rgbImage {
            for y in 0..<image.height {
                for x in 0..<image.width {
                    let index = y * image.width + x
                    var pixel = image.pixels[index]
                    let redDelta = Int(pixel.red) - avgRed
                    let greenDelta = Int(pixel.green) - avgGreen
                    let blueDelta = Int(pixel.blue) - avgBlue
                    
             
                    
                    pixel.red = UInt8(max(min(255, avgRed + scale * redDelta), 0))
                    pixel.green = UInt8(max(min(255, avgGreen + scale * greenDelta), 0))
                    pixel.blue = UInt8(max(min(255, avgBlue + scale * blueDelta), 0))
                    image.pixels[index] = pixel
                }
            }
            return image.toUIImage()!
        }
        return nil
    }
    
    
    public func brightness(scale: Int) -> UIImage? {
        if let image = rgbImage {
            for y in 0..<image.height {
                for x in 0..<image.width {
                    let index = y * image.width + x
                    var pixel = image.pixels[index]
                    
                    pixel.red = UInt8(max(min(255, Int(pixel.red) + scale), 0))
                    pixel.green = UInt8(max(min(255, Int(pixel.green) + scale), 0))
                    pixel.blue = UInt8(max(min(255, Int(pixel.blue) + scale), 0))
                    image.pixels[index] = pixel
                }
            }
            return image.toUIImage()!
        }
        return nil
    }
    
    
    public func greyscale() -> UIImage?{
        if let image = rgbImage {
            for y in 0..<imageHeight! {
                for x in 0..<imageWidth! {
                    
                    let index = y * imageWidth! + x
                    var pixel = image.pixels[index]
                    
                    let redDelta = Double(pixel.red)
                    let greenDelta = Double(pixel.green)
                    let blueDelta = Double(pixel.blue)
                    
                    
                    let sum = (redDelta + greenDelta  + blueDelta) / 3
                    
                    pixel.red = UInt8(sum)
                    pixel.green = UInt8(sum)
                    pixel.blue = UInt8(sum)
                    
                    image.pixels[index] = pixel
                }
            }
            return image.toUIImage()
        }
        print ("error reading image file")
        return nil
    }
    
}

