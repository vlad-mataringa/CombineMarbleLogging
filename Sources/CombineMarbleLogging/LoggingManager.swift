//
//  LoggingManager.swift
//  
//
//  Created by Mataranga, Vlad on 07.05.2023.
//

import Foundation
import CombineMarbleCommon

public final class LoggingManager {
    static let shared = LoggingManager()
    static let fileUUID = UUID().uuidString.prefix(8)
    
    static let loggingIO: DispatchQueue = DispatchQueue(label: "marble_log", qos: .background)
    private let stream: OutputStream
    private let newLineData = "\n".data(using: .utf8)!
    
    public static func bootstrap() {
        loggingIO.sync {
            _ = shared
        }
    }
    
    private init() {
        let fileName = "marble_log_\(LoggingManager.fileUUID).txt"
        stream = .makeForLogs(fileName)
        stream.open()
    }
    
    func log<T: Codable>(_ event: LogEvent<T>) {
        Self.loggingIO.async { [self] in
        
            guard var data = try? event.encode() else {
                return
            }
            
            data.append(newLineData)
            
            if let string = String(data: data, encoding: .utf8) {
                print(string)
            }
                        
            data.withUnsafeBytes { buffer in
                let bytes = buffer.bindMemory(to: UInt8.self)
                guard let address = bytes.baseAddress else { return }

                stream.write(address, maxLength: bytes.count)
            }
        }
    }
}
