import SwiftXCB

public enum WindowClass {
	case copyFromParent
	case inputOutput
	case inputOnly

	internal var native: UInt16 {
		switch self {
			case .copyFromParent:
				return UInt16(XCB_WINDOW_CLASS_COPY_FROM_PARENT.rawValue)

			case .inputOutput:
				return UInt16(XCB_WINDOW_CLASS_INPUT_OUTPUT.rawValue)

			case .inputOnly:
				return UInt16(XCB_WINDOW_CLASS_INPUT_ONLY.rawValue)
		}
	}
}
