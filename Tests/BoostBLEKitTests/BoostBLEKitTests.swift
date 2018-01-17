import XCTest
@testable import BoostBLEKit

class BoostBLEKitTests: XCTestCase {
    
    func testMotorPowerCommand() {
        XCTAssertEqual(MotorPowerCommand(port: .A, power: 100).data,
                       Data(bytes: [0x09, 0x00, 0x81, 0x37, 0x11, 0x07, 0x64, 0x64, 0x03]))
        XCTAssertEqual(MotorPowerCommand(port: .B, power: -100).data,
                       Data(bytes: [0x09, 0x00, 0x81, 0x38, 0x11, 0x07, 0x9c, 0x64, 0x03]))
        XCTAssertEqual(MotorPowerCommand(port: .C, power: 0).data,
                       Data(bytes: [0x09, 0x00, 0x81, 0x01, 0x11, 0x07, 0x00, 0x64, 0x03]))
        XCTAssertEqual(MotorPowerCommand(port: .D, power: 0).data,
                       Data(bytes: [0x09, 0x00, 0x81, 0x02, 0x11, 0x07, 0x00, 0x64, 0x03]))
    }
    
    func testNotification() {
        XCTAssertNotNil(BoostBLEKit.Notification(data:
            Data(bytes: [0x0f, 0x00, 0x04, 0x01, 0x01, 0x25, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10])
        ))
        XCTAssertNotNil(BoostBLEKit.Notification(data:
            Data(bytes: [0x05, 0x00, 0x04, 0x02, 0x00])
        ))
    }
    
    static var allTests = [
        ("testMotorPowerCommand", testMotorPowerCommand),
        ("testNotification", testNotification),
    ]
}
