class TimeTableEntity {
  num? totalItems;
  num? totalPages;
  bool? trongThoiGianDangKy;
  bool? trongThoiGianDuyetKqdk;
  bool? hienCotTachPhieuNopTien;
  bool? addinDuyetKqdk;
  bool? hienCotHocPhi;
  bool? hienCotMaLop;
  bool? hienThiCotLichThi;
  String? messageTietbd;
  bool? isShowTietbd;
  bool? isMergeDongTkbhk;
  String? messageSoTiet;
  List<DsNhomTo>? dsNhomTo;
  List<DsFieldAn>? dsFieldAn;
  bool? hienThiCotMonHocBd;
  String? thongBao;
  String? urlHocLieuChiTiet;
  String? bearerToken;

  TimeTableEntity(
      {this.totalItems,
      this.totalPages,
      this.trongThoiGianDangKy,
      this.trongThoiGianDuyetKqdk,
      this.hienCotTachPhieuNopTien,
      this.addinDuyetKqdk,
      this.hienCotHocPhi,
      this.hienCotMaLop,
      this.hienThiCotLichThi,
      this.messageTietbd,
      this.isShowTietbd,
      this.isMergeDongTkbhk,
      this.messageSoTiet,
      this.dsNhomTo,
      this.dsFieldAn,
      this.hienThiCotMonHocBd,
      this.thongBao,
      this.urlHocLieuChiTiet,
      this.bearerToken});

  TimeTableEntity.fromJson(Map<String, dynamic> json) {
    totalItems = json['total_items'];
    totalPages = json['total_pages'];
    trongThoiGianDangKy = json['trong_thoi_gian_dang_ky'];
    trongThoiGianDuyetKqdk = json['trong_thoi_gian_duyet_kqdk'];
    hienCotTachPhieuNopTien = json['hien_cot_tach_phieu_nop_tien'];
    addinDuyetKqdk = json['addin_duyet_kqdk'];
    hienCotHocPhi = json['hien_cot_hoc_phi'];
    hienCotMaLop = json['hien_cot_ma_lop'];
    hienThiCotLichThi = json['hien_thi_cot_lich_thi'];
    messageTietbd = json['message_tietbd'];
    isShowTietbd = json['is_show_tietbd'];
    isMergeDongTkbhk = json['is_merge_dong_tkbhk'];
    messageSoTiet = json['message_so_tiet'];
    if (json['ds_nhom_to'] != null) {
      dsNhomTo = <DsNhomTo>[];
      json['ds_nhom_to'].forEach((v) {
        dsNhomTo!.add(DsNhomTo.fromJson(v));
      });
    }
    if (json['ds_field_an'] != null) {
      dsFieldAn = <DsFieldAn>[];
      json['ds_field_an'].forEach((v) {
        dsFieldAn!.add(DsFieldAn.fromJson(v));
      });
    }
    hienThiCotMonHocBd = json['hien_thi_cot_mon_hoc_bd'];
    thongBao = json['thong_bao'];
    urlHocLieuChiTiet = json['url_hoc_lieu_chi_tiet'];
    bearerToken = json['bearer_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_items'] = totalItems;
    data['total_pages'] = totalPages;
    data['trong_thoi_gian_dang_ky'] = trongThoiGianDangKy;
    data['trong_thoi_gian_duyet_kqdk'] = trongThoiGianDuyetKqdk;
    data['hien_cot_tach_phieu_nop_tien'] = hienCotTachPhieuNopTien;
    data['addin_duyet_kqdk'] = addinDuyetKqdk;
    data['hien_cot_hoc_phi'] = hienCotHocPhi;
    data['hien_cot_ma_lop'] = hienCotMaLop;
    data['hien_thi_cot_lich_thi'] = hienThiCotLichThi;
    data['message_tietbd'] = messageTietbd;
    data['is_show_tietbd'] = isShowTietbd;
    data['is_merge_dong_tkbhk'] = isMergeDongTkbhk;
    data['message_so_tiet'] = messageSoTiet;
    if (dsNhomTo != null) {
      data['ds_nhom_to'] = dsNhomTo!.map((v) => v.toJson()).toList();
    }
    if (dsFieldAn != null) {
      data['ds_field_an'] = dsFieldAn!.map((v) => v.toJson()).toList();
    }
    data['hien_thi_cot_mon_hoc_bd'] = hienThiCotMonHocBd;
    data['thong_bao'] = thongBao;
    data['url_hoc_lieu_chi_tiet'] = urlHocLieuChiTiet;
    data['bearer_token'] = bearerToken;
    return data;
  }
}

