import Heady from "./Heady";
import f from "../lib/lib";

import signlog from "./Signlog";

export default function Index(props) {

    return (<section key={f.uniqid()}>

        <Heady />

        <signlog.loginform />

    </section>);

}