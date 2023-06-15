import { createRoot } from 'react-dom/client';
import axios from 'axios';
import News from '../components/News';

let f = {};

f._all = (s) => (document.querySelectorAll(s));

f._ = (s) => (f._all(s)[0]);

f.r = (s, c) => {

    createRoot(f._(s)).render(c);

};

f.LTD = "NewsViews";

f.reload = function () {

    location.reload();

};

f.uniqid = (n = 1) => {

    if (n < 1) {
        throw new Error("n must be greater than 0");
    }

    let s = '';
    for (let i = 0; i < n; i++) {

        s += (Math.random()).toString(36).slice(2);
    }

    return f.LTD + "_" + s;
};

f.DOT = `${window.location.origin}/`;

f.imglink = (pix) => (`${f.DOT}${pix}`);

f.loop = (arrays, clbak) => {

    let info = [];

    for (let q = 0; q < arrays.length; q++) {

        const e = arrays[q];

        info.push(clbak(e, q, arrays));

    }

    return info;

};

f.base64enc = (s => btoa(s));

f.base64dec = (s => atob(s));

f.objloop = (objs, clbak) => {

    let info = [];

    let i = 0;

    for (const k in objs) {

        if (objs.hasOwnProperty(k)) {

            info.push(clbak(k, objs[k], objs, i));

            ++i;
        }

    }

    return info;

};

f.objtourlquery = (obj => {

    let q = ``;

    f.objloop(obj, (k, v, arrays, n) => {

        if (n > 0) {

            q += `&`;

        }

        q += `${k}=${v}`;

    });

    return q;

});

f.instanceof = ((v, t) => v instanceof t);

f.ajax = function (url, func = (function (res) { }), get = {}, meth = "get", post = {}, head = {}) {

    head['Accept'] = "application/json";
    head['content-type'] = "application/json";

    axios({
        url: url + "?" + f.objtourlquery(get),
        data: post,
        method: meth,
        headers: head
    }).then(apiRes => {

        let res = ({
            data: apiRes.data,
            status: apiRes.status,
            statusText: apiRes.statusText,
            next: true
        });

        if (typeof (func) == 'function') {

            func(res);

        }

    }).catch(err => {

        if (err.response || err.request) {

            let res = { next: false };

            if (err.response) {

                res.data = err.response.data;
                res.status = err.response.status;
                res.statusText = err.response.statusText;

            } else if (err.request) {

                res.err_req = err.request;

            }

            if (typeof (func) == 'function') {

                func(res);

            }

        }

    });

}

f.adjhtmlel = (el, pos, htm) => {

    el.insertAdjacentHTML(pos, htm);
};

f.lineword = "";
f.offset = 0;
f.limit = 20;
f.categoryline = {};
f.sourceline = {};
f.authorline = {};
f.queryline = { word: f.lineword, limit: f.limit, offset: f.offset, categories: "", sources: "", authors: "" };

f.randarr = function (arr) {

    const rand = Math.floor(Math.random() * arr.length);

    console.log(arr[rand], "rander");

    return arr[rand];

};

f.getsort = function (sort, getsortfunc) {

    console.log(sort);

    f.ajax(`${f.DOT}api/sortApi`, getsortfunc, {
        sort: sort, limit: f.limit, offset: f.offset
    });

};

f.spinpref = function (updatequery = true) {

    f.getsort("tagname", function (res) {

        f.categoryline = f.loop(res.data, function (e, q, arrays) {

            return (e.tagname);

        });

        if (updatequery == true) {

            f.updatequeryline();

        }

        console.log(f.categoryline, "categoryliner");

    });

    f.getsort("source", function (res) {

        f.sourceline = f.loop(res.data, function (e, q, arrays) {

            return (e.source);

        });

        if (updatequery == true) {

            f.updatequeryline();

        }

        console.log(f.sourceline, "sourecliner");

    });

    f.getsort("author", function (res) {

        f.authorline = f.loop(res.data, function (e, q, arrays) {

            return (e.author);

        });

        if (updatequery == true) {

            f.updatequeryline();

        }

        console.log(f.authorline, "autoliner");

    });
}

f.updatequeryline = function (word = f.lineword, limit = f.limit, offset = f.offset, categories = false, sources = false, authors = false) {

    f.queryline = { limit: limit, offset: offset, word: word };

    f.queryline.categories = ((categories != false) ? (categories) : (f.randarr(f.categoryline)));
    f.queryline.sources = ((sources != false) ? (sources) : (f.randarr(f.sourceline)));
    f.queryline.authors = ((authors != false) ? (authors) : (f.randarr(f.authorline)));

    if (f.hasOwnProperty("logid")) {

        f.logid.user.pref = { categories: f.queryline.categories, sources: f.queryline.sources, authors: f.queryline.authors }

        localStorage.setItem('logid', JSON.stringify(f.logid));

    }

    console.log(f.queryline);

}

f.getline = function (queryline) {

    console.log(queryline, "getliner");

    if (queryline.offset == 0) {

        let allbox = f._("#linebox");

        allbox.innerHTML = "";

        let allnext = f._("#linenext");

        allnext.innerHTML = "";

    }

    f.ajax(`${f.DOT}api/timelineApi`, f.getlinefunc, queryline);

};

