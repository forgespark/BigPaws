import SwiftXCB

public final class ScreenIterator {
    public let connection: Connection
    private var native: xcb_screen_iterator_t

    internal init(connection: Connection, native: xcb_screen_iterator_t) {
        self.connection = connection
        self.native = native
    }

    public func data() -> Screen {
        return Screen(connection: connection, native: native.data)
    }

    public func next() {
        xcb_screen_next(&native)
    }
}
