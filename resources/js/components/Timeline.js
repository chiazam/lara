import f from "../lib/lib";

export default function Timeline(props) {

    let uniq = f.uniqid();

    setTimeout(function () {

        f.getline(f.queryline);

    }, 2000);

    return (<section key={uniq}>

        <section className="py-1">

            <section id={`linebox`} className={"px-2 max-w-3xl bg-white m-auto border" + ((f.isloggedin() == true) ? (" mt-28") : (" mt-20"))}></section>

            <section id={`linenext`} className="my-2 max-w-3xl m-auto"></section>

        </section>

    </section>);

}