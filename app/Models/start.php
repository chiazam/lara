<?php

namespace App\Models;

use Symfony\Component\BrowserKit\Cookie;
use Symfony\Component\BrowserKit\CookieJar;
use Symfony\Component\BrowserKit\HttpBrowser;
use Symfony\Component\HttpClient\HttpClient;

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

    // https://spetalo.com/?r=wall&w=spetalo_1ddq8b3riu

    public static function scrape(string $url)
    {

        $urlinfo = self::my_parse_url($url);

        $domain =  $urlinfo['host'];

        $jar = new CookieJar();
        $jar->set(new Cookie('_name_session', 'value', null, null, $domain));
        $client = HttpClient::create([
            'timeout' => 900,
            'verify_peer' => false
        ]);
        $browser = new HttpBrowser($client, null, $jar);

        $crawler = $browser->request('GET', $url);

        $allbbcnews = [];

        // $crawler->filter('div')->filter('h1')->each(function ($node) {
        //     dump($node->text());
        // });

        $eachbbcnews = $crawler->filter('div.media.block-link');

        $eachbbcnews->filter('a.block-link__overlay-link')->each(function ($node, $i) use (&$allbbcnews) {

            $allbbcnews[$i] = ['title' => $node->text(), "link" => $node->attr('href')];

            // dump($node->attr('href'));

            // dump($node->text());

            // dump($allbbcnews);
        });

        $eachbbcnews->filter('a.media__tag.tag.tag--news')->each(function ($node, $i) use (&$allbbcnews) {

            $allbbcnews[$i]['country'] = ['name' => $node->text(), "link" => $node->attr('href')];

            // dump($node->attr('href'));

            // dump($node->text());

        });

        $eachbbcnews->filter('p.media__summary')->each(function ($node, $i) use (&$allbbcnews) {

            $allbbcnews[$i]['summary'] = $node->text();

            // dump($node->text());

        });

        $eachbbcnews->filter('img.image-replace')->each(function ($node, $i) use (&$allbbcnews) {

            $allbbcnews[$i]['img'] = $node->attr('src');

            // dump($node->attr('src'));
        });

        dump(json_encode($allbbcnews));
    }
}
