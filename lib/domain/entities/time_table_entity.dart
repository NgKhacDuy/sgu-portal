class TimeTableEntity {
  int? totalItems;
  int? totalPages;
  int? hocKy;
  int? hocKyTheoNgayHienTai;
  List<DsHocKy>? dsHocKy;

  TimeTableEntity(
      {this.totalItems,
      this.totalPages,
      this.hocKy,
      this.hocKyTheoNgayHienTai,
      this.dsHocKy});

  TimeTableEntity.fromJson(Map<String, dynamic> json) {
    totalItems = json['total_items'];
    totalPages = json['total_pages'];
    hocKy = json['hoc_ky'];
    hocKyTheoNgayHienTai = json['hoc_ky_theo_ngay_hien_tai'];
    if (json['ds_hoc_ky'] != null) {
      dsHocKy = <DsHocKy>[];
      json['ds_hoc_ky'].forEach((v) {
        dsHocKy!.add(DsHocKy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_items'] = totalItems;
    data['total_pages'] = totalPages;
    data['hoc_ky'] = hocKy;
    data['hoc_ky_theo_ngay_hien_tai'] = hocKyTheoNgayHienTai;
    if (dsHocKy != null) {
      data['ds_hoc_ky'] = dsHocKy!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DsHocKy {
  int? hocKy;
  String? tenHocKy;
  int? hiendiensv;
  String? ngayBatDauHk;
  String? ngayKetThucHk;

  DsHocKy(
      {this.hocKy,
      this.tenHocKy,
      this.hiendiensv,
      this.ngayBatDauHk,
      this.ngayKetThucHk});

  DsHocKy.fromJson(Map<String, dynamic> json) {
    hocKy = json['hoc_ky'];
    tenHocKy = json['ten_hoc_ky'];
    hiendiensv = json['hiendiensv'];
    ngayBatDauHk = json['ngay_bat_dau_hk'];
    ngayKetThucHk = json['ngay_ket_thuc_hk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hoc_ky'] = hocKy;
    data['ten_hoc_ky'] = tenHocKy;
    data['hiendiensv'] = hiendiensv;
    data['ngay_bat_dau_hk'] = ngayBatDauHk;
    data['ngay_ket_thuc_hk'] = ngayKetThucHk;
    return data;
  }
}
