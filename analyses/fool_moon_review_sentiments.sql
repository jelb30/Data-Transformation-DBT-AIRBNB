WITH full_moon_reviews AS{
    SELECT * FROM {{ ref('full_moon_reviews') }}
}
SELECT 
    is_full_moon,
    review_sentiment,
    COUNT(*) AS reviews 
FROM 
    full_moon_reviews
GROUP BY
    is_full_moon,
    review_sentiment
ORDER BY
    is_full_moon,
    review_sentiment
