import 'data.dart';

class CertivicateModel {
	String? key;
	String? msg;
	int? status;
	Data? data;

	CertivicateModel({this.key, this.msg, this.status, this.data});

	factory CertivicateModel.fromJson(Map<String, dynamic> json) {
		return CertivicateModel(
			key: json['key'] as String?,
			msg: json['msg'] as String?,
			status: json['status'] as int?,
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'key': key,
				'msg': msg,
				'status': status,
				'data': data?.toJson(),
			};
}
