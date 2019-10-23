import Logging

public typealias MLLogging = Logger
public let logger = MLLogging(label: "com.meli.debug")

public extension MLLogging {
    @inlinable
    func error(_ message: @autoclosure () -> Logger.Message,
                      error: Error? = nil,
                      file: String = #file, function: String = #function, line: UInt = #line) {
        self.log(level: .error, message(), metadata: ["source": "\(error != nil ? "\(error!)":"unknown")"], file: file, function: function, line: line)
    }
}
