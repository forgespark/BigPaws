import SwiftXCB

public enum WindowFlag : Hashable, Equatable {
	case backPixmap(BackPixmapFlag)
	case backPixel(UInt32)
	case eventMask(EventMask)

	internal var native: xcb_cw_t {
		switch self {
			case .backPixmap:
				return XCB_CW_BACK_PIXMAP

			case .backPixel:
				return XCB_CW_BACK_PIXEL

			case .eventMask:
				return XCB_CW_EVENT_MASK
		}
	}

	internal var value: UInt32 {
		switch self {
			case .backPixmap(let flag):
				return UInt32(flag.native.rawValue)

			case .backPixel(let pixel):
				return pixel

			case .eventMask(let mask):
				return mask.rawValue
		}
	}

	public var hashValue: Int {
		return native.rawValue.hashValue
	}
}

public func ==(a: WindowFlag, b: WindowFlag) -> Bool {
	return a.native == b.native
}

public enum BackPixmapFlag {
	case none
	case parentRelative

	internal var native: xcb_back_pixmap_t {
		switch self {
			case .none:
				return XCB_BACK_PIXMAP_NONE

			case .parentRelative:
				return XCB_BACK_PIXMAP_PARENT_RELATIVE
		}
	}
}

public struct EventMask : OptionSet {
	public let rawValue: UInt32

	public init(rawValue: UInt32) {
		self.rawValue = rawValue
	}

	static let noEvent = EventMask(rawValue: XCB_EVENT_MASK_NO_EVENT.rawValue)
	static let keyPress = EventMask(rawValue: XCB_EVENT_MASK_KEY_PRESS.rawValue)
    static let keyRelease = EventMask(rawValue: XCB_EVENT_MASK_KEY_RELEASE.rawValue)
    static let buttonPress = EventMask(rawValue: XCB_EVENT_MASK_BUTTON_PRESS.rawValue)
    static let buttonRelease = EventMask(rawValue: XCB_EVENT_MASK_BUTTON_RELEASE.rawValue)
    static let enterWindow = EventMask(rawValue: XCB_EVENT_MASK_ENTER_WINDOW.rawValue)
    static let leaveWindow = EventMask(rawValue: XCB_EVENT_MASK_LEAVE_WINDOW.rawValue)
    static let pointerMotion = EventMask(rawValue: XCB_EVENT_MASK_POINTER_MOTION.rawValue)
    static let pointerMotionHint = EventMask(rawValue: XCB_EVENT_MASK_POINTER_MOTION_HINT.rawValue)
    static let button1Motion = EventMask(rawValue: XCB_EVENT_MASK_BUTTON_1_MOTION.rawValue)
    static let button2Motion = EventMask(rawValue: XCB_EVENT_MASK_BUTTON_2_MOTION.rawValue)
    static let button3Motion = EventMask(rawValue: XCB_EVENT_MASK_BUTTON_3_MOTION.rawValue)
    static let button4Motion = EventMask(rawValue: XCB_EVENT_MASK_BUTTON_4_MOTION.rawValue)
    static let button5Motion = EventMask(rawValue: XCB_EVENT_MASK_BUTTON_5_MOTION.rawValue)
    static let buttonMotion = EventMask(rawValue: XCB_EVENT_MASK_BUTTON_MOTION.rawValue)
    static let keymapState = EventMask(rawValue: XCB_EVENT_MASK_KEYMAP_STATE.rawValue)
    static let exposure = EventMask(rawValue: XCB_EVENT_MASK_EXPOSURE.rawValue)
    static let visibilityChange = EventMask(rawValue: XCB_EVENT_MASK_VISIBILITY_CHANGE.rawValue)
    static let structureNotify = EventMask(rawValue: XCB_EVENT_MASK_STRUCTURE_NOTIFY.rawValue)
    static let resizeRedirect = EventMask(rawValue: XCB_EVENT_MASK_RESIZE_REDIRECT.rawValue)
    static let substructureNotify = EventMask(rawValue: XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY.rawValue)
    static let substructureRedirect = EventMask(rawValue: XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT.rawValue)
    static let focusChange = EventMask(rawValue: XCB_EVENT_MASK_FOCUS_CHANGE.rawValue)
    static let propertyChange = EventMask(rawValue: XCB_EVENT_MASK_PROPERTY_CHANGE.rawValue)
    static let colorMapChange = EventMask(rawValue: XCB_EVENT_MASK_COLOR_MAP_CHANGE.rawValue)
    static let ownerGrabButton = EventMask(rawValue: XCB_EVENT_MASK_OWNER_GRAB_BUTTON.rawValue)
}
