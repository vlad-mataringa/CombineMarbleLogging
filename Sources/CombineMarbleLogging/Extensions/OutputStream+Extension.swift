//
//  OutputStream+Extension.swift
//  
//
//  Created by Mataranga, Vlad on 07.05.2023.
//

import Foundation

extension OutputStream {
    static func makeForLogs(_ fileName: String) -> OutputStream {
        let fileManager = FileManager.default

        guard let logFile = fileManager.urls(for: .documentDirectory,
                                             in: .userDomainMask).first?
            .appendingPathComponent(fileName),
              let stream = OutputStream(url: logFile, append: true) else {
            return OutputStream(toMemory: ())
        }
        print(logFile)
        return stream
    }
}
