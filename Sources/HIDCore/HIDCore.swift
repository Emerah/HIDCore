// The Swift Programming Language
// https://docs.swift.org/swift-book
//
//  HIDCore.swift
//
//
//  Created by Emerah on 26/08/2024.
//

import Chidapi

public typealias HIDDevicePointer = OpaquePointer
public typealias HIDDeviceInfo = hid_device_info
public typealias HIDBusType = hid_bus_type
public typealias HIDApiVersion = hid_api_version


public func hidInit() -> Int32 {
    return hid_init()
}

public func hidExit() -> Int32 {
    return hid_exit()
}


public func hidGetDeviceInfo(_ device: HIDDevicePointer?) -> UnsafeMutablePointer<HIDDeviceInfo>? {
    return hid_get_device_info(device)
}

public func hidEnumerate(vendorID: UInt16, productID: UInt16) -> UnsafeMutablePointer<hid_device_info>? {
    return hid_enumerate(vendorID, productID)
}


public func hidFreeEnumeration(_ devices: UnsafeMutablePointer<hid_device_info>?) {
    hid_free_enumeration(devices)
}


public func hidOpenDevice(vendorID: UInt16, productID: UInt16, serialNumber: UnsafePointer<wchar_t>?) -> HIDDevicePointer? {
    return hid_open(vendorID, productID, serialNumber)
}


public func hidOpenPath(_ path: UnsafePointer<CChar>?) -> HIDDevicePointer? {
    return hid_open_path(path)
}


public func hidWrite(to device: HIDDevicePointer?, data: UnsafePointer<UInt8>?, length: Int) -> Int32 {
    return hid_write(device, data, length)
}


public func hidRead(from device: HIDDevicePointer?, data: UnsafeMutablePointer<UInt8>?, length: Int) -> Int32 {
    return hid_read(device, data, length)
}


public func hidReadTimeout(from device: HIDDevicePointer?, data: UnsafeMutablePointer<UInt8>?, length: Int, timeout: Int32) -> Int32 {
    return hid_read_timeout(device, data, length, timeout)
}


public func hidSetNonBlocking(device: HIDDevicePointer?, nonBlocking: Bool) -> Int32 {
    return hid_set_nonblocking(device, nonBlocking ? 1 : 0)
}


public func hidSendFeatureReport(device: HIDDevicePointer?, data: UnsafePointer<UInt8>?, length: Int) -> Int32 {
    return hid_send_feature_report(device, data, length)
}


public func hidGetFeatureReport(device: HIDDevicePointer?, data: UnsafeMutablePointer<UInt8>?, length: Int) -> Int32 {
    return hid_get_feature_report(device, data, length)
}


public func hidGetInputReport(_ device: HIDDevicePointer?, data: UnsafeMutablePointer<UInt8>?, length: Int) -> Int32 {
    return hid_get_input_report(device, data, length)
}


public func hidCloseDevice(_ device: HIDDevicePointer?) {
    hid_close(device)
}


public func hidGetVersion() -> UnsafePointer<CChar>? {
    return hid_version_str()
}


public func hidGetReportDescriptor(device: HIDDevicePointer?, buffer: UnsafeMutablePointer<UInt8>?, bufferSize: Int) -> Int32 {
    // recommended buffer size 4096
    return hid_get_report_descriptor(device, buffer, bufferSize)
}


public func hidGetManufacturerString(device: HIDDevicePointer?, string: UnsafeMutablePointer<wchar_t>?, maxLength: Int) -> Int32 {
    return hid_get_manufacturer_string(device, string, maxLength)
}


public func hidGetProductString(device: HIDDevicePointer?, string: UnsafeMutablePointer<wchar_t>?, maxLength: Int) -> Int32 {
    return hid_get_product_string(device, string, maxLength)
}


public func hidGetSerialNumberString(device: HIDDevicePointer?, string: UnsafeMutablePointer<wchar_t>?, maxLength: Int) -> Int32 {
    return hid_get_serial_number_string(device, string, maxLength)
}


public func hidGetIndexedString(device: HIDDevicePointer?, stringIndex: Int32, string: UnsafeMutablePointer<wchar_t>?, maxLength: Int) -> Int32 {
    return hid_get_indexed_string(device, stringIndex, string, maxLength)
}


public func hidError(device: HIDDevicePointer?) -> UnsafePointer<wchar_t>? {
    return hid_error(device)
}


