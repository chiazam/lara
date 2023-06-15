import f from "../lib/lib";

export default function Heady(props) {

    let uniq = f.uniqid();

    setTimeout(() => {

        f.r(`#linepref${uniq}`, <section className="flex px-1 pb-1">

            <section className="w-2/6 box-border px-1 font-bold">

                <select className="w-full hover:text-white hover:bg-orange-600 cursor-pointer">

                    <option value="">Categories (auto)</option>

                    {f.categoryline.map(function (v, i) {

                        return ((v == null) ? ("") : (((v == f.queryline.categories) ? (

                            <option selected value={v}>{v}</option>

                        ) : (

                            <option value={v}>{v}</option>

                        ))));

                    })}

                </select>

            </section>

            <section className="w-2/6 box-border px-1 font-bold">

                <select className="w-full hover:text-white hover:bg-orange-600 cursor-pointer">

                    <option value="">Sources (auto)</option>

                    {f.sourceline.map(function (v, i) {

                        return ((v == null) ? ("") : (((v == f.queryline.sources) ? (

                            <option selected value={v}>{v}</option>

                        ) : (

                            <option value={v}>{v}</option>

                        ))));

                    })}

                </select>

            </section>

            <section className="w-2/6 box-border px-1 font-bold">

                <select className="w-full hover:text-white hover:bg-orange-600 cursor-pointer">

                    <option value="">Authors (auto)</option>

                    {f.authorline.map(function (v, i) {

                        return ((v == null) ? ("") : (((v == f.queryline.authors) ? (

                            <option selected value={v}>{v}</option>

                        ) : (

                            <option value={v}>{v}</option>

                        ))));

                    })}

                </select>

            </section>

        </section>);

    }, 2000);

    return (<section key={uniq}>

        <header className="w-full shadow-sm border-b top-0 fixed bg-white">

            <section className="flex items-center py-1">

                <section className="px-2">

                    <img className="border rounded-md w-12 h-12" src={f.imglink("img/logo.png")} />

                </section>

                <section className="px-2 flex-1 flex justify-center items-center">

                    <section className="border p-1 flex bg-gray-100 min-w-max w-3/6 h-4/6 rounded-md overflow-hidden">

                        <input className="border-r pr-1 bg-transparent px-2 flex-1 flex" />

                        <button className="border-l pl-1 justify-center items-center flex">Search</button>

                    </section>

                </section>

                <section className="px-2 flex justify-center items-center">

                    <button className="bg-gray-100 rounded-full border px-2 py-1 justify-center items-center flex">Signup/Login</button>

                </section>

            </section>

            <section id={`linepref${uniq}`}></section>

        </header>

    </section>);

}