public final class CString {
	private let bytes: UnsafeMutablePointer<UInt8>?
	public let length: Int
	public var pointer: UnsafePointer<CChar>? {
		return UnsafePointer<CChar>(bytes)
	}

	public init(string: String) {
		let cstr = string.nulTerminatedUTF8
		let strlen = cstr.count
		self.length = strlen
		self.bytes = cstr.withUnsafeBufferPointer {
			if let baseAddress = $0.baseAddress {
				let pointer = UnsafeMutablePointer<UInt8>.allocate(capacity: strlen)
				pointer.initialize(from: baseAddress, count: strlen)
				return pointer
			}
			else {
				return nil
			}
		}
	}

	deinit {
		if let bytes = bytes {
			bytes.deinitialize(count: length)
			bytes.deallocate(capacity: length)
		}
	}
}
