import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:under_control_v2/features/company_profile/presentation/blocs/company_profile/company_profile_bloc.dart';
import 'package:under_control_v2/features/core/error/failures.dart';
import 'package:under_control_v2/features/core/usecases/usecase.dart';
import 'package:under_control_v2/features/knowledge_base/data/models/inventory_category/instruction_category_model.dart';
import 'package:under_control_v2/features/knowledge_base/domain/usecases/item_category/add_instruction_category.dart';
import 'package:under_control_v2/features/knowledge_base/domain/usecases/item_category/delete_instruction_category.dart';
import 'package:under_control_v2/features/knowledge_base/domain/usecases/item_category/update_instruction_category.dart';
import 'package:under_control_v2/features/knowledge_base/presentation/blocs/instruction_category_management/instruction_category_management_bloc.dart';

class MockCompanyProfileBloc extends Mock
    implements Stream<CompanyProfileState>, CompanyProfileBloc {}

class MockAddInstructionCategory extends Mock
    implements AddInstructionCategory {}

class MockUpdateInstructionCategory extends Mock
    implements UpdateInstructionCategory {}

class MockDeleteInstructionCategory extends Mock
    implements DeleteInstructionCategory {}

void main() {
  late MockCompanyProfileBloc mockCompanyProfileBloc;

  late MockAddInstructionCategory mockAddInstructionCategory;
  late MockUpdateInstructionCategory mockUpdateInstructionCategory;
  late MockDeleteInstructionCategory mockDeleteInstructionCategory;

  late InstructionCategoryManagementBloc instructionCategoryManagementBloc;

  const companyId = 'companyId';

  InstructionCategoryModel tItemCategoryModel = const InstructionCategoryModel(
    id: 'id',
    name: 'name',
  );

  InstructionCategoryParams tInstructionCategoryParams =
      InstructionCategoryParams(
    instructionCategory: tItemCategoryModel,
    companyId: companyId,
  );

  setUp(
    () {
      mockCompanyProfileBloc = MockCompanyProfileBloc();

      mockAddInstructionCategory = MockAddInstructionCategory();
      mockUpdateInstructionCategory = MockUpdateInstructionCategory();
      mockDeleteInstructionCategory = MockDeleteInstructionCategory();

      when(() => mockCompanyProfileBloc.stream).thenAnswer(
        (_) => Stream.fromFuture(
          Future.value(CompanyProfileEmpty()),
        ),
      );

      instructionCategoryManagementBloc = InstructionCategoryManagementBloc(
        companyProfileBloc: mockCompanyProfileBloc,
        addInstructionCategory: mockAddInstructionCategory,
        updateInstructionCategory: mockUpdateInstructionCategory,
        deleteInstructionCategory: mockDeleteInstructionCategory,
      );
    },
  );

  setUpAll(
    () {
      registerFallbackValue(tInstructionCategoryParams);
    },
  );

  group('InstructionCategory Management BLoC', () {
    test(
      'should emit [InstructionCategoryManagementEmptyState] as an initial state',
      () async {
        // assert
        expect(instructionCategoryManagementBloc.state,
            InstructionCategoryManagementEmptyState());
      },
    );

    group('AddInstructionCategory', () {
      blocTest<InstructionCategoryManagementBloc,
          InstructionCategoryManagementState>(
        'should emit [InstructionCategoryManagementSuccessfulState] when AddInstructionCategory is called',
        build: () => instructionCategoryManagementBloc,
        act: (bloc) async {
          when(() => mockAddInstructionCategory(any()))
              .thenAnswer((_) async => const Right(''));
          bloc.add(AddInstructionCategoryEvent(
              instructionCategory: tItemCategoryModel));
        },
        expect: () => [
          InstructionCategoryManagementLoadingState(),
          isA<InstructionCategoryManagementSuccessState>(),
        ],
      );
      blocTest<InstructionCategoryManagementBloc,
          InstructionCategoryManagementState>(
        'should emit [InstructionCategoryManagementErrorState] when AddInstructionCategory is called',
        build: () => instructionCategoryManagementBloc,
        act: (bloc) async {
          when(() => mockAddInstructionCategory(any()))
              .thenAnswer((_) async => const Left(DatabaseFailure()));
          bloc.add(AddInstructionCategoryEvent(
              instructionCategory: tItemCategoryModel));
        },
        expect: () => [
          InstructionCategoryManagementLoadingState(),
          isA<InstructionCategoryManagementErrorState>(),
        ],
      );
    });

    group('UpdateInstructionCategory', () {
      blocTest<InstructionCategoryManagementBloc,
          InstructionCategoryManagementState>(
        'should emit [InstructionCategoryManagementSuccessfulState] when UpdateInstructionCategory is called',
        build: () => instructionCategoryManagementBloc,
        act: (bloc) async {
          when(() => mockUpdateInstructionCategory(any()))
              .thenAnswer((_) async => Right(VoidResult()));
          bloc.add(UpdateInstructionCategoryEvent(
              instructionCategory: tItemCategoryModel));
        },
        expect: () => [
          InstructionCategoryManagementLoadingState(),
          isA<InstructionCategoryManagementSuccessState>(),
        ],
      );
      blocTest<InstructionCategoryManagementBloc,
          InstructionCategoryManagementState>(
        'should emit [InstructionCategoryManagementErrorState] when UpdateInstructionCategory is called',
        build: () => instructionCategoryManagementBloc,
        act: (bloc) async {
          when(() => mockUpdateInstructionCategory(any()))
              .thenAnswer((_) async => const Left(DatabaseFailure()));
          bloc.add(UpdateInstructionCategoryEvent(
              instructionCategory: tItemCategoryModel));
        },
        expect: () => [
          InstructionCategoryManagementLoadingState(),
          isA<InstructionCategoryManagementErrorState>(),
        ],
      );
    });

    group('DeleteInstructionCategory', () {
      blocTest<InstructionCategoryManagementBloc,
          InstructionCategoryManagementState>(
        'should emit [InstructionCategoryManagementSuccessfulState] when DeleteInstructionCategory is called',
        build: () => instructionCategoryManagementBloc,
        act: (bloc) async {
          when(() => mockDeleteInstructionCategory(any()))
              .thenAnswer((_) async => Right(VoidResult()));
          bloc.add(DeleteInstructionCategoryEvent(
              instructionCategory: tItemCategoryModel));
        },
        expect: () => [
          InstructionCategoryManagementLoadingState(),
          isA<InstructionCategoryManagementSuccessState>(),
        ],
      );
      blocTest<InstructionCategoryManagementBloc,
          InstructionCategoryManagementState>(
        'should emit [InstructionCategoryManagementErrorState] when DeleteInstructionCategory is called',
        build: () => instructionCategoryManagementBloc,
        act: (bloc) async {
          when(() => mockDeleteInstructionCategory(any()))
              .thenAnswer((_) async => const Left(DatabaseFailure()));
          bloc.add(DeleteInstructionCategoryEvent(
              instructionCategory: tItemCategoryModel));
        },
        expect: () => [
          InstructionCategoryManagementLoadingState(),
          isA<InstructionCategoryManagementErrorState>(),
        ],
      );
    });
  });
}
