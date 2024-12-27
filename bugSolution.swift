func fetchData(completion: @escaping (Result<[String], Error>) -> Void) {
    // Simulate network request
    DispatchQueue.global().asyncAfter(deadline: .now() + 2) { 
        let data = ["data1", "data2", "data3"]
        // Simulate a potential error
        if Bool.random() { // 50% chance of an error
            completion(.failure(NSError(domain: "com.example.myapp", code: -1, userInfo: nil)))
        } else {
            completion(.success(data))
        }
    }
}

fetchData { result in
    switch result {
    case .success(let data):
        print("Successfully fetched data: "
              + data.joined(separator: ", "))
    case .failure(let error):
        print("Error fetching data: "
              + error.localizedDescription)
    }
}