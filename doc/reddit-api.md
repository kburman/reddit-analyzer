# Types of content

- t1	Comment
- t2	Account
- t3	Link
- t4	Message
- t5	Subreddit
- t6	Award
- t8	PromoCampaign

# API Rate limit

30 requests per minute


# API Failure response

```json
// 20200423013332
// https://www.reddit.com/r/TIL.json

{
  "reason": "private",
  "message": "Forbidden",
  "error": 403
}
```

```json
// 20200423015913
// https://www.reddit.com/r/worldnews/top/t3_g5ylvy.json

{
  "message": "Not Found",
  "error": 404
}
```
