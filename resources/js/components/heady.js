import f from "../lib/lib";
import signlog from "./Signlog";

export default function Heady(props) {

    let uniq = f.uniqid();

    setTimeout(() => {

        f.r(`#linepref${uniq}`, <section className="flex px-1 pb-1">

            <section className="w-2/6 box-border px-1 font-bold">

                <select onChange={function (e) {

                    f.updatequeryline(f.queryline.word, f.queryline.limit, 0, e.currentTarget.value, f.queryline.sources, f.queryline.authors);

                    console.log(f.queryline, "each select");

                    f.getline(f.queryline);

                }} className="w-full hover:text-white hover:bg-orange-600 cursor-pointer">

                    <option value="">Categories (auto)</option>

                    {f.categoryline.map(function (v, i) {

                        return ((v == null) ? ("") : (((v == f.queryline.categories) ? (

                            <option selected key={i} value={v}>{v}</option>

                        ) : (

                            <option key={i} value={v}>{v}</option>

                        ))));

                    })}

                </select>

            </section>

            <section className="w-2/6 box-border px-1 font-bold">

                <select onChange={function (e) {

                    f.updatequeryline(f.queryline.word, f.queryline.limit, 0, f.queryline.categories, e.currentTarget.value, f.queryline.authors);

                    console.log(f.queryline, "each select");

                    f.getline(f.queryline);

                }} className="w-full hover:text-white hover:bg-orange-600 cursor-pointer">

                    <option value="">Sources (auto)</option>

                    {f.sourceline.map(function (v, i) {

                        return ((v == null) ? ("") : (((v == f.queryline.sources) ? (

                            <option selected key={i} value={v}>{v}</option>

                        ) : (

                            <option key={i} value={v}>{v}</option>

                        ))));

                    })}

                </select>

            </section>

            <section className="w-2/6 box-border px-1 font-bold">

                <select onChange={function (e) {

                    f.updatequeryline(f.queryline.word, f.queryline.limit, 0, f.queryline.categories, f.queryline.sources, e.currentTarget.value);

                    console.log(f.queryline, "each select");

                    f.getline(f.queryline);

                }} className="w-full hover:text-white hover:bg-orange-600 cursor-pointer">

                    <option value="">Authors (auto)</option>

                    {f.authorline.map(function (v, i) {

                        return ((v == null) ? ("") : (((v == f.queryline.authors) ? (

                            <option selected key={i} value={v}>{v}</option>

                        ) : (

                            <option key={i} value={v}>{v}</option>

                        ))));

                    })}

                </select>

            </section>

        </section>);

    }, 2000);

    return (<section key={uniq}>

        <header className="w-full shadow-sm border-b top-0 fixed bg-white">

            {((f.isloggedin() == true) ? (<section className="text-center text-white bg-orange-600 px-1 pt-1">Welcome to NewsViews, <b>{f.logid.user.name} !!!</b></section>) : (""))}

            <section className="flex items-center py-1">

                <section className="px-2">

                    <img className="border rounded-md w-12 h-12" src={f.imglink("img/logo.png")} />

                </section>

                <section className="px-2 flex-1 flex justify-center items-center">

                    <section className="border p-1 flex bg-gray-100 min-w-max w-3/6 h-4/6 rounded-md overflow-hidden">

                        <input className="border-r pr-1 bg-transparent px-2 flex-1 flex" />

                        <button onClick={function (e) {

                            f.updatequeryline(e.currentTarget.previousElementSibling.value, f.queryline.limit, 0, f.queryline.categories, f.queryline.sources, f.queryline.authors);

                            console.log(f.queryline, "each search");

                            f.getline(f.queryline);

                        }} className="text-white bg-orange-600 rounded-full border-l py-1 px-2 justify-center items-center flex">Search</button>

                    </section>

                </section>

                {((f.isloggedin() == true) ? (<section className="px-2 flex justify-center items-center">

                    <button id="logoutbutt" onClick={function () {

                        f.logoutact();

                    }} className="text-white bg-orange-600 rounded-md border px-2 py-1 justify-center items-center flex mr-1">Logout</button>

                </section>) : (<section className="px-2 flex justify-center items-center">

                    <button className="text-white bg-orange-600 rounded-md border px-2 py-1 justify-center items-center flex mr-1" onClick={function (e) {

                        let loginpop = f._("#loginpop");

                        let signuppop = f._("#signuppop");

                        signuppop.classList.remove("hidden");

                        loginpop.classList.add("hidden");

                    }}>Signup</button>

                    <button onClick={function (e) {

                        let loginpop = f._("#loginpop");

                        let signuppop = f._("#signuppop");

                        loginpop.classList.remove("hidden");

                        signuppop.classList.add("hidden");

                    }} className="text-white bg-orange-600 rounded-md border px-2 py-1 justify-center items-center flex">Login</button>

                </section>))}

            </section>

            <section className="flex justify-end h-0">

                <section id="loginpop" className="hidden z-10 relative w-72">

                    <signlog.loginform />

                    <section onClick={function (e) {

                        let loginpop = f._("#loginpop");

                        let signuppop = f._("#signuppop");

                        loginpop.classList.add("hidden");

                        signuppop.classList.add("hidden");

                    }} className="text-white bg-orange-600 p-1 text-center border cursor-pointer rounded-md shadow-md">Hmmm, Forget It? close! </section>

                </section>

                <section id="signuppop" className="hidden z-10 relative w-72">

                    <signlog.signupform />

                    <section onClick={function (e) {

                        let loginpop = f._("#loginpop");

                        let signuppop = f._("#signuppop");

                        loginpop.classList.add("hidden");

                        signuppop.classList.add("hidden");

                    }} className="text-white bg-orange-600 p-1 text-center border cursor-pointer rounded-md shadow-md">Hmmm, Forget It? close! </section>

                </section>

            </section>

            <section id={`linepref${uniq}`}></section>

        </header>

    </section>);

}