class PhotosModel{
  //the object you want to show
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  ////now create constructor to get the data
  PhotosModel({
     this.albumId,this.id,this.title,this.url,this.thumbnailUrl
});

  ////now to convert into map from json if there si
  PhotosModel.fromJson(Map<String,dynamic>json){
    albumId =json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl= json['thumbnailUrl'];
  }

}


class Photos {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Photos({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});
  Photos.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['albumId'] = this.albumId;
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['url'] = this.url;
  //   data['thumbnailUrl'] = this.thumbnailUrl;
  //   return data;
  // }
}