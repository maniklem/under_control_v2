import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:under_control_v2/features/assets/utils/asset_status.dart';
import 'package:under_control_v2/features/company_profile/presentation/blocs/company_profile/company_profile_bloc.dart';
import 'package:under_control_v2/features/core/error/failures.dart';
import 'package:under_control_v2/features/core/usecases/usecase.dart';
import 'package:under_control_v2/features/tasks/data/models/work_request/work_request_model.dart';
import 'package:under_control_v2/features/tasks/domain/entities/task_priority.dart';
import 'package:under_control_v2/features/tasks/domain/usecases/work_order/add_work_request.dart';
import 'package:under_control_v2/features/tasks/domain/usecases/work_order/cancel_work_request.dart';
import 'package:under_control_v2/features/tasks/domain/usecases/work_order/delete_work_request.dart';
import 'package:under_control_v2/features/tasks/domain/usecases/work_order/update_work_request.dart';
import 'package:under_control_v2/features/tasks/presentation/blocs/work_request_management/work_request_management_bloc.dart';

class MockCompanyProfileBloc extends Mock
    implements Stream<CompanyProfileState>, CompanyProfileBloc {}

class MockAddWorkRequest extends Mock implements AddWorkRequest {}

class MockDeleteWorkRequest extends Mock implements DeleteWorkRequest {}

class MockCancelWorkRequest extends Mock implements CancelWorkRequest {}

class MockUpdateWorkRequest extends Mock implements UpdateWorkRequest {}

