class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate']/1.0;
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={
      'rate' : this.rate,
      'count' : this.count
    };
    return data;
  }
}