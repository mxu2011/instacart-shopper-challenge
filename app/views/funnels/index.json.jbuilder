@funnels.each do |funnel|
  json.set! week_range(funnel.week_start) do
    json.(funnel,
      :applied,
      :quiz_started,
      :quiz_completed,
      :onboarding_requested,
      :onboarding_completed,
      :hired,
      :rejected
    )
  end
end
