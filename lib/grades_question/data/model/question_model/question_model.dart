import 'data.dart';

class QuestionModel {
	String? key;
	String? msg;
	int? status;
	Data? data;

	QuestionModel({this.key, this.msg, this.status, this.data});

	factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
				key: json['key'] as String?,
				msg: json['msg'] as String?,
				status: json['status'] as int?,
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'key': key,
				'msg': msg,
				'status': status,
				'data': data?.toJson(),
			};
}