void main() {
  late MockCompanyProfileBloc mockCompanyProfileBloc;

  late MockAddWorkRequest mockAddWorkRequest;
  late MockDeleteWorkRequest mockDeleteWorkRequest;
  late MockCancelWorkRequest mockCancelWorkRequest;
  late MockUpdateWorkRequest mockUpdateWorkRequest;

  late WorkRequestManagementBloc workRequestManagementBloc;

  const companyId = 'companyId';

  final tWorkRequestModel = WorkRequestModel(
    id: 'id',
    title: 'title',
    description: 'description',
    date: DateTime.now(),
    locationId: 'locationId',
    userId: 'userId',
    assetId: 'assetId',
    images: const [],
    video: 'video',
    priority: TaskPriority.low,
    count: 0,
    taskId: 'taskId',
    assetStatus: AssetStatus.ok,
    cancelled: false,
  );

  final tWorkRequestParams = WorkRequestParams(
    workRequest: tWorkRequestModel,
    companyId: companyId,
  );

  setUp(() {
    mockCompanyProfileBloc = MockCompanyProfileBloc();

    mockAddWorkRequest = MockAddWorkRequest();
    mockDeleteWorkRequest = MockDeleteWorkRequest();
    mockCancelWorkRequest = MockCancelWorkRequest();
    mockUpdateWorkRequest = MockUpdateWorkRequest();

    when(() => mockCompanyProfileBloc.stream).thenAnswer(
      (_) => Stream.fromFuture(
        Future.value(CompanyProfileEmpty()),
      ),
    );

    workRequestManagementBloc = WorkRequestManagementBloc(
      companyProfileBloc: mockCompanyProfileBloc,
      addWorkRequest: mockAddWorkRequest,
      deleteWorkRequest: mockDeleteWorkRequest,
      updateWorkRequest: mockUpdateWorkRequest,
      cancelWorkRequest: mockCancelWorkRequest,
    );
  });

  setUpAll(() {
    registerFallbackValue(tWorkRequestParams);
  });

  group('Work Request Management BLoC', () {
    test(
      'should emit [WorkRequestManagementEmptyState] as an initial state',
      () async {
        // assert
        expect(
            workRequestManagementBloc.state, WorkRequestManagementEmptyState());
      },
    );

    group('AddWorkRequest', () {
      blocTest<WorkRequestManagementBloc, WorkRequestManagementState>(
        'should emit [WorkRequestManagementSuccessfulStete]',
        build: () => workRequestManagementBloc,
        act: (bloc) async {
          when(() => mockAddWorkRequest(any()))
              .thenAnswer((_) async => const Right(''));
          bloc.add(AddWorkRequestEvent(workRequest: tWorkRequestModel));
        },
        expect: () => [
          WorkRequestManagementLoadingState(),
          isA<WorkRequestManagementSuccessState>(),
        ],
      );
      blocTest<WorkRequestManagementBloc, WorkRequestManagementState>(
        'should emit [WorkRequestManagementErrorStete]',
        build: () => workRequestManagementBloc,
        act: (bloc) async {
          when(() => mockAddWorkRequest(any())).thenAnswer(
            (_) async => const Left(
              DatabaseFailure(),
            ),
          );
          bloc.add(AddWorkRequestEvent(workRequest: tWorkRequestModel));
        },
        expect: () => [
          WorkRequestManagementLoadingState(),
          isA<WorkRequestManagementErrorState>(),
        ],
      );
    });
    group('DeleteWorkRequest', () {
      blocTest<WorkRequestManagementBloc, WorkRequestManagementState>(
        'should emit [WorkRequestManagementSuccessfulStete]',
        build: () => workRequestManagementBloc,
        act: (bloc) async {
          when(() => mockDeleteWorkRequest(any()))
              .thenAnswer((_) async => Right(VoidResult()));
          bloc.add(DeleteWorkRequestEvent(workRequest: tWorkRequestModel));
        },
        expect: () => [
          WorkRequestManagementLoadingState(),
          isA<WorkRequestManagementSuccessState>(),
        ],
      );
      blocTest<WorkRequestManagementBloc, WorkRequestManagementState>(
        'should emit [WorkRequestManagementErrorStete]',
        build: () => workRequestManagementBloc,
        act: (bloc) async {
          when(() => mockDeleteWorkRequest(any())).thenAnswer(
            (_) async => const Left(
              DatabaseFailure(),
            ),
          );
          bloc.add(DeleteWorkRequestEvent(workRequest: tWorkRequestModel));
        },
        expect: () => [
          WorkRequestManagementLoadingState(),
          isA<WorkRequestManagementErrorState>(),
        ],
      );
    });
    group('CancelWorkRequest', () {
      blocTest<WorkRequestManagementBloc, WorkRequestManagementState>(
        'should emit [WorkRequestManagementSuccessfulStete]',
        build: () => workRequestManagementBloc,
        act: (bloc) async {
          when(() => mockCancelWorkRequest(any()))
              .thenAnswer((_) async => Right(VoidResult()));
          bloc.add(CancelWorkRequestEvent(
            workRequest: tWorkRequestModel,
            comment: '',
          ));
        },
        expect: () => [
          WorkRequestManagementLoadingState(),
          isA<WorkRequestManagementSuccessState>(),
        ],
      );
      blocTest<WorkRequestManagementBloc, WorkRequestManagementState>(
        'should emit [WorkRequestManagementErrorStete]',
        build: () => workRequestManagementBloc,
        act: (bloc) async {
          when(() => mockCancelWorkRequest(any())).thenAnswer(
            (_) async => const Left(
              DatabaseFailure(),
            ),
          );
          bloc.add(CancelWorkRequestEvent(
            workRequest: tWorkRequestModel,
            comment: '',
          ));
        },
        expect: () => [
          WorkRequestManagementLoadingState(),
          isA<WorkRequestManagementErrorState>(),
        ],
      );
    });
    group('UpdateWorkRequest', () {
      blocTest<WorkRequestManagementBloc, WorkRequestManagementState>(
        'should emit [WorkRequestManagementSuccessfulStete]',
        build: () => workRequestManagementBloc,
        act: (bloc) async {
          when(() => mockUpdateWorkRequest(any()))
              .thenAnswer((_) async => Right(VoidResult()));
          bloc.add(UpdateWorkRequestEvent(workRequest: tWorkRequestModel));
        },
        expect: () => [
          WorkRequestManagementLoadingState(),
          isA<WorkRequestManagementSuccessState>(),
        ],
      );
      blocTest<WorkRequestManagementBloc, WorkRequestManagementState>(
        'should emit [WorkRequestManagementErrorStete]',
        build: () => workRequestManagementBloc,
        act: (bloc) async {
          when(() => mockUpdateWorkRequest(any())).thenAnswer(
            (_) async => const Left(
              DatabaseFailure(),
            ),
          );
          bloc.add(UpdateWorkRequestEvent(workRequest: tWorkRequestModel));
        },
        expect: () => [
          WorkRequestManagementLoadingState(),
          isA<WorkRequestManagementErrorState>(),
        ],
      );
    });
  });
}
