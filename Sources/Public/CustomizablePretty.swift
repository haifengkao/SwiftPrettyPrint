//
// Pretty.swift
// SwiftPrettyPrint
//
// Created by Yusuke Hosonuma on 2020/12/12.
// Copyright (c) 2020 Yusuke Hosonuma.
//

#if canImport(os)
    import os.log
#endif

#if canImport(Foundation)
    import Foundation
#endif

// MARK: Standard API

public extension Pretty {
    /// Output pretty-formatted `targets` to console.
    /// - Parameters:
    ///   - label: label
    ///   - targets: targets
    ///   - separator: A string to print between each item.
    ///   - option: option (default: `Pretty.sharedOption`)
    ///   - colored: whether to apply the color theme in `option`.
    /// - Warning: Xcode doesn't support console coloring since Xcode 8
    static func customizablePrettyPrint(
        label: String? = nil,
        _ targets: Any...,
        separator: String = "\n",
        option: Option = Pretty.sharedOption
    ) {
        _output(printer: _customPrint, label: label, targets, separator: separator, option: option)
    }

    private static func _customPrint(
        label: String?,
        _ targets: [Any],
        separator: String,
        option: Option
    ) -> String {
        prefixLabelPretty(option.prefix, label) +
            targets.map {
                SimpleDescriber.multiline(option: option).string($0, debug: false)
            }.joined(separator: separator)
    }

    /// Output pretty-formatted `targets` to console.
    /// - Parameters:
    ///   - label: label
    ///   - targets: targets
    ///   - separator: A string to print between each item.
    ///   - option: option (default: `Pretty.sharedOption`)
    ///   - output: output
    static func customizablePrettyPrint<Target: TextOutputStream>(
        label: String? = nil,
        _ targets: Any...,
        separator: String = "\n",
        option: Option = Pretty.sharedOption,
        to output: inout Target
    ) {
        let plain = _customPrint(label: label, targets, separator: separator, option: option)
        Swift.print(plain, to: &output)
    }
}
