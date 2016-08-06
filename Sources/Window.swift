import SwiftXCB

public final class Window {
    internal let native: xcb_window_t

    internal init(native: xcb_window_t) {
        self.native = native
    }
}
