class BootsCharge {
  String? message;
  Data? data;

  BootsCharge({this.message, this.data});

  BootsCharge.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? isUser;
  int? idPost;
  int? postingFree;

  Data({this.isUser, this.idPost, this.postingFree});

  Data.fromJson(Map<String, dynamic> json) {
    isUser = json['isUser'];
    idPost = json['idPost'];
    postingFree = json['postingFree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isUser'] = this.isUser;
    data['idPost'] = this.idPost;
    data['postingFree'] = this.postingFree;
    return data;
  }
}
