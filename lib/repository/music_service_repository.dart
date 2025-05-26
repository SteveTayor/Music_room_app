import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/music_service.dart';

class MusicServiceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<MusicService>> getMusicServices() async {
    try {
      final QuerySnapshot snapshot =
          await _firestore.collection('music_services').orderBy('order').get();

      return snapshot.docs
          .map(
            (doc) => MusicService.fromFirestore(
              doc.id,
              doc.data() as Map<String, dynamic>,
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch music services: $e');
    }
  }
}
