import f from "../lib/lib";

export default function Heady(props) {

    return (<section key={f.uniqid()}>

        <header className="flex w-full shadow-sm border-b top-0 fixed bg-white py-1">

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

        </header>

    </section>);

}