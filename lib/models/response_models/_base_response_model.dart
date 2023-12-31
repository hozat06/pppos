class BaseResponseModel<T> {
  late bool isStatus;
  late String message;
  T? data;

  BaseResponseModel({required this.isStatus, required this.message, this.data});

  BaseResponseModel.error(String msg) {
    isStatus = false;
    message = msg;
  }

  BaseResponseModel.fromJson(Map<String, dynamic> json) {
    isStatus = json['isStatus'];
    message = json['message'];
    //data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isStatus'] = isStatus;
    data['message'] = message;
    //data['data'] = data;
    return data;
  }
}
