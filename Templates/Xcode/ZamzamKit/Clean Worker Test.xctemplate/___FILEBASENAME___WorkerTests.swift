//___FILEHEADER___

import XCTest
import ZamzamKit

final class ___VARIABLE_productName:identifier___WorkerTests: AuthTestCase {
    private lazy var testWorker: ___VARIABLE_productName:identifier___WorkerType = dependencies.resolve()
    private lazy var preferences: PreferencesType = dependencies.resolve()
}

extension ___VARIABLE_productName:identifier___WorkerTests {
    
    func testFetch___VARIABLE_productName:identifier___s() {
        asyncExpectation(description: "Fetch ___VARIABLE_productName:identifier___s test") { promise in
            // Given
            let userID = preferences.userID ?? 0
            
            let request = ___VARIABLE_productName:identifier___API.Request()
            
            // When
            self.testWorker.fetch(byUserID: userID, with: request) {
                defer { promise.fulfill() }
                
                // Then
                XCTAssertNil($0.error, $0.error.debugDescription)
                XCTAssertTrue($0.isSuccess)
                XCTAssertNotNil($0.value, "response should not have been nil")
                XCTAssertFalse($0.value!.isEmpty, "response should have returned ___VARIABLE_productName:identifier___s")
            }
        }
    }
}
