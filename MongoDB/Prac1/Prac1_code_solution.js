// basic practice
// make connection, collection, insert json file first before the comments and experiments

use Prac1

db.Tweets_1.find()

db.Tweets_1.find({"user.name":"user 21"})

db.Tweets_1.insert({"nInserted":1})
db.Tweets_1.find({"nInserted":1})

db.Tweets_1.deleteOne({"nInserted":1})
db.Tweets_1.find({"nInserted":1})

db.Tweets_1.insert({"nInserted":1})
db.Tweets_1.update({"nInserted":1},{$set:{"tag":"My number1 tweet"}})
db.Tweets_1.find({"nInserted":1})


use Prac1

//1
db.Tweets.deleteMany({"user.id":2244456599494501})

//Tweet 1
db.Tweets.insert( {
"created_at": "Thu Apr 06 15:24:15 +0000 2020", "id_str": "1850006245121695744",
"text": "Have a nice day",
"user": {
"id": NumberLong(2244456599494503), "name": "user 100",
"screen_name": "Twitter User", "location": "Internet",
"url": "user URL",
"description": "user description" },
"place": {
}, "entities": {
"hashtags": [
],
"urls": [{
"url": "twt url sample", "unwound": {
"url": "url sample",
"title": "web page title" }
}], "user_mentions": [
] }
})


//Tweet 2

db.Tweets.insert( {
"created_at": "Thu Apr 06 15:24:15 +0000 2020", "id_str": "1850006245121695744",
"text": "Good Morning",
"user": {
"id": NumberLong(2244456599494501), "name": "user 101",
"screen_name": "Twitter User", "location": "Internet",
"url": "user URL",
"description": "user description" },
"place": {
}, "entities": {
"hashtags": [
],
"urls": [{
"url": "twt url sample", "unwound": {
"url": "url sample",
"title": "web page title" }
}], "user_mentions": [
] }
})

//2
db.Tweets.find()

//3
db.Tweets.find({"user.name":"user 30"})


//4
db.Tweets.update({"user.name":"user 30"},{$set:{"tag":"my first tag"}})
db.Tweets.update({"user.name":"user 40"},{$set:{"tag":"my second tag"}})

//5
db.Tweets.find({"user.name":{ $in: [ "user 30", "user 40" ] } })

//6
db.Tweets.find({$and: [{"user.screen_name": "Twitter User"}, {"user.location":"Internet"}]})

//7
db.Tweets.find({ $or: [{"user.screen_name": "Twitter User"}, {"user.url":"user URL"}]})

//8
db.Tweets.find({"user.id":{$not:{$eq:224499494502}}})
db.Tweets.find({"user.id":{$ne:224499494502}})