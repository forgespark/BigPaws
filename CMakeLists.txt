cmake_minimum_required(VERSION 3.4)
project(BigPaws)

add_custom_target(BigPaws.swiftmodule
        COMMAND swift build
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        SOURCES Package.swift Sources/Atom.swift Sources/ChangePropertyRequest.swift Sources/Connection.swift Sources/CString.swift Sources/InternAtomRequest.swift Sources/RequestError.swift Sources/Screen.swift Sources/ScreenIterator.swift Sources/Setup.swift Sources/VisualID.swift Sources/Window.swift Sources/WindowClass.swift Sources/WindowFlag.swift)