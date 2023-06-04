import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "member_id" field.
  String? _memberId;
  String get memberId => _memberId ?? '';
  bool hasMemberId() => _memberId != null;

  // "member_qr" field.
  String? _memberQr;
  String get memberQr => _memberQr ?? '';
  bool hasMemberQr() => _memberQr != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "pdpa_consent" field.
  bool? _pdpaConsent;
  bool get pdpaConsent => _pdpaConsent ?? false;
  bool hasPdpaConsent() => _pdpaConsent != null;

  // "reward_pts" field.
  double? _rewardPts;
  double get rewardPts => _rewardPts ?? 0.0;
  bool hasRewardPts() => _rewardPts != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "date_delete" field.
  DateTime? _dateDelete;
  DateTime? get dateDelete => _dateDelete;
  bool hasDateDelete() => _dateDelete != null;

  // "contact_email" field.
  String? _contactEmail;
  String get contactEmail => _contactEmail ?? '';
  bool hasContactEmail() => _contactEmail != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _memberId = snapshotData['member_id'] as String?;
    _memberQr = snapshotData['member_qr'] as String?;
    _company = snapshotData['company'] as String?;
    _pdpaConsent = snapshotData['pdpa_consent'] as bool?;
    _rewardPts = castToType<double>(snapshotData['reward_pts']);
    _isDeleted = snapshotData['is_deleted'] as bool?;
    _dateDelete = snapshotData['date_delete'] as DateTime?;
    _contactEmail = snapshotData['contact_email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? memberId,
  String? memberQr,
  String? company,
  bool? pdpaConsent,
  double? rewardPts,
  bool? isDeleted,
  DateTime? dateDelete,
  String? contactEmail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'member_id': memberId,
      'member_qr': memberQr,
      'company': company,
      'pdpa_consent': pdpaConsent,
      'reward_pts': rewardPts,
      'is_deleted': isDeleted,
      'date_delete': dateDelete,
      'contact_email': contactEmail,
    }.withoutNulls,
  );

  return firestoreData;
}
