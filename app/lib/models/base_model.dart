// class BaseModel {
//   bool isActive;
//   bool isDeleted;
//   DateTime lastTimestamp;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int createdBy;
//   int updatedBy;

//   BaseModel({
//     this.isActive = true,
//     this.isDeleted = false,
//     this.lastTimestamp,
//     this.createdAt,
//     this.updatedAt,
//     this.createdBy,
//     this.updatedBy,
//   });

//   factory BaseModel.fromJson(Map<String, dynamic> json) {
//     return BaseModel(
//       isActive: json['is_active'],
//       isDeleted: json['is_deleted'],
//       lastTimestamp: DateTime.parse(json['last_timestamp']),
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//       createdBy: json['created_by'],
//       updatedBy: json['updated_by'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'is_active': isActive,
//       'is_deleted': isDeleted,
//       'last_timestamp': lastTimestamp.toIso8601String(),
//       'created_at': createdAt.toIso8601String(),
//       'updated_at': updatedAt.toIso8601String(),
//       'created_by': createdBy,
//       'updated_by': updatedBy,
//     };
//   }
// }