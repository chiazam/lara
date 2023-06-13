import { createRoot } from 'react-dom/client';

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

export default f;