class Transaction {
  dynamic id;
  dynamic uuid;
  dynamic jenis;
  dynamic latitude;
  dynamic longitude;
  dynamic createdat;
  dynamic updatedat;

  Transaction({
    this.id,
    this.uuid,
    this.jenis,
    this.latitude,
    this.longitude,
    this.createdat,
    this.updatedat,
  });

  factory Transaction.fromJson(Map<dynamic, dynamic> json) {
    return Transaction(
      id: json['id'],
      uuid: json['uuid'],
      jenis: json['jenis'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      createdat: json['created_at'],
      updatedat: json['updated_at'],
    );
  }
}

class TransactionPost {
  dynamic uuid;
  dynamic jenis;
  dynamic latitude;
  dynamic longitude;

  TransactionPost({
    this.uuid,
    this.jenis,
    this.latitude,
    this.longitude,
  });

  factory TransactionPost.fromJson(Map<dynamic, dynamic> json) {
    return TransactionPost(
      uuid: json['uuid'],
      jenis: json['jenis'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map toMap() {
    var map = new Map<dynamic, dynamic>();
    map["uuid"] = uuid;
    map["jenis"] = jenis;
    map["latitude"] = latitude;
    map["longitude"] = longitude;

    return map;
  }
}
