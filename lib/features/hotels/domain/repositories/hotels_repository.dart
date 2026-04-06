import 'package:dartz/dartz.dart';
import 'package:ticket/core/error/failures.dart';
import 'package:ticket/features/hotels/domain/entities/hotel_entity.dart';

abstract class HotelsRepository {
  Future<Either<Failure, List<HotelEntity>>> getHotels();
  Future<Either<Failure, HotelDetailsEntity>> getHotelDetails(dynamic id);
}
