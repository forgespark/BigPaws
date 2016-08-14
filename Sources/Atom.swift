import SwiftXCB

public struct Atom {
	internal let native: xcb_atom_t

	internal init(native: xcb_atom_t) {
		self.native = native
	}
}
