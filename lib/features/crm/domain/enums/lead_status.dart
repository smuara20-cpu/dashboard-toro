enum LeadStatus {
  draft('DRAFT'),
  newLead('NEW'),
  assigned('ASSIGNED'),
  qualified('QUALIFIED'),
  prospect('PROSPECT'),
  opportunity('OPPORTUNITY'),
  won('WON'),
  lost('LOST'),
  archived('ARCHIVED');

  const LeadStatus(this.value);

  final String value;

  bool canTransitionTo(LeadStatus target) {
    const transitions = <LeadStatus, Set<LeadStatus>>{
      LeadStatus.draft: {LeadStatus.newLead},
      LeadStatus.newLead: {LeadStatus.assigned, LeadStatus.qualified},
      LeadStatus.assigned: {LeadStatus.qualified},
      LeadStatus.qualified: {LeadStatus.prospect},
      LeadStatus.prospect: {LeadStatus.opportunity},
      LeadStatus.opportunity: {LeadStatus.won, LeadStatus.lost},
      LeadStatus.won: {LeadStatus.archived},
      LeadStatus.lost: {LeadStatus.archived},
      LeadStatus.archived: {},
    };

    return transitions[this]?.contains(target) ?? false;
  }
}
