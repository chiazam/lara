<?php

namespace App\Models;

// use Symfony\Component\BrowserKit\Cookie;
// use Symfony\Component\BrowserKit\CookieJar;

use Illuminate\Http\Request;
use Symfony\Component\BrowserKit\HttpBrowser;
use Symfony\Component\HttpClient\HttpClient;
use jcobhams\NewsApi\NewsApi;

class Start
{

    static function startinfo()
    {

        return ([

            'company' => 'NewsViews',

            'topic' => 'A news viewing platform for readers to follow up events happening around the world.',

            'keywords' => 'news, views, events, follow, readers, world',

        ]);
    }

    static function my_parse_url(string $url)
    {

        $urlinfo = parse_url($url);

        if (isset($urlinfo['path'])) {

            $path_arr = explode('/', $urlinfo['path']);

            array_shift($path_arr);

            $urlinfo['path'] =  $path_arr;
        }

        if (isset($urlinfo['query'])) {

            parse_str($urlinfo['query'], $urlinfo['query']);
        }

        return ($urlinfo);
    }

    static function checknewsprop(array $eachnews, array $newsprop)
    {

        $bool = true;

        foreach ($newsprop as $key => $value) {

            if (!isset($eachnews[$value])) {

                $bool = false;

                break;
            }
        }

        return $bool;
    }

    static function isurl(string  $link)
    {

        return filter_var($link, FILTER_VALIDATE_URL);
    }

    static function linkabsolute(string $host, string $link)
    {

        return (self::isurl($link) == true) ? ($link) : ($host . $link);
    }

    static function perfectnews(string $host, array $news, array $newsprop)
    {

        $allnews = [];

        foreach ($news as $key => $value) {

            if (self::checknewsprop($value, $newsprop) == true) {

                $value['link'] = self::linkabsolute($host, $value['link']);

                $value['tag']['link'] = self::linkabsolute($host, $value['tag']['link']);

                $value['img']['src'] = self::linkabsolute($host, $value['img']['src']);

                array_push($allnews, $value);
            }
        }

        return $allnews;
    }

    static function scrapeBBC()
    {

        $host = 'https://www.bbc.com';

        $urlinfo = self::my_parse_url($host);

        $client = HttpClient::create([
            'headers' => [],
            'timeout' => 1000,
            'verify_peer' => false
        ]);
        $browser = new HttpBrowser($client, null);

        $crawler = $browser->request('GET', $host);

        $allnews = [];

        $crawler->filter('a.media__link')->each(function ($node, $i) use (&$allnews) {

            $allnews[$i] = [
                'title' => $node->text(),
                "link" => $node->attr('href'),
                'source' => "BBC",
            ];
        });

        $crawler->filter('div.delayed-image-load')->each(function ($node, $i) use (&$allnews) {

            // if (($i - 1) > 0) {
            $allnews[$i]['img'] = ['src' => $node->attr('data-src'), 'alt' => $node->attr('data-alt')];
            // }
        });

        $crawler->filter('p.media__summary')->each(function ($node, $i) use (&$allnews) {

            $allnews[$i]['summary'] = $node->text();
        });

        $crawler->filter('a.media__tag.tag')->each(function ($node, $i) use (&$allnews) {

            $allnews[$i]['tag'] = [
                'name' => $node->text(),
                "link" => $node->attr('href'),
            ];
        });

        return [
            "urlinfo" => $urlinfo,
            "news" => self::perfectnews($host, $allnews, ['title', 'link', 'img', 'summary', 'tag'])
        ];
    }

    const NewsApiKey = 'fd19822acf9e478b92af0c9608dffa14';

    static function scrapeNewsApi(Request $request)
    {

        $newsapi = new NewsApi(self::NewsApiKey);

        dd($request->has('hh'));

        // return "" . $request->has('hh');
    }
}