f.getlinefunc = function (res) {

    console.log(res, "liner");

    f.bulkdispline(res.data);

    f.dispnextline((res.data.length > 0));

};

f.dispnextline = function (next) {

    console.log(f.queryline, "each liner");

    f.updatequeryline(f.lineword, f.limit, (f.queryline.offset + f.limit), f.queryline.categories, f.queryline.sources, f.queryline.authors);

    let allnext = f._("#linenext");

    let uniq = f.uniqid();

    allnext.innerHTML = "";

    if (next == true) {

        f.adjhtmlel(allnext, "beforeend", `<section id="${uniq}"></section>`);

        setTimeout(function () {

            f.r(`#${uniq}`, <section onClick={() => {

                f.getline(f.queryline);

            }} key={uniq} className="rounded-md text-white bg-orange-600 p-2 text-center font-bold border cursor-pointer"> See More </section>);

        }, 2000);


    }

};

f.bulkdispline = function (data) {

    f.loop(data, function (e, q, arrays) {

        f.displine(e);

    });

};

f.displine = function (data) {

    console.log(data, "each liner");

    let allbox = f._("#linebox");

    let uniq = f.uniqid();

    f.adjhtmlel(allbox, "beforeend", `<section id="${uniq}"></section>`);

    f.box = f._(`#${uniq}`);

    f.r(`#${uniq}`, <News news={data} />);

}

f.signlogact = function (type) {

    let logsignform = {};

    let pointdom = `${type}form`;

    let signloginputs = f._all(`.${pointdom}`);

    let anyempty = false;

    f.loop(signloginputs, function (el) {

        logsignform[el.name] = el.value;

        if (el.value.length == 0) {

            anyempty = true;

        }

    });

    let signlogerr = f._(`#${type}err`);

    if (anyempty == false) {

        let signlogbutt = f._(`#${pointdom}`);

        signlogbutt.innerHTML = "Please a sec..."

        signlogbutt.setAttribute("disabled", true);

        signlogerr.innerHTML = "";

        signlogerr.classList.add("hidden");

        f.signlogtype = type;

        f.ajax(`${f.DOT}api/${type}`, f.signlogactfunc, {}, "POST", logsignform);

    } else {

        signlogerr.innerHTML = "Make sure to fill all fields...";

        signlogerr.classList.remove("hidden");

    }

};

f.signlogactfunc = function (signlogdata) {

    let data = signlogdata.data;

    let type = f.signlogtype;

    let pointdom = `${type}form`;

    let signlogbutt = f._(`#${pointdom}`);

    signlogbutt.innerHTML = (((!data.hasOwnProperty('login')) || (data.login == false)) ? (`Try again,${type}`) : ("Please a sec..."));

    console.log(data);

    if ((!data.hasOwnProperty('login')) || (data.login == false)) {

        signlogbutt.removeAttribute("disabled");

        let signlogerr = f._(`#${type}err`);

        signlogerr.innerHTML = data.message + ((data.hasOwnProperty('errors') && data.errors.hasOwnProperty('email')) ? (`, <b>email</b> : ${data.errors.email[0]}`) : ("")) + ((data.hasOwnProperty('errors') && data.errors.hasOwnProperty('password')) ? (`, <b>password</b> : ${data.errors.password[0]}`) : (""));

        signlogerr.classList.remove("hidden");

    } if (data.login == true) {

        signlogbutt.innerHTML = "Alright!, getting you logged in...";

        console.log(`${data.token_type} ${data.access_token}`);

        let header = { "Authorization": `${data.token_type} ${data.access_token}` };

        localStorage.setItem('authheader', f.base64enc(JSON.stringify(header)));

        f.ajax(`${f.DOT}api/me`, f.loginactfunc, {}, "POST", {}, header);

    }


}

f.loginactfunc = function (logindata) {

    console.log(logindata.data);

    localStorage.setItem('logid', JSON.stringify(logindata.data));

    f.reload();

}

f.loggedincheck = function () {

    if ((localStorage.getItem('logid') != null && f.instanceof(JSON.parse(localStorage.getItem('logid')), Object) == true)) {

        f.logid = JSON.parse(localStorage.getItem('logid'));

        console.log(f.logid, "logger");

        setTimeout(function () {

            f.queryline = { userid: f.logid.user.id, word: "", limit: f.limit, offset: f.offset, categories: f.logid.user.pref.categories, sources: f.logid.user.pref.sources, authors: f.logid.user.pref.authors };

            console.log(f.queryline, "pimpqueryer");

        }, 200);

    }

};

f.loggedincheck();

f.isloggedin = function () {

    return f.hasOwnProperty('logid');

}

console.log((!f.isloggedin()), "damn men");

f.spinpref((!f.isloggedin()));

f.logoutact = function () {

    f._(`#logoutbutt`).innerHTML = "logging out...";

    if (localStorage.getItem('authheader') != null) {

        let authheader = JSON.parse(f.base64dec(localStorage.getItem('authheader')));

        console.log('authheader')

        f.ajax(`${f.DOT}api/logout`, f.logoutactfunc, {}, "POST", {}, authheader);

    } else {

        f.logoutactfunc();

    }

}


f.logoutactfunc = function () {

    localStorage.clear();

    f.reload();

}


export default f;