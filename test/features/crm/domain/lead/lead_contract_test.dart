import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Lead Contract', () {
    const statuses = <String>[
      'DRAFT',
      'NEW',
      'ASSIGNED',
      'QUALIFIED',
      'PROSPECT',
      'OPPORTUNITY',
      'WON',
      'LOST',
      'ARCHIVED',
    ];

    const sources = <String>[
      'whatsapp',
      'instagram',
      'facebook',
      'google',
      'tiktok',
      'website',
      'referral',
      'walkIn',
      'other',
    ];

    const validTransitions = <String, List<String>>{
      'DRAFT': ['NEW'],
      'NEW': ['ASSIGNED', 'QUALIFIED'],
      'ASSIGNED': ['QUALIFIED'],
      'QUALIFIED': ['PROSPECT'],
      'PROSPECT': ['OPPORTUNITY'],
      'OPPORTUNITY': ['WON', 'LOST'],
      'WON': ['ARCHIVED'],
      'LOST': ['ARCHIVED'],
      'ARCHIVED': [],
    };

    bool canTransition(String from, String to) {
      return validTransitions[from]?.contains(to) ?? false;
    }

    test('status vocabulary is complete', () {
      expect(statuses, contains('DRAFT'));
      expect(statuses, contains('NEW'));
      expect(statuses, contains('ASSIGNED'));
      expect(statuses, contains('QUALIFIED'));
      expect(statuses, contains('PROSPECT'));
      expect(statuses, contains('OPPORTUNITY'));
      expect(statuses, contains('WON'));
      expect(statuses, contains('LOST'));
      expect(statuses, contains('ARCHIVED'));
    });

    test('LeadSource vocabulary matches existing CRM source contract', () {
      expect(
        sources,
        containsAll(<String>[
          'whatsapp',
          'instagram',
          'facebook',
          'google',
          'tiktok',
          'website',
          'referral',
          'walkIn',
          'other',
        ]),
      );
    });

    test('DRAFT can transition to NEW', () {
      expect(canTransition('DRAFT', 'NEW'), isTrue);
    });

    test('NEW can transition to ASSIGNED', () {
      expect(canTransition('NEW', 'ASSIGNED'), isTrue);
    });

    test('NEW can transition to QUALIFIED', () {
      expect(canTransition('NEW', 'QUALIFIED'), isTrue);
    });

    test('QUALIFIED can transition to PROSPECT', () {
      expect(canTransition('QUALIFIED', 'PROSPECT'), isTrue);
    });

    test('PROSPECT can transition to OPPORTUNITY', () {
      expect(canTransition('PROSPECT', 'OPPORTUNITY'), isTrue);
    });

    test('OPPORTUNITY can transition to WON', () {
      expect(canTransition('OPPORTUNITY', 'WON'), isTrue);
    });

    test('OPPORTUNITY can transition to LOST', () {
      expect(canTransition('OPPORTUNITY', 'LOST'), isTrue);
    });

    test('NEW cannot transition directly to WON', () {
      expect(canTransition('NEW', 'WON'), isFalse);
    });

    test('NEW cannot transition directly to OPPORTUNITY', () {
      expect(canTransition('NEW', 'OPPORTUNITY'), isFalse);
    });

    test('QUALIFIED cannot transition directly to WON', () {
      expect(canTransition('QUALIFIED', 'WON'), isFalse);
    });

    test('DRAFT cannot transition directly to WON', () {
      expect(canTransition('DRAFT', 'WON'), isFalse);
    });

    test('ARCHIVED has no outgoing transition', () {
      expect(validTransitions['ARCHIVED'], isEmpty);
    });
  });
}
