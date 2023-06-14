import f from "../lib/lib";

export default function News(props) {

    // <img className="border rounded-md w-12 h-12" src={f.imglink("img/logo.png")} />

    let news = props.news;

    news.imgsrc = ((news.source == "BBC") ? (news.imgsrc.replace("{width}", "999")) : (news.imgsrc));

    console.log(news, "newsliner");

    return (<section key={f.uniqid()}>



    </section>);

}