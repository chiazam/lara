import { createRoot } from 'react-dom/client';
import axios from 'axios';

let f = {};

f._all = (s) => (document.querySelectorAll(s));

f._ = (s) => (f._all(s)[0]);

f.r = (s, c) => {

    createRoot(f._(s)).render(c);

};

f.LTD = "NewsViews";

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

// f.tagline
// f.sourceline
// f.authorline

f.randarr = function (arr) {

    const rand = Math.floor(Math.random() * arr.length);

    return arr[rand];

};

f.offset = 0;

f.limit = 20;

f.getsort = function (sort, getsortfunc) {

    console.log(sort);

    f.ajax(`${f.DOT}api/sortApi`, getsortfunc, {
        sort: sort, limit: f.limit, offset: f.limit
    });

};

f.getsort("tagname", function (res) {

    console.log(res);

});

f.getsort("source", function (res) {

    console.log(res);

});

f.getsort("author", function (res) {

    console.log(res);

});

f.queryline = { limit: 20, offset: 0, sources: "", tagname: "", authors: "", word: "Us" };

f.getline = function (uniq, queryline) {

    console.log(uniq, queryline);

    f.ajax(`${f.DOT}api/timelineApi`, f.getlinefunc, queryline);

};

f.getlinefunc = function (res) {

    console.log(res);

};

export default f;