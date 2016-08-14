import SwiftXCB

public final class Screen {
    public let connection: Connection
    private let native: UnsafeMutablePointer<xcb_screen_t>

    internal init(connection: Connection, native: UnsafeMutablePointer<xcb_screen_t>) {
        self.connection = connection
        self.native = native
    }

    public var root: Window {
        return Window(connection: connection, native: native.pointee.root)
    }

    public var rootVisual: VisualID {
        return VisualID(native: native.pointee.root_visual)
    }

    public var whitePixel: UInt32 {
        return native.pointee.white_pixel
    }

    public var blackPixel: UInt32 {
        return native.pointee.black_pixel
    }

    public var widthInPixels: UInt16 {
        return native.pointee.width_in_pixels
    }

    public var heightInPixels: UInt16 {
        return native.pointee.height_in_pixels
    }
}
