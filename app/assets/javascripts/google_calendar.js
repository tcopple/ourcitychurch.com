
$(document).ready( function() {
  loadCalendar('https://www.google.com/calendar/feeds/frontlinecitychurch@gmail.com/public/full');
});

/* Loads the Google data JavaScript client library */
google.load("gdata", "2.x");

function init() {
  // init the Google data JS client library with an error handler
  google.gdata.client.init(handleGDError);
}

/**
 * Adds a leading zero to a single-digit number.  Used for displaying dates.
 */
function padNumber(num) {
  if (num <= 9) {
    return "0" + num;
  }
  return num;
}

/**
 * Determines the full calendarUrl based upon the calendarAddress
 * argument and calls loadCalendar with the calendarUrl value.
 *
 * @param {string} calendarAddress is the email-style address for the calendar
 */
function loadCalendarByAddress(calendarAddress) {
  var calendarUrl = 'https://www.google.com/calendar/feeds/' +
                    calendarAddress +
                    '/public/full';
  loadCalendar(calendarUrl);
}

/**
 * Uses Google data JS client library to retrieve a calendar feed from the specified
 * URL.  The feed is controlled by several query parameters and a callback
 * function is called to process the feed results.
 *
 * @param {string} calendarUrl is the URL for a public calendar feed
 */
function loadCalendar(calendarUrl) {
  var service = new
      google.gdata.calendar.CalendarService('gdata-js-client-samples-simple');
  var query = new google.gdata.calendar.CalendarEventQuery(calendarUrl);
  query.setOrderBy('starttime');
  query.setSortOrder('ascending');
  query.setFutureEvents(true);
  query.setSingleEvents(true);
  query.setMaxResults(50);

  service.getEventsFeed(query, listEvents, handleGDError);
}

/**
 * Callback function for the Google data JS client library to call when an error
 * occurs during the retrieval of the feed.  Details available depend partly
 * on the web browser, but this shows a few basic examples. In the case of
 * a privileged environment using ClientLogin authentication, there may also
 * be an e.type attribute in some cases.
 *
 * @param {Error} e is an instance of an Error
 */
function handleGDError(e) {
  document.getElementById('jsSourceFinal').setAttribute('style',
      'display:none');
  if (e instanceof Error) {
    /* alert with the error line number, file and message */
    alert('Error at line ' + e.lineNumber +
          ' in ' + e.fileName + '\n' +
          'Message: ' + e.message);
    /* if available, output HTTP error code and status text */
    if (e.cause) {
      var status = e.cause.status;
      var statusText = e.cause.statusText;
      alert('Root cause: HTTP error ' + status + ' with status text of: ' +
            statusText);
    }
  } else {
    alert(e.toString());
  }
}

/**
 * Callback function for the Google data JS client library to call with a feed
 * of events retrieved.
 *
 * Creates an unordered list of events in a human-readable form.  This list of
 * events is added into a div called 'events'.  The title for the calendar is
 * placed in a div called 'calendarTitle'
 *
 * @param {json} feedRoot is the root of the feed, containing all entries
 */

function listEvents(feedRoot) {
  var entries = feedRoot.feed.getEntries();

  var listed = 0;
  for(var i = 0; i < entries.length && listed < 4; i++) {
    var t = entries[i].getTitle().getText();

    if(t.indexOf("Community Group") != -1) {
      continue;
    }

    var calendar_event = $("<div class='event'></div>");

    var times = entries[i].getTimes();
    var dte = times[0].getStartTime().getDate();
    var date_header = null;
    if (!times[0].getStartTime().isDateOnly()) {
      var time = " @" + dte.getHours() + ":" + padNumber(dte.getMinutes());
      date_header = $("<div class='date gray'>" + $.datepicker.formatDate("d MM yy", dte) + time + "</div>" );
    } else {
      date_header = $("<div class='date gray'>" + $.datepicker.formatDate("d MM yy", dte) + "</div>" );
    }

    var event_text = $("<div class='event_title'> <a href='" + entries[i].getHtmlLink().getHref() + "'>" + entries[i].getTitle().getText() + "</a></div>");

    calendar_event.append(date_header);
    calendar_event.append(event_text);

    calendar_event.appendTo($("#events"));
    listed += 1
  };
}

google.setOnLoadCallback(init);
