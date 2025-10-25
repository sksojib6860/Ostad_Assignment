class Product {
  String? status;
  List<Data>? data;

  Product(this.status, this.data);

  Product.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    if (json["data"] != null) {
      data = <Data>[];
      json["data"].forEach((d) {
        data!.add(Data.fromJson(d));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? productName;
  int? productCode;
  String? img;
  int? qty;
  int? unitPrice;
  int? totalPrice;

  Data(
    this.sId,
    this.productName,
    this.productCode,
    this.img,
    this.qty,
    this.unitPrice,
    this.totalPrice,
  );

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productName = json['ProductName'];
    productCode = json['ProductCode'];
    img = json['Img'];
    qty = json['Qty'];
    unitPrice = json['UnitPrice'];
    totalPrice = json['TotalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProductName'] = productName;
    data['ProductCode'] = productCode;
    data['Img'] = img;
    data['Qty'] = qty;
    data['UnitPrice'] = unitPrice;
    data['TotalPrice'] = totalPrice;
    return data;
  }
}
