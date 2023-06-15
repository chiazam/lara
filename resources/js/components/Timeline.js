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

            <section id={`linebox`} className="mt-20 px-2 max-w-3xl bg-white m-auto border"></section>

            <section id={`linenext`} className="my-2 max-w-3xl m-auto"></section>

        </section>

    </section>);

}