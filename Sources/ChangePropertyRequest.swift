import SwiftXCB

public enum PropertyMode {
    case replace
    case prepend
    case append

    internal var native: xcb_prop_mode_t {
        switch self {
        case .replace:
            return XCB_PROP_MODE_REPLACE

        case .prepend:
            return XCB_PROP_MODE_PREPEND

        case .append:
            return XCB_PROP_MODE_APPEND
        }
    }
}

public enum PropertyType {
    case atom

    internal var native: xcb_atom_enum_t {
        switch self {
        case .atom:
            return XCB_ATOM_ATOM
        }
    }
}

public enum PropertyFormat : UInt8 {
    case uint8 = 8
    case uint16 = 16
    case uint32 = 32
}

public class ChangePropertyRequest {
    private let connection: Connection
    private let cookie: xcb_void_cookie_t

    internal init(connection: Connection, mode: PropertyMode, window: Window, property: Atom, type: PropertyType, format: PropertyFormat, length: UInt32, data: UnsafePointer<Void>) {
        self.connection = connection
        self.cookie = xcb_change_property_checked(
                connection.native,
                UInt8(mode.native.rawValue),
                window.native,
                property.native,
                xcb_atom_t(type.native.rawValue),
                format.rawValue,
                length,
                data
                )
    }

    public func reply() throws {
        if let errorPointer = xcb_request_check(connection.native, cookie) {
            let error = errorPointer.pointee
            let requestError = RequestError(
                    responseType: error.response_type,
                    errorCode: error.error_code,
                    sequence: error.sequence,
                    badValue: error.resource_id,
                    minorOpcode: error.minor_code,
                    majorOpcode: error.major_code
                    )
            errorPointer.deinitialize(count: 1)
            errorPointer.deallocate(capacity: 1)

            throw requestError
        }
    }
}
