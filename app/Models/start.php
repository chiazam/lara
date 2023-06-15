<?php

namespace App\Models;

// use Symfony\Component\BrowserKit\Cookie;
// use Symfony\Component\BrowserKit\CookieJar;

use Illuminate\Http\Request;
use Symfony\Component\BrowserKit\HttpBrowser;
use Symfony\Component\HttpClient\HttpClient;
use jcobhams\NewsApi\NewsApi;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\DB;

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

    static function checkisset(array $list, array $keys)
    {

        $bool = true;

        foreach ($keys as $k => $value) {

            if (!isset($list[$value])) {

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

    static function dateformat(string $date = null, string $format = "Y-m-d")
    {

        return date($format, ($date != null) ? (strtotime($date)) : (strtotime(date($format))));
    }

    static function randfromlist(array $list)
    {

        return $list[array_rand($list)];
    }

    static function listkeyvalue(array $list, string $key)
    {
        $listout = [];

        foreach ($list as $k => $value) {

            if (self::checkisset($value, [$key])) {

                array_push($listout, $value[$key]);
            }
        }

        return $listout;
    }

    static function objtoarr($data)
    {
        if (is_array($data) || is_object($data)) {
            $result = [];
            foreach ($data as $key => $value) {
                $result[$key] = (is_array($value) || is_object($value)) ? self::objtoarr($value) : $value;
            }
            return $result;
        }
        return $data;
    }

    static function perfectBBCnews(string $host, array $news, array $newsprop)
    {

        $allnews = [];

        foreach ($news as $key => $value) {

            if (self::checkisset($value, $newsprop) == true) {

                $value['link'] = self::linkabsolute($host, $value['link']);

                $value['taglink'] = self::linkabsolute($host, $value['taglink']);

                $value['imgsrc'] = self::linkabsolute($host, $value['imgsrc']);

                array_push($allnews, $value);
            }
        }

        return $allnews;
    }

    static function scrapeBBC(bool $save = false)
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
                "sourceid" => "bbc",
                "date" => self::dateformat(),
                "author" => null,
            ];
        });

        $crawler->filter('div.delayed-image-load')->each(function ($node, $i) use (&$allnews) {

            $allnews[$i]['imgsrc'] = $node->attr('data-src');

            $allnews[$i]['imgalt'] = $node->attr('data-alt');
        });

        $crawler->filter('p.media__summary')->each(function ($node, $i) use (&$allnews) {

            $allnews[$i]['summary'] = $node->text();
        });

        $crawler->filter('a.media__tag.tag')->each(function ($node, $i) use (&$allnews) {

            $allnews[$i]['tagname'] = $node->text();

            $allnews[$i]["taglink"] = $node->attr('href');
        });

        $thenews = self::perfectBBCnews($host, $allnews, ['title', 'link', 'imgsrc', 'imgalt', 'summary', 'tagname', 'taglink', 'source', 'sourceid', 'date']);

        if ($save == true) {

            self::BulkSaveToDB('news', $thenews);
        }

        return [
            "urlinfo" => $urlinfo,
            // "news" => $allnews
            "news" => $thenews
        ];
    }

    static function perfectNewsApinews(array $news)
    {

        $allnews = [];

        foreach ($news as $key => $value) {

            array_push($allnews, [

                "title" => $value["title"],
                "link" => $value["url"],
                "imgsrc" => $value["urlToImage"],
                "imgalt" => null,
                "summary" => $value["description"],
                "tagname" => null,
                "taglink" => null,
                "author" => $value["author"],
                "source" => $value["source"]["name"],
                "sourceid" => $value["source"]["id"],
                "date" => self::dateformat($value["publishedAt"])
            ]);
        }

        return $allnews;
    }

    const NewsApiKey = 'fd19822acf9e478b92af0c9608dffa14';

    static function scrapeNewsApi(bool $save = false)
    {

        $newsapi = new NewsApi(self::NewsApiKey);

        $categories = $newsapi->getCategories();

        $curr_category = self::randfromlist($categories);

        $sources = self::objtoarr($newsapi->getSources($curr_category, null, null))['sources'];

        $sources_str =  join(",", self::listkeyvalue($sources, "id"));

        $page_size = 20;

        $page = 1;

        $allnews = self::objtoarr($newsapi->getTopHeadlines("", $sources_str, null, null, $page_size, $page))['articles'];

        $thenews = self::perfectNewsApinews($allnews);

        if ($save == true) {

            self::BulkSaveToDB('news', $thenews);
        }

        return [
            "news" => $thenews,
            "sources" => $sources,
            "categories" => $categories
        ];
    }

    static function perfectGuardianApinews(string $host, array $news)
    {

        $allnews = [];

        foreach ($news as $key => $value) {

            array_push($allnews, [

                "title" => $value["webTitle"],
                "link" => $value["webUrl"],
                "imgsrc" => null,
                "imgalt" => null,
                "summary" => null,
                "tagname" => $value['sectionName'],
                "taglink" => self::linkabsolute($host, $value['sectionId']),
                "author" => null,
                "source" => "Guardian",
                "sourceid" => "guardian",
                "date" => self::dateformat($value["webPublicationDate"])
            ]);
        }

        return $allnews;
    }

    const GuardianApiKey = 'test';

    static function scrapeGuardianApi(bool $save = false)
    {

        $page_size = 20;

        $page = 1;

        $host = "https://content.guardianapis.com/search?page={$page}&page-size={$page_size}&api-key=" . self::GuardianApiKey;

        $urlinfo = self::my_parse_url($host);

        $host2 = "https://www.theguardian.com/";

        $client = new Client();

        $news = $client->request('GET', $host)->getBody()->getContents();

        $allnews = (json_decode($news, true))['response']['results'];

        $thenews = self::perfectGuardianApinews($host2, $allnews);

        if ($save == true) {

            self::BulkSaveToDB('news', $thenews);
        }

        return [
            "urlinfo" => $urlinfo,
            "news" => $thenews
        ];
    }

    static function scrapeAllApi(bool $save = false)
    {

        $bbc = (self::scrapeBBC($save)['news']);

        $newsapi = (self::scrapeNewsApi($save)['news']);

        $guardian = (self::scrapeGuardianApi($save)['news']);

        return [
            'news' => array_merge($bbc, $newsapi, $guardian),
            'sources' => ["BBC", 'Guardian', "NewsApi"]
        ];
    }

    static function timelineApi(array $request)
    {

        if (self::checkisset($request, ['word', 'categories', "sources", "authors"])) {

            if (self::checkisset($request, ['userid'])) {

                $is_pref = self::NumRowsDB("preference", ['userid' => $request['userid']]);

                if ($is_pref == 0) {

                    self::SaveToDB("preference", [
                        'userid' => $request['userid'],
                        'categories' => $request['categories'],
                        'sources' => $request['sources'],
                        'authors' => $request['authors']
                    ]);
                } else {

                    self::UpdateDB("preference", ['userid' => $request['userid']], [
                        'categories' => $request['categories'],
                        'authors' => $request['authors'],
                        'sources' => $request['sources']
                    ]);
                }
            }

            $where = [
                'tagname' => $request['categories'],
                'author' => $request['authors'],
                'source' => $request['sources']
            ];

            $table = DB::table("news");

            if (!empty($request['word'])) {

                $table->orWhere('summary', 'LIKE', '%' .  $request['word'] . '%')->orWhere('title', 'LIKE', '%' .  $request['word'] . '%');
            }

            foreach ($where as $key => $value) {

                if (!empty($request[$key])) {

                    $table->orWhere($key, 'LIKE', '%' . $value . '%');
                }
            }

            return $table->offset($request['offset'])->limit($request['limit'])->orderBy("date", "DESC")->inRandomOrder()->get();
        }

        return [];
    }

    static function sortApi(array $request)
    {

        $table = DB::table("news");

        return $table->select($request['sort'])->offset($request['offset'])->limit($request['limit'])->inRandomOrder()->distinct()->get();

        $table = DB::table("news");
    }

    static function BulkSaveToDB(string $table, array $bulkdata)
    {

        foreach ($bulkdata as $key => $data) {

            self::SaveToDB($table, $data);
        }
    }

    static function SaveToDB(string $table, array $data)
    {

        $numrows = self::NumRowsDB($table, $data);

        if ($numrows == 0) {

            $DBTable = DB::table($table);

            $created_at = ["created_at" => self::dateformat(null, "Y-m-d H:i:s")];

            $main = array_merge($data, $created_at);

            $DBTable->insert($main);
        }
    }

    static function NumRowsDB(string $table, array $info)
    {

        $DBTable = DB::table($table);

        foreach ($info as $key => $value) {

            $DBTable->where($key, '=', $value);
        }

        return $DBTable->count();
    }

    static function BulkUpdateDB(string $table, array $bulkinfodata)
    {

        foreach ($bulkinfodata as $key => $infodata) {

            self::UpdateDB($table, $infodata['info'], $infodata['data']);
        }
    }

    static function UpdateDB(string $table, array $info, array $data)
    {
        $numrows = self::NumRowsDB($table, $info);

        if ($numrows > 0) {

            $DBTable = DB::table($table);

            foreach ($info as $key => $value) {

                $DBTable->where($key, '=', $value);
            }

            $updated_at = ["updated_at" => self::dateformat(null, "Y-m-d H:i:s")];

            $main = array_merge($data, $updated_at);

            return $DBTable->update($main);
        }
    }

    // static function GetDB(string $table, array $select = [], array $where = [], array $orderby = [], $limit = 1, $offset = 0)
    // {

    //     $table = DB::table($table);

    //     foreach ($where as $key => $value) {

    //         $table->orWhere($value['col'], $value['opr'], $value['val']);
    //     }

    //     if (empty($select)) {

    //         $table->select('*');
    //     } else {

    //         $selectadd = 0;

    //         foreach ($select as $key => $value) {

    //             if ($selectadd == 0) {

    //                 $table->select($value);
    //             } else {

    //                 $table->addSelect($value);
    //             }

    //             $selectadd += 1;
    //         }
    //     }

    //     foreach ($orderby as $key => $value) {

    //         $dir = ((self::checkisset($value, ['dir']) == true) ? ($value['dir']) : ('ASC'));

    //         $table->orderby($value['col'], $dir);
    //     }

    //     return $table->offset($offset)->limit($limit)->get();
    // }
}
