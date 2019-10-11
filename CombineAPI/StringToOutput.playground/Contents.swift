import UIKit

var jsonString = """
{
"total_count": 1,
"incomplete_results": false,
"items": [
{
"login": "46kuro",
"id": 27127577,
"node_id": "MDQ6VXNlcjI3MTI3NTc3",
"avatar_url": "https://avatars2.githubusercontent.com/u/27127577?v=4",
"gravatar_id": "",
"url": "https://api.github.com/users/46kuro",
"html_url": "https://github.com/46kuro",
"followers_url": "https://api.github.com/users/46kuro/followers",
"following_url": "https://api.github.com/users/46kuro/following{/other_user}",
"gists_url": "https://api.github.com/users/46kuro/gists{/gist_id}",
"starred_url": "https://api.github.com/users/46kuro/starred{/owner}{/repo}",
"subscriptions_url": "https://api.github.com/users/46kuro/subscriptions",
"organizations_url": "https://api.github.com/users/46kuro/orgs",
"repos_url": "https://api.github.com/users/46kuro/repos",
"events_url": "https://api.github.com/users/46kuro/events{/privacy}",
"received_events_url": "https://api.github.com/users/46kuro/received_events",
"type": "User",
"site_admin": false,
"score": 270.87418
}
]
}
// 20191009230706
// https://api.github.com/search/users?q=46kuro
​
{
  "total_count": 1,
  "incomplete_results": false,
  "items": [
    {
      "login": "46kuro",
      "id": 27127577,
      "node_id": "MDQ6VXNlcjI3MTI3NTc3",
      "avatar_url": "https://avatars2.githubusercontent.com/u/27127577?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/46kuro",
      "html_url": "https://github.com/46kuro",
      "followers_url": "https://api.github.com/users/46kuro/followers",
      "following_url": "https://api.github.com/users/46kuro/following{/other_user}",
      "gists_url": "https://api.github.com/users/46kuro/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/46kuro/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/46kuro/subscriptions",
      "organizations_url": "https://api.github.com/users/46kuro/orgs",
      "repos_url": "https://api.github.com/users/46kuro/repos",
      "events_url": "https://api.github.com/users/46kuro/events{/privacy}",
      "received_events_url": "https://api.github.com/users/46kuro/received_events",
      "type": "User",
      "site_admin": false,
      "score": 270.87418
    }
  ]
}
"""

let json = jsonString.data(using: .utf8)
let response = URLResponse()
let output = (data: Data, response: URLResponse)
