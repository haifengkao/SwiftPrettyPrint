//
// CombineOperatorOption.swift
// SwiftPrettyPrint
//
// Created by Yusuke Hosonuma on 2020/12/12.
// Copyright (c) 2020 Yusuke Hosonuma.
//

// Namespace
public enum CombineOperatorOption {}

public extension CombineOperatorOption {
    enum Format {
        case singleline
        case multiline
    }

    enum Event: CaseIterable {
        case subscription
        case output
        case completion
        case cancel
        case request
    }
}
