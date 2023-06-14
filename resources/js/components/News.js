import f from "../lib/lib";

export default function News(props) {

    // <img className="border rounded-md w-12 h-12" src={f.imglink("img/logo.png")} />

    let news = props.news;

    if (news.source == "BBC") {

    }

    return (<section key={f.uniqid()}>

        dfgh

    </section>);

}