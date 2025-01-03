## A Comprehensive Guide to Swift Testing

Swift's testing library provides a robust and flexible framework for ensuring your code works as intended. This guide explores the key features of Swift testing, helping you write effective and organized tests.

### Defining Test Functions

- **Declare a Test Function**: Write a Swift function without parameters and prefix it with the `@Test` attribute.

- **Customize Test Names**: Provide a custom name using the `@Test` attribute.

- **Main Actor Tests**: Use `@MainActor` if the test must run on the main thread.

- **Limit Test Availability**: Use `@available` to restrict tests to certain OS or Swift versions.

  ```swift
  import Testing
  
  @available(macOS 11.0, *)
  @Test("Custom Test Name") @MainActor func testExample() {
      // Test logic here.
  }
  ```

### Organizing Tests with Suites

- **Add Tests to Suites**: A test function can be added to a test suite in one of two ways:
  - **Without `@Suite`**: By placing it inside a Swift type.
  - **With `@Suite`**: By placing it inside a Swift type and annotating that type with the `@Suite` attribute.
- **Benefits of Using `@Suite`**:
  - **Customization**: The `@Suite` attribute allows you to customize the suite's appearance in IDEs and the command line.
  - **Trait Inheritance**: Traits applied to a suite (like `tags(_:)`) are automatically inherited by all tests within the suite.
  - **Run Tests in Parallel**: By default, tests run in parallel for efficiency. Ensure tests are thread-safe or use `@MainActor` when necessary.
- **Recommendation to Use `struct` or `actor`**:
  - It is generally recommended to use a Swift `struct` or `actor` instead of a `class` for test suites. This allows the Swift compiler to better enforce concurrency safety, leading to more reliable and thread-safe tests.

### Writing Effective Assertions

- **Check Expected Outcomes**: Use `#expect` to assert conditions without stopping the test upon failure.

- **Enforce Requirements**: Use `try #require` to assert critical conditions and halt the test if they fail.

- **Record Issues**: Use `Issue.record("Message")` to log failures unconditionally.

  ```swift
  #expect(calculator.total == expectedTotal)
  // If the expectation fails, the test continues running.
  let user = try #require(User(id: userID))
  if !network.isConnected {
      Issue.record("Network is not connected")
  }
  ```

- **Testing for Errors**:

  - **Expecting Errors**: Use `#expect(throws:)` to check if a function throws an error.

    ```swift
    #expect(throws: SpecificError.self) { try functionThatThrows() }
    ```

  - **Asserting No Errors**: Ensure a function does not throw an error.

    ```swift
    #expect(throws: Never.self) { try functionThatDoesNotThrow() }
    ```

### Handling Asynchronous Code

- **Prefer Swift Concurrency**: Use `async`/`await` to handle asynchronous operations in tests.

  ```swift
  @Test func testAsyncOperation() async {
      let result = await fetchData()
      #expect(result.isValid)
  }
  ```

- **Confirmations for Events**: Use `confirmation()` to handle asynchronous events that can't be awaited directly.

  ```swift
  @Test func testNotification() async {
      await confirmation("Notification received") { confirm in
          NotificationCenter.default.addObserver(forName: .testEvent, object: nil, queue: nil) { _ in
              confirm()
          }
          // Trigger event
          triggerEvent()
      }
  }
  ```

### Implementing Parameterized Tests

- **Test with Multiple Inputs**: Use the `arguments` parameter in `@Test` to specify different inputs.

  ```swift
  @Test("Test User Roles", arguments: UserRole.allCases)
  func testUserRole(_ role: UserRole) {
      let user = User(role: role)
      #expect(user.permissions.isValid)
  }
  ```

- **Multiple Parameters**: Combine multiple collections for tests requiring more than one parameter.

  ```swift
  @Test("Test User Access", arguments: [UserType.admin, .guest], [AccessLevel.read, .write])
  func testUserAccess(_ userType: UserType, _ accessLevel: AccessLevel) {
      let access = AccessControl.check(userType: userType, accessLevel: accessLevel)
      #expect(access.isAllowed)
  }
  ```

- **Cartesian Product vs. Zipped Sequences**:

  - **Cartesian Product**: When multiple collections are provided, the testing library runs the test for every possible combination of arguments.

    ```swift
    @Test("Test Combinations", arguments: [1, 2], ["A", "B"])
    // Test runs 4 times with combinations: (1, "A"), (1, "B"), (2, "A"), (2, "B")
    ```

  - **Zipped Sequences**: Use `zip` to pair elements from collections, reducing the number of test cases.

    ```swift
    @Test("Test Paired Inputs", arguments: zip([1, 2], ["A", "B"]))
    // Test runs 2 times with pairs: (1, "A"), (2, "B")
    ```

- **Running Selected Test Cases**:

  - To enable running specific test cases individually, the test arguments must conform to certain protocols in a specific precedence order:
    1. **CustomTestArgumentEncodable**
    2. **RawRepresentable**, where `RawValue` conforms to `Encodable`
    3. **Encodable**
    4. **Identifiable**, where `ID` conforms to `Encodable`
  - **Benefits**:
    - **Deterministic Matching**: Allows the testing framework to uniquely identify and execute individual test cases.
    - **Enhanced Debugging**: Makes it easier to re-run and debug failing cases without executing all test cases.
  - **Considerations**:
    - Ensure that all arguments of a test case conform to one of the specified protocols.
    - If any argument doesn't meet the requirements, selective execution of that test case isn't possible.

## Reference

* https://developer.apple.com/documentation/testing/definingtests
* https://developer.apple.com/documentation/testing/organizingtests
* https://developer.apple.com/documentation/testing/parameterizedtesting
* https://developer.apple.com/documentation/testing/migratingfromxctest
* https://developer.apple.com/documentation/testing/parallelization