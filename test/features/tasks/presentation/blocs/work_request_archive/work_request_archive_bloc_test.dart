import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:under_control_v2/features/core/usecases/usecase.dart';
import 'package:under_control_v2/features/filter/presentation/blocs/filter/filter_bloc.dart';
import 'package:under_control_v2/features/tasks/domain/entities/work_request/work_requests_stream.dart';
import 'package:under_control_v2/features/tasks/domain/usecases/work_order/get_archive_work_requests_stream.dart';
import 'package:under_control_v2/features/tasks/presentation/blocs/work_request_archive/work_request_archive_bloc.dart';

class MockFilterBloc extends Mock implements Stream<FilterState>, FilterBloc {}

class MockGetArchiveWorkRequestsStream extends Mock
    implements GetArchiveWorkRequestsStream {}

void main() {
  late MockFilterBloc mockFilterBloc;

  late MockGetArchiveWorkRequestsStream mockGetArchiveWorkRequestsStream;

  late WorkRequestArchiveBloc workRequestArchiveBloc;

  setUp(() {
    mockFilterBloc = MockFilterBloc();

    when(() => mockFilterBloc.stream).thenAnswer(
      (_) => Stream.fromFuture(
        Future.value(
          FilterEmptyState(),
        ),
      ),
    );
    when(() => mockFilterBloc.state).thenAnswer(
      (_) => FilterEmptyState(),
    );

    mockGetArchiveWorkRequestsStream = MockGetArchiveWorkRequestsStream();
    workRequestArchiveBloc = WorkRequestArchiveBloc(
      filterBloc: mockFilterBloc,
      getArchiveWorkRequestsStream: mockGetArchiveWorkRequestsStream,
    );
  });

  setUpAll(() {
    registerFallbackValue(
      const ItemsInLocationsParams(
        locations: ['loc1', 'loc2'],
        companyId: 'companyId',
      ),
    );
  });

  group('Work Request Archive BLoC', () {
    test(
      'should emit [WorkRequestArchiveEmptyState] as an initial state',
      () async {
        // assert
        expect(workRequestArchiveBloc.state, WorkRequestArchiveEmptyState());
      },
    );

    group('GetWorkRequestsStream', () {
      blocTest<WorkRequestArchiveBloc, WorkRequestArchiveState>(
        'should emit [WorkRequestLoadedState] when GetWorkRequestsStream is called',
        build: () => workRequestArchiveBloc,
        act: (bloc) async {
          bloc.add(GetWorkRequestsArchiveStreamEvent());
          when(() => mockGetArchiveWorkRequestsStream(any())).thenAnswer(
            (_) async => Right(
              WorkRequestsStream(
                allWorkRequests: Stream.fromIterable([]),
              ),
            ),
          );
        },
        expect: () => [isA<WorkRequestArchiveLoadedState>()],
      );
    });
  });
}
