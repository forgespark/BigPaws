import SwiftXCB

public final class Window {
	public let connection: Connection
    internal let native: xcb_window_t

    internal init(connection: Connection, native: xcb_window_t) {
    	self.connection = connection
        self.native = native
    }

    public func map() {
        xcb_map_window(connection.native, native)
    }

    public func changeProperty(_ property: Atom, mode: PropertyMode, type: PropertyType, format: PropertyFormat, length: UInt32, data: UnsafePointer<Void>) -> ChangePropertyRequest {
		return ChangePropertyRequest(connection: connection, mode: mode, window: self, property: property, type: type, format: format, length: length, data: data)
    }
}
