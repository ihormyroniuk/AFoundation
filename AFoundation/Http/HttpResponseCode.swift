//
//  HttpResponseCode.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 02.03.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

/**
    Implemented based on https://tools.ietf.org/html/rfc2616#section-10
 */
public enum HttpResponseCode {
    public static let `continue` = 100
    public static let switchingProtocols = 101
    public static let ok = 200
    public static let created = 201
    public static let accepted = 202
    public static let nonAuthoritativeInformation = 203
    public static let noContent = 204
    public static let resetContent = 205
    public static let partialContent = 206
    public static let multipleChoices = 300
    public static let movedPermanently = 301
    public static let found = 302
    public static let seeOther = 303
    public static let notModified = 304
    public static let useProxy = 305
    public static let temporaryRedirect = 307
    public static let badRequest = 400
    public static let unauthorized = 401
    public static let paymentRequired = 402
    public static let forbidden = 403
    public static let notFound = 404
    public static let methodNotAllowed = 405
    public static let notAcceptable = 406
    public static let proxyAuthenticationRequired = 407
    public static let requestTimeOut = 408
    public static let conflict = 409
    public static let gone = 410
    public static let lengthRequired = 411
    public static let preconditionFailed = 412
    public static let requestEntityTooLarge = 413
    public static let requestUriTooLarge = 414
    public static let unsupportedMediaType = 415
    public static let requestedRangeNotSatisfiable = 416
    public static let expectationFailed = 417
    public static let internalServerError = 500
    public static let notImplemented = 501
    public static let badGateway = 502
    public static let serviceUnavailable = 503
    public static let gatewayTimeOut = 504
    public static let httpVersionNotSupported = 505
}
