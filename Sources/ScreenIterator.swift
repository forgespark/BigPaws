import SwiftXCB

public final class ScreenIterator {
    private var native: xcb_screen_iterator_t

    internal init(native: xcb_screen_iterator_t) {
        self.native = native
    }

    public func data() -> Screen {
        return Screen(native: native.data)
    }

    public func next() {
        xcb_screen_next(&native)
    }
}
