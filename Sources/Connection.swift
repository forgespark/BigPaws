import SwiftXCB

public final class Connection {
    private let native: OpaquePointer!

    public init() {
        self.native = xcb_connect(nil, nil)

        if self.native == nil {
            fatalError("Unable to create XCB connection")
        }
    }

    deinit {
        xcb_disconnect(native)
    }

    public func getSetup() -> Setup {
        return Setup(native: xcb_get_setup(native))
    }

    public func flush() {
        xcb_flush(native)
    }

    public func createWindow(parent: Window, visual: xcb_visualid_t) -> Window {
        let window = Window(native: xcb_generate_id(native))
        xcb_create_window(
            native,
            UInt8(XCB_COPY_FROM_PARENT),
            window.native,
            parent.native,
            0,
            0,
            150,
            150,
            10,
            UInt16(XCB_WINDOW_CLASS_INPUT_OUTPUT.rawValue),
            visual,
            0,
            nil
        )

        return window
    }

    public func mapWindow(_ window: Window) {
        xcb_map_window(native, window.native)
    }
}
