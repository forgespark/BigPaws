import SwiftXCB

public final class Setup {
    private let native: UnsafePointer<xcb_setup_t>

    internal init(native: UnsafePointer<xcb_setup_t>) {
        self.native = native
    }

    public func rootsIterator() -> ScreenIterator {
        return ScreenIterator(native: xcb_setup_roots_iterator(native))
    }
}
