class TimeTableParam {
  int? hocKy;
  int? loaiDoiTuong;
  Null idDuLieu;

  TimeTableParam({this.hocKy, this.loaiDoiTuong, this.idDuLieu});

  TimeTableParam.fromJson(Map<String, dynamic> json) {
    hocKy = json['hoc_ky'];
    loaiDoiTuong = json['loai_doi_tuong'];
    idDuLieu = json['id_du_lieu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hoc_ky'] = hocKy;
    data['loai_doi_tuong'] = loaiDoiTuong;
    data['id_du_lieu'] = idDuLieu;
    return data;
  }
}
