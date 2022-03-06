# frozen_string_literal: true

json.array! @internal_linkedin_schedulers, partial: 'internal_linkedin_schedulers/internal_linkedin_scheduler',
                                           as: :internal_linkedin_scheduler
