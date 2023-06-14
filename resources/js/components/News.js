import f from "../lib/lib";

export default function News(props) {

    // <img className="border rounded-md w-12 h-12" src={f.imglink("img/logo.png")} />

    let news = props.news;

    news.imgsrc = ((news.source == "BBC") ? (news.imgsrc.replace("{width}", "999")) : (news.imgsrc));

    console.log(news, "newsliner");

    return (<section key={f.uniqid()}>

        <section classNam="flex items-center p-1 border-b">

            <section>

                <img className="border rounded-md w-20 h-20" alt={news.imgalt} src={news.imgsrc} />

            </section>

            <section className="flex-1 ml-1">

                <section><h3>{news.title}</h3></section>

                <section>{news.summary}</section>

            </section>

        </section>

    </section >);

}