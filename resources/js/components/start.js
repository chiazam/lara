import Heady from "./heady";
import f from "../lib/lib";

import signlog from "./signlog";

export default function Start(props) {

    return (<section key={f.uniqid()}>

        <Heady />

        {/* <signlog.loginform /> */}

    </section>);

}