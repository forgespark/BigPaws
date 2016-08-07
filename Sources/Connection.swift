import SwiftXCB

public final class Connection {
    private let preferredScreen: Int32
    private let native: OpaquePointer!

    public init(display: String? = nil, usePreferredScreen: Bool = false) {
        var screen: Int32 = 0
        self.native = xcb_connect(display, &screen)
        self.preferredScreen = screen

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

    public func createWindow(depth: UInt8 = UInt8(XCB_COPY_FROM_PARENT), parent: Window, x: Int16, y: Int16, width: UInt16, height: UInt16, borderWidth: UInt16, windowClass: WindowClass = .inputOutput, visual: VisualID, flags: Set<WindowFlag>) -> Window {
        let window = Window(native: xcb_generate_id(native))
        let valueMask = flags.map({ $0.native.rawValue }).reduce(UInt32(0), { $0 | $1 })
        let valueList = flags.sorted(by: { $0.native.rawValue < $1.native.rawValue }).map({ $0.value })

        xcb_create_window(
            native,
            depth,
            window.native,
            parent.native,
            x,
            y,
            width,
            height,
            borderWidth,
            windowClass.native,
            visual.native,
            valueMask,
            valueList
        )

        return window
    }

    public func mapWindow(_ window: Window) {
        xcb_map_window(native, window.native)
    }
}
