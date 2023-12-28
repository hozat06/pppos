class BaseResponseModel {
  bool? isStatus;
  String? message;
}

class SuccessResponseModel<T> extends BaseResponseModel {
  T? data;
}
