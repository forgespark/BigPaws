import SwiftXCB

public final class Setup {
	public let connection: Connection
    private let native: UnsafePointer<xcb_setup_t>

    internal init(connection: Connection, native: UnsafePointer<xcb_setup_t>) {
    	self.connection = connection
        self.native = native
    }

    public func rootsIterator() -> ScreenIterator {
        return ScreenIterator(connection: connection, native: xcb_setup_roots_iterator(native))
    }
}
