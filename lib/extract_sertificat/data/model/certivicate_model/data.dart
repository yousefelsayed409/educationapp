class Data {
	String? name;
	String? nationalId;
	String? lang;
	String? department;
	String? type;
	String? numberCertificate;
	String? graduationYear;
	String? typePayment;
	String? imageId;
	String? image;
	int? userId;
	DateTime? updatedAt;
	DateTime? createdAt;
	int? id;

	Data({
		this.name, 
		this.nationalId, 
		this.lang, 
		this.department, 
		this.type, 
		this.numberCertificate, 
		this.graduationYear, 
		this.typePayment, 
		this.imageId, 
		this.image, 
		this.userId, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				name: json['name'] as String?,
				nationalId: json['national_id'] as String?,
				lang: json['lang'] as String?,
				department: json['department'] as String?,
				type: json['type'] as String?,
				numberCertificate: json['number_certificate'] as String?,
				graduationYear: json['graduation_year'] as String?,
				typePayment: json['type_payment'] as String?,
				imageId: json['image_id'] as String?,
				image: json['image'] as String?,
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
				'national_id': nationalId,
				'lang': lang,
				'department': department,
				'type': type,
				'number_certificate': numberCertificate,
				'graduation_year': graduationYear,
				'type_payment': typePayment,
				'image_id': imageId,
				'image': image,
				'user_id': userId,
				'updated_at': updatedAt?.toIso8601String(),
				'created_at': createdAt?.toIso8601String(),
				'id': id,
			};
}
