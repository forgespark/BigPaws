public struct RequestError : Error {
	public let responseType: UInt8
	public let errorCode: UInt8
	public let sequence: UInt16
	public let badValue: UInt32
	public let minorOpcode: UInt16
	public let majorOpcode: UInt8

	public init(
		responseType: UInt8, 
		errorCode: UInt8, 
		sequence: UInt16, 
		badValue: UInt32, 
		minorOpcode: UInt16, 
		majorOpcode: UInt8
	)
	{
		self.responseType = responseType
		self.errorCode = errorCode
		self.sequence = sequence
		self.badValue = badValue
		self.minorOpcode = minorOpcode
		self.majorOpcode = majorOpcode
	}
}
