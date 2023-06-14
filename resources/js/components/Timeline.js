import f from "../lib/lib";

export default function Timeline(props) {

    // f.updatequeryline();
    // 
    let uniq = f.uniqid();

    setTimeout(function () {

        f.getline(f.queryline);

    }, 2000);

    return (<section key={uniq}>

        <section className="py-1">

            <section id={`linebox`} className="mt-14 px-2 max-w-3xl bg-white m-auto"></section>

            <section id={`linenext`} className="my-2 px-2 max-w-3x m-auto"></section>

        </section>

    </section>);

}