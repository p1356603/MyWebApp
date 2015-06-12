<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getWeather.aspx.cs" Inherits="Assignment.getWeather" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
    <div>
    <h1><a href="Home.aspx">Alex Lim's E-Learning Activities</a></h1>
    <a href="bongTranslator.aspx">Translator</a> | 
    <a href="ServerTime.html">Server Time</a> | 
    <a href="getWeather.aspx">Weather</a>
    </div><hr />

    <form id="form1">
        <div>
            <input type="submit" id="btnLocalWeatherFree" value="Get Local Weather - Free API" />
            <br />
            <br />
            <input type="submit" id="btnLocationSearchFree" value="Search Location - Free API" />
            <br />
            <br />
            <input type="submit" id="btnTimeZoneFree" value="Get Time Zone - Free API" />
            <br />
            <br />
            <input type="submit" id="btnMarineWeatherFree" value="Get Marine Weather - Free API" />
            <br />
            <br />
            <div id="resultContainer">
            </div>
        </div>
    </form>
</body>
</html>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

<script type="text/javascript">

    var resultContainer = $('#resultContainer');
    var output = '';

    $(document).ready(function () {

        $('#btnLocalWeatherFree').click(GetLocalWeather);
        $('#btnLocationSearchFree').click(SearchLocation);
        $('#btnTimeZoneFree').click(GetTimeZone);
        $('#btnMarineWeatherFree').click(GetMarineWeather);

    });

    //------------ LOCAL WEATHER ----------------

    function GetLocalWeather(e) {

        var localWeatherInput = {
            query: 'singapore',
            format: 'JSON',
            num_of_days: '2',
            date: '',
            fx: '',
            cc: '',
            includelocation: '',
            show_comments: '',
            callback: 'LocalWeatherCallback'
        };

        JSONP_LocalWeather(localWeatherInput);
        e.preventDefault();
    }

    //------------ SEARCH LOCATION ----------------

    function SearchLocation(e) {

        var locationInput = {
            query: 'london',
            format: 'JSON',
            num_of_results: '3',
            callback: 'SearchLocationCallback'
        };

        JSONP_SearchLocation(locationInput);
        e.preventDefault();
    }

    //------------ TIME ZONE ----------------

    function GetTimeZone(e) {

        var tzInput = {
            query: '94704',
            format: 'JSON',
            callback: 'searchTimeZone'
        };

        JSONP_TimeZone(tzInput);
        e.preventDefault();
    }

    //---------------Localweather------------
    function JSONP_LocalWeather(input) {
        var _FreeApiBaseURL = 'http://api.worldweatheronline.com/free/v2/';
        /*
            Please change the FreeAPIKey to your own. 
            These keys have been provided for testing only.
            If you don't have one, then register now: http://developer.worldweatheronline.com/member/register    
        */
        var _FreeApiKey = '5918ff9f2e638fc452e003193bee4';
        var url = _FreeApiBaseURL + 'weather.ashx?query=' + input.query + '&format=' + input.format + '&extra=' + input.extra + '&num_of_days=' + input.num_of_days + '&date=' + input.date + '&fx=' + input.fx + '&cc=' + input.cc + '&includelocation=' + input.includelocation + '&show_comments=' + input.show_comments + '&key=' + _FreeApiKey;
        http://api.worldweatheronline.com/free/v2/weather.ashx?q=singapore&format=JSON&num_of_days=2&key=5918ff9f2e638fc452e003193bee4
        jsonP(url, input.callback);
    }

    //---------------------Searchlocation-----------
    function JSONP_SearchLocation(input) {
        var _FreeApiBaseURL = 'http://api.worldweatheronline.com/free/v2/';
        var _FreeApiKey = '5918ff9f2e638fc452e003193bee4';
        var url = _FreeApiBaseURL + 'search.ashx?query=' + input.query + '&num_of_results=' + input.num_of_results + '&format=' + input.format + '&key=' + _FreeApiKey;
        http://api.worldweatheronline.com/free/v2/search.ashx?query=london&num_of_results=3&format=JSON&key=5918ff9f2e638fc452e003193bee4
        jsonP(url, input.callback);
    }

    //---------------------TimeZone-----------
    function JSONP_TimeZone(input) {
        var _FreeApiBaseURL = 'http://api.worldweatheronline.com/free/v2/';
        var _FreeApiKey = '5918ff9f2e638fc452e003193bee4';
        var url = _FreeApiBaseURL + 'tz.ashx?query=' + input.query + '&format=' + input.format + '&key=' + _FreeApiKey;
        http://api.worldweatheronline.com/free/v2/tz.ashx?query=94704&format=JSON&key=5918ff9f2e638fc452e003193bee4
            jsonP(url, input.callback);
    }

    function LocalWeatherCallback(localWeather) {

        output = "<br/> Cloud Cover: " + localWeather.data.current_condition[0].cloudcover;
        output += "<br/> Humidity: " + localWeather.data.current_condition[0].humidity;
        output += "<br/> Temp C: " + localWeather.data.current_condition[0].temp_C;
        output += "<br/> Visibility: " + localWeather.data.current_condition[0].weatherDesc[0].value;
        output += "<br/> Observation Time: " + localWeather.data.current_condition[0].observation_time;
        output += "<br/> Pressue: " + localWeather.data.current_condition[0].pressure;

        resultContainer.empty();
        resultContainer.html(output);
    }

    function SearchLocationCallback(locationInput) {

        output = "<br/> Area Name: " + locationInput.search_api.result[0].areaName[0].value;
        output += "<br/><br/> Country: " + locationInput.search_api.result[0].country[0].value;
        output += "<br/> Region: " + locationInput.search_api.result[0].region[0].value;
        output += "<br/> Weather Url: <a href=\"" + locationInput.search_api.result[0].weatherUrl[0].value + "\">" + locationInput.search_api.result[0].weatherUrl[0].value + "</a>";

        output += "<br/><br/> Country: " + locationInput.search_api.result[1].country[0].value;
        output += "<br/> Region: " + locationInput.search_api.result[1].region[0].value;
        output += "<br/> Weather Url: <a href=\"" + locationInput.search_api.result[1].weatherUrl[0].value + "\">" + locationInput.search_api.result[1].weatherUrl[0].value + "</a>";

        output += "<br/><br/> Country: " + locationInput.search_api.result[2].country[0].value;
        output += "<br/> Region: " + locationInput.search_api.result[2].region[0].value;
        output += "<br/> Weather Url: <a href=\"" + locationInput.search_api.result[2].weatherUrl[0].value + "\">" + locationInput.search_api.result[2].weatherUrl[0].value + "</a>";

        resultContainer.empty();
        resultContainer.html(output);
    }

    function searchTimeZone(tzInput) {

        output = "<br/> Zip code: " + tzInput.data.request[0].query;
        output += "<br/> Time zone (UTC): " + tzInput.data.time_zone[0].utcOffset;
        output += "<br/> Local Time: " + tzInput.data.time_zone[0].localtime;

        resultContainer.empty();
        resultContainer.html(output);
    }

    // Helper Method
    function jsonP(url, callback) {
        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json",
            jsonpCallback: callback,
            dataType: 'jsonp',
            success: function (json) {
                console.dir('success');
            },
            error: function (e) {
                console.log(e.message);
            }
        });
    }
    //-------------------------------------------

</script>
