<?php

namespace App\Models;

// use Symfony\Component\BrowserKit\Cookie;
// use Symfony\Component\BrowserKit\CookieJar;
use Symfony\Component\BrowserKit\HttpBrowser;
use Symfony\Component\HttpClient\HttpClient;
use jcobhams\NewsApi\NewsApi;

// $newsapi = new NewsApi($your_api_key);

class Start
{

    public static function startinfo()
    {

        return ([

            'company' => 'NewsViews',

            'topic' => 'A news viewing platform for readers to follow up events happening around the world.',

            'keywords' => 'news, views, events, follow, readers, world',

        ]);
    }

    public static function my_parse_url(string $url)
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

    public static function checknewsprop(array $eachnews, array $newsprop)
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

    public static function perfectnews(array $news, array $newsprop)
    {

        $allnews = [];




        foreach ($news as $key => $value) {

            if (self::checknewsprop($value, $newsprop) == true) {

                array_push($allnews, $value);
            }
        }

        return $allnews;
    }

    public static function scrapeBBC()
    {

        $url = 'https://www.bbc.com';

        $urlinfo = self::my_parse_url($url);

        $client = HttpClient::create([
            'headers' => [],
            'timeout' => 1000,
            'verify_peer' => false
        ]);
        $browser = new HttpBrowser($client, null);

        $crawler = $browser->request('GET', $url);

        $allnews = [];

        $crawler->filter('a.media__link')->each(function ($node, $i) use (&$allnews) {

            $allnews[$i] = [
                'title' => $node->text(),
                "link" => $node->attr('href')
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
                "link" => $node->attr('href')
            ];
        });

        return [
            'source' => "BBC",
            "url" => $url,
            "urlinfo" => $urlinfo,

            "news" => self::perfectnews($allnews, ['title', 'link', 'img', 'summary', 'tag'])
        ];
    }
}