class DsNhomTo {
  String? idToHoc;
  String? idMon;
  String? maMon;
  String? tenMon;
  String? soTc;
  num? soTcSo;
  bool? isVuot;
  String? nhomTo;
  String? lop;
  String? khoi;
  bool? isKdk;
  num? slDk;
  num? slCp;
  num? slCl;
  bool? isHl;
  bool? enable;
  bool? hauk;
  bool? isDk;
  bool? isRot;
  bool? isCtdt;
  bool? isChctdt;
  bool? isKgLt;
  num? thu;
  num? tbd;
  num? soTiet;
  String? gcToHoc;
  bool? isKgHuyKqdk;
  bool? isKgXetTrungtkb;
  List<String>? dsLop;
  String? tkb;
  String? tooltip;
  String? tuGio;
  String? denGio;
  String? phong;
  String? gv;

  DsNhomTo(
      {this.idToHoc,
      this.idMon,
      this.maMon,
      this.tenMon,
      this.soTc,
      this.soTcSo,
      this.isVuot,
      this.nhomTo,
      this.lop,
      this.khoi,
      this.isKdk,
      this.slDk,
      this.slCp,
      this.slCl,
      this.isHl,
      this.enable,
      this.hauk,
      this.isDk,
      this.isRot,
      this.isCtdt,
      this.isChctdt,
      this.isKgLt,
      this.thu,
      this.tbd,
      this.soTiet,
      this.gcToHoc,
      this.isKgHuyKqdk,
      this.isKgXetTrungtkb,
      this.dsLop,
      this.tkb,
      this.tooltip,
      this.tuGio,
      this.denGio,
      this.phong,
      this.gv});

  DsNhomTo.fromJson(Map<String, dynamic> json) {
    idToHoc = json['id_to_hoc'];
    idMon = json['id_mon'];
    maMon = json['ma_mon'];
    tenMon = json['ten_mon'];
    soTc = json['so_tc'];
    soTcSo = json['so_tc_so'];
    isVuot = json['is_vuot'];
    nhomTo = json['nhom_to'];
    lop = json['lop'];
    khoi = json['khoi'];
    isKdk = json['is_kdk'];
    slDk = json['sl_dk'];
    slCp = json['sl_cp'];
    slCl = json['sl_cl'];
    isHl = json['is_hl'];
    enable = json['enable'];
    hauk = json['hauk'];
    isDk = json['is_dk'];
    isRot = json['is_rot'];
    isCtdt = json['is_ctdt'];
    isChctdt = json['is_chctdt'];
    isKgLt = json['is_kg_lt'];
    thu = json['thu'];
    tbd = json['tbd'];
    soTiet = json['so_tiet'];
    gcToHoc = json['gc_to_hoc'];
    isKgHuyKqdk = json['is_kg_huy_kqdk'];
    isKgXetTrungtkb = json['is_kg_xet_trungtkb'];
    dsLop = json["ds_lop"] == null
        ? []
        : List<String>.from(json["ds_lop"]!.map((x) => x));
    tkb = json['tkb'];
    tooltip = json['tooltip'];
    tuGio = json['tu_gio'];
    denGio = json['den_gio'];
    phong = json['phong'];
    gv = json['gv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_to_hoc'] = idToHoc;
    data['id_mon'] = idMon;
    data['ma_mon'] = maMon;
    data['ten_mon'] = tenMon;
    data['so_tc'] = soTc;
    data['so_tc_so'] = soTcSo;
    data['is_vuot'] = isVuot;
    data['nhom_to'] = nhomTo;
    data['lop'] = lop;
    data['khoi'] = khoi;
    data['is_kdk'] = isKdk;
    data['sl_dk'] = slDk;
    data['sl_cp'] = slCp;
    data['sl_cl'] = slCl;
    data['is_hl'] = isHl;
    data['enable'] = enable;
    data['hauk'] = hauk;
    data['is_dk'] = isDk;
    data['is_rot'] = isRot;
    data['is_ctdt'] = isCtdt;
    data['is_chctdt'] = isChctdt;
    data['is_kg_lt'] = isKgLt;
    data['thu'] = thu;
    data['tbd'] = tbd;
    data['so_tiet'] = soTiet;
    data['gc_to_hoc'] = gcToHoc;
    data['is_kg_huy_kqdk'] = isKgHuyKqdk;
    data['is_kg_xet_trungtkb'] = isKgXetTrungtkb;
    data['ds_lop'] = dsLop;
    data['tkb'] = tkb;
    data['tooltip'] = tooltip;
    data['tu_gio'] = tuGio;
    data['den_gio'] = denGio;
    data['phong'] = phong;
    data['gv'] = gv;
    return data;
  }
}

class DsFieldAn {
  String? tenField;
  bool? enable;

  DsFieldAn({this.tenField, this.enable});

  DsFieldAn.fromJson(Map<String, dynamic> json) {
    tenField = json['ten_field'];
    enable = json['enable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ten_field'] = tenField;
    data['enable'] = enable;
    return data;
  }
}
