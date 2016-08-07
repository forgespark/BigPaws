import SwiftXCB

public struct VisualID {
	internal let native: xcb_visualid_t

	internal init(native: xcb_visualid_t) {
		self.native = native
	}
}
