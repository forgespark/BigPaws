import SwiftXCB

public final class InternAtomRequest {
	private let connection: Connection
	private let cookie: xcb_intern_atom_cookie_t
	private var atom: Atom?

	internal init(connection: Connection, onlyIfExists: Bool, name: String) {
		let nameCString = CString(string: name)
		self.connection = connection
		self.cookie = xcb_intern_atom(connection.native, onlyIfExists ? UInt8(1) : UInt8(0), UInt16(nameCString.length - 1), nameCString.pointer)
	}

	public func reply() throws -> Atom {
		var errorPointer: UnsafeMutablePointer<xcb_generic_error_t>?

		if let replyPointer = xcb_intern_atom_reply(connection.native, cookie, &errorPointer) {
			let atom = Atom(native: replyPointer.pointee.atom)
			replyPointer.deinitialize(count: 1)
			replyPointer.deallocate(capacity: 1)

			return atom
		}
		else if let errorPointer = errorPointer {
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
		else {
			fatalError("Unexpected")
		}
	}
}
