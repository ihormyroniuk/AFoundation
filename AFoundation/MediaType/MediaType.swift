import Foundation

/**
    Implemented based on https://www.iana.org/assignments/media-types/media-types.xhtml
 */
public enum MediaType {
    
    public enum Application {
        public static let json = "application/json"
        public static let xWwwFormUrlencoded = "x-www-form-urlencoded"
    }
    
    public enum Image {
        public static let jpeg = "image/jpeg"
        public static let png = "image/png"
    }
    
}
