import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/crm/domain/enums/lead_source.dart';
import 'package:dashboard_kpi/features/crm/domain/enums/lead_status.dart';

void main() {
  group('Lead Contract', () {
    test('status vocabulary is complete', () {
      expect(
        LeadStatus.values.map((status) => status.value).toList(),
        equals(<String>[
          'DRAFT',
          'NEW',
          'ASSIGNED',
          'QUALIFIED',
          'PROSPECT',
          'OPPORTUNITY',
          'WON',
          'LOST',
          'ARCHIVED',
        ]),
      );
    });

    test('LeadSource matches existing CRM source contract', () {
      expect(
        LeadSource.values.map((source) => source.name).toList(),
        equals(<String>[
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
      expect(LeadStatus.draft.canTransitionTo(LeadStatus.newLead), isTrue);
    });

    test('NEW can transition to ASSIGNED', () {
      expect(LeadStatus.newLead.canTransitionTo(LeadStatus.assigned), isTrue);
    });

    test('NEW can transition to QUALIFIED', () {
      expect(LeadStatus.newLead.canTransitionTo(LeadStatus.qualified), isTrue);
    });

    test('ASSIGNED can transition to QUALIFIED', () {
      expect(LeadStatus.assigned.canTransitionTo(LeadStatus.qualified), isTrue);
    });

    test('QUALIFIED can transition to PROSPECT', () {
      expect(LeadStatus.qualified.canTransitionTo(LeadStatus.prospect), isTrue);
    });

    test('PROSPECT can transition to OPPORTUNITY', () {
      expect(
        LeadStatus.prospect.canTransitionTo(LeadStatus.opportunity),
        isTrue,
      );
    });

    test('OPPORTUNITY can transition to WON', () {
      expect(LeadStatus.opportunity.canTransitionTo(LeadStatus.won), isTrue);
    });

    test('OPPORTUNITY can transition to LOST', () {
      expect(LeadStatus.opportunity.canTransitionTo(LeadStatus.lost), isTrue);
    });

    test('WON and LOST can transition to ARCHIVED', () {
      expect(LeadStatus.won.canTransitionTo(LeadStatus.archived), isTrue);
      expect(LeadStatus.lost.canTransitionTo(LeadStatus.archived), isTrue);
    });

    test('NEW cannot transition directly to OPPORTUNITY or WON', () {
      expect(
        LeadStatus.newLead.canTransitionTo(LeadStatus.opportunity),
        isFalse,
      );
      expect(LeadStatus.newLead.canTransitionTo(LeadStatus.won), isFalse);
    });

    test('DRAFT cannot transition directly to WON', () {
      expect(LeadStatus.draft.canTransitionTo(LeadStatus.won), isFalse);
    });

    test('QUALIFIED cannot transition directly to WON', () {
      expect(LeadStatus.qualified.canTransitionTo(LeadStatus.won), isFalse);
    });

    test('status cannot transition to itself', () {
      for (final status in LeadStatus.values) {
        expect(status.canTransitionTo(status), isFalse);
      }
    });

    test('ARCHIVED has no outgoing transition', () {
      for (final status in LeadStatus.values) {
        expect(LeadStatus.archived.canTransitionTo(status), isFalse);
      }
    });
  });
}
