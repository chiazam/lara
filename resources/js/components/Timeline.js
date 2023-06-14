import f from "../lib/lib";

export default function Timeline(props) {

    // f.updatequeryline();
    // 
    let uniq = f.uniqid();

    setTimeout(function () {

        f.getline(uniq, f.queryline);

    }, 1);

    return (<section key={uniq}>

        <section className="py-1">

            <section id={`linebox${uniq}`} className="px-2 max-w-3xl bg-white m-auto"></section>

            <section id={`linenext${uniq}`} className="my-2 px-2 max-w-3x m-auto"></section>

        </section>

    </section>);

}