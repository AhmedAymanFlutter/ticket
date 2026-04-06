import 'package:dartz/dartz.dart';
import 'package:ticket/core/error/failures.dart';
import 'package:ticket/features/hotels/data/datasources/hotels_remote_data_source.dart';
import 'package:ticket/features/hotels/domain/entities/hotel_entity.dart';
import 'package:ticket/features/hotels/domain/repositories/hotels_repository.dart';

class HotelsRepositoryImpl implements HotelsRepository {
  final HotelsRemoteDataSource remoteDataSource;

  HotelsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<HotelEntity>>> getHotels() async {
    try {
      final result = await remoteDataSource.getHotels();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, HotelDetailsEntity>> getHotelDetails(dynamic id) async {
    try {
      final result = await remoteDataSource.getHotelDetails(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
