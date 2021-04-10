//
//  APIDataProvider.swift
//  HowClose
//
//  Created by Burak Kaya on 13.03.2021.
//

import Alamofire

public struct APIDataProvider: DataProviderProtocol {
    private var mainSession: Session!
    private var interceptor: APIInterceptor!
    private var requestHeaderStorage: RequestHeaderStorage!
    
    init(storage: RequestHeaderStorage) {
        requestHeaderStorage = storage
        interceptor = APIInterceptor(storage: storage)
        let config = Session.default.session.configuration
        mainSession = Session(configuration: config, interceptor: interceptor)
    }
    
    private func createRequest<T: RequestProtocol>(_ request: T) -> DataRequest {
        let adapter = ApiRequestAdapter(method: request.method,
                                        parameters: request.parameters,
                                        encoding: request.encoding,
                                        url: request.url)
        let request = mainSession.request(adapter.url,
                                          method: adapter.method,
                                          parameters: adapter.parameters,
                                          encoding: adapter.encoding,
                                          headers: nil)
        return request
    }
    
    public func fetchData<T: RequestProtocol>(for request: T, result: DataProviderResult<T.ResponseType>?) {
        let request = createRequest(request)
        var responseData: AFDataResponse<Data>?
        request.validate()
        request.responseData { (response) in
            responseData = response
            if let value = response.value {
                if let json = String(data: value, encoding: .utf8) {
                    print("Response JSON: \n\(json)")
                }
            }
        }
        request.responseDecodable(of: T.ResponseType.self) { (response) in
            switch response.result {
            case .success(let value):
                result?(.success(value))
            case .failure(let error):
                print("ERROR: ", error)
                self.handleFailure(response: responseData, result: result)
            }
        }
    }
    
    private func handleFailure<T: Decodable>(response: AFDataResponse<Data>?, result: DataProviderResult<T>?) {
        guard let response = response else { return }
        if let statusCode = response.response?.statusCode, statusCode == 401 {
            mainSession.cancelAllRequests(completingOnQueue: .main) {
                self.requestHeaderStorage.didGetUnauthorizedError()
            }
            return
        }
        if let data = response.data, let serviceError = ApiError.decode(data) {
            if let json = String(data: data, encoding: .utf8) {
                print("Response JSON: \(json)")
            }
            handleError(statusCode: response.response?.statusCode, localError: nil, serviceError: serviceError, result: result)
        } else if let error = response.error {
            handleError(statusCode: nil, localError: error, serviceError: nil, result: result)
        } else {
            handleError(statusCode: nil, localError: nil, serviceError: nil, result: result)
        }
    }
    
    private func handleError<T: Decodable>(statusCode: Int?, localError: Error?, serviceError: ApiError?, result: DataProviderResult<T>?) {
        if let error = serviceError {
            result?(.failure(error))
        } else if let error = localError as? URLError, error.code == .notConnectedToInternet {
            let error = ApiError(code: ErrorCode.connection.rawValue, title: nil, message: error.localizedDescription)
            result?(.failure(error))
        } else if localError != nil {
            let customError = ApiError(code: ErrorCode.local.rawValue, title: nil, message: "Connection Error")
            result?(.failure(customError))
        } else {
            let error = ApiError(code: ErrorCode.unknown.rawValue, title: nil, message: "Unknow Error")
            result?(.failure(error))
        }
    }
}
