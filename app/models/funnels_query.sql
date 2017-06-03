SELECT 
	date_trunc('week', shopper_applicants.created_at) AS week_start, 
	COUNT(*) AS applied, 
	SUM(CASE WHEN funnels.name = 'quiz_started' THEN 1 ELSE 0 END) as quiz_started, 
	SUM(CASE WHEN funnels.name = 'quiz_completed' THEN 1 ELSE 0 END) as quiz_completed, 
	SUM(CASE WHEN funnels.name = 'onboarding_requested' THEN 1 ELSE 0 END) as onboarding_requested, 
	SUM(CASE WHEN funnels.name = 'onboarding_completed' THEN 1 ELSE 0 END) as onboarding_completed, 
	SUM(CASE WHEN funnels.name = 'hired' THEN 1 ELSE 0 END) as hired, 
	SUM(CASE WHEN funnels.name = 'rejected' THEN 1 ELSE 0 END) as rejected 
	FROM "shopper_applicants" 
	INNER JOIN "application_steps" 
	ON "application_steps"."shopper_applicant_id" = "shopper_applicants"."id" 
	INNER JOIN "funnels" 
	ON "funnels"."id" = "application_steps"."funnel_id" 
	WHERE (shopper_applicants.created_at > '2014-12-01 00:00:00' 
		AND shopper_applicants.created_at < '2014-12-31 00:00:00') 
		GROUP BY week_start 
		ORDER BY week_start