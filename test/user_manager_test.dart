

import 'package:flutter_test/flutter_test.dart';

import 'package:test_application/303/generic_learn.dart';

void main() {
  setUp(() => {});

  test(
      'User calculate',
      () => () {
            final users = [
              GenericUser('mert', '10', 10),
              GenericUser('mehmet', '11', 127),
              GenericUser('ahmet', '12', 113),
            ];

           final result = UserManagement(AdminUser('madmin', '1', 15, 1)).calculateMoney(users);
          expect(result, 265);
          });
}
