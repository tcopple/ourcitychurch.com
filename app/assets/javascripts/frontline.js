var twitter_handle = 'our_citychurch';
var tweets = 10;
var tweet = 1;

$(document).ready(function() {
  $('.scripture').scriptureLink();
  fetch_tweets(twitter_handle, tweets, tweet);
  fetch_blog();
});

function fetch_blog() {
  $.jGFeed('http://feeds.feedburner.com/agenerationtransformed',
    function(feeds){
      if(!feeds) {
        return false;
      }

      $.each(feeds.entries, function(i, post) {
        var dte = new Date(post.publishedDate);
        var blog_post = $("<div class='blog'></div>");
        var date_header = $("<div class='date gray'>" + $.datepicker.formatDate("d MM yy", dte) + "</div>");
        var title = $("<div class='blog_title'> <a href='" + post.link + "'>"+ post.title + "</a></div>");

        blog_post.append(date_header);
        blog_post.append(title);

        blog_post.appendTo("ul#blogs")
      });
    }, 3);
}

function fetch_tweets(handle, count, page) {
  if(page == undefined)
    page = 1;

  var url ="https://api.twitter.com/statuses/user_timeline.json?include_entities=true&include_rts=true&exclude_replies=true&screen_name=" + handle + "&count=" + count + "&callback=?";

  var ret = new Array();
  $.getJSON(url,function(data) {
    var post = data.shift();
    var tweet = $("<div class='tweet'></div>");

    var user = post.user.screen_name.toLowerCase();
    var created = new Date(post.created_at);
    var date_header = $("<div class='date gray'>" + $.datepicker.formatDate("d MM yy", created) + "</div>");
    var tweet_text = $("<p>" + replace_urls(post.text) + "</p>");

    tweet.append(date_header);
    tweet.append(tweet_text);

    tweet.appendTo($("#tweets"));
  });
}

function replace_urls(text) {
  var exp = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig;
  var a = text.replace(exp,"<a href='$1'>$1</a>");
  return a;
}
