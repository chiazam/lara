import f from "../lib/lib";

export default function News(props) {

    // <img className="border rounded-md w-12 h-12" src={f.imglink("img/logo.png")} />

    let news = props.news;

    news.imgsrc = ((news.source == "BBC") ? (news.imgsrc.replace("{width}", "999")) : (news.imgsrc));

    console.log(news, "newsliner");

    return (<section key={f.uniqid()}>

        <section className="flex p-1 border-b">

            {(news.imgsrc != null) ? (<section>

                <img className="object-cover border rounded-md w-36 h-36" alt={news.imgalt} src={news.imgsrc} />

            </section>) : ("")}

            <section className="flex-1 ml-2">

                <section className="font-bold text-orange-600 text-lg hover:underline"><a href={news.link}>{news.title}</a></section>

                <section>{news.summary}</section>

                {(news.author != null) ? (<section className="font-bold">Author : {news.author}</section>) : ("")}

                {(news.source != null) ? (<section className="font-bold">Source : {news.source}</section>) : ("")}

                {(news.tagname != null && news.taglink != null) ? (<section className="font-bold">Category : <a className=" text-orange-600 hover:underline" href={news.taglink}>{news.source}, {news.tagname}</a></section>) : ("")}

                {(news.date != null) ? (<section className="font-bold">Release Date : {news.date}</section>) : ("")}

            </section>

        </section>

    </section >);

}