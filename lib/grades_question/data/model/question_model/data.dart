class Data {
	String? name;
	String? email;
	String? phone;
	String? nationalId;
	String? lang;
	String? department;
	String? type;
	int? userId;
	DateTime? updatedAt;
	DateTime? createdAt;
	int? id;

	Data({
		this.name, 
		this.email, 
		this.phone, 
		this.nationalId, 
		this.lang, 
		this.department, 
		this.type, 
		this.userId, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				name: json['name'] as String?,
				email: json['email'] as String?,
				phone: json['phone'] as String?,
				nationalId: json['national_id'] as String?,
				lang: json['lang'] as String?,
				department: json['department'] as String?,
				type: json['type'] as String?,
				userId: json['user_id'] as int?,
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				id: json['id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'email': email,
				'phone': phone,
				'national_id': nationalId,
				'lang': lang,
				'department': department,
				'type': type,
				'user_id': userId,
				'updated_at': updatedAt?.toIso8601String(),
				'created_at': createdAt?.toIso8601String(),
				'id': id,
			};
}
