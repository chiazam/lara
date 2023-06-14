import Heady from "./Heady";
import f from "../lib/lib";
import Timeline from "./Timeline";

import signlog from "./Signlog";

export default function Index(props) {

    return (<section key={f.uniqid()}>

        <Heady />

        <Timeline />

        {/* <signlog.loginform /> */}

    </section>);

}