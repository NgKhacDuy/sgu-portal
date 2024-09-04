class TypeSemesterEntity {
  int? totalItems;
  int? totalPages;
  List<DsDoiTuongTkb>? dsDoiTuongTkb;

  TypeSemesterEntity({this.totalItems, this.totalPages, this.dsDoiTuongTkb});

  TypeSemesterEntity.fromJson(Map<String, dynamic> json) {
    totalItems = json['total_items'];
    totalPages = json['total_pages'];
    if (json['ds_doi_tuong_tkb'] != null) {
      dsDoiTuongTkb = <DsDoiTuongTkb>[];
      json['ds_doi_tuong_tkb'].forEach((v) {
        dsDoiTuongTkb!.add(DsDoiTuongTkb.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_items'] = totalItems;
    data['total_pages'] = totalPages;
    if (dsDoiTuongTkb != null) {
      data['ds_doi_tuong_tkb'] = dsDoiTuongTkb!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DsDoiTuongTkb {
  int? loaiDoiTuong;
  String? tenDoiTuong;

  DsDoiTuongTkb({this.loaiDoiTuong, this.tenDoiTuong});

  DsDoiTuongTkb.fromJson(Map<String, dynamic> json) {
    loaiDoiTuong = json['loai_doi_tuong'];
    tenDoiTuong = json['ten_doi_tuong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loai_doi_tuong'] = loaiDoiTuong;
    data['ten_doi_tuong'] = tenDoiTuong;
    return data;
  }
}
