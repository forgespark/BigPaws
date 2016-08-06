import SwiftXCB

public final class Screen {
    private let native: UnsafeMutablePointer<xcb_screen_t>

    internal init(native: UnsafeMutablePointer<xcb_screen_t>) {
        self.native = native
    }

    public var root: Window {
        return Window(native: native.pointee.root)
    }

    public var rootVisual: xcb_visualid_t {
        return native.pointee.root_visual
    }
}
