import React from 'react';
import { createRoot } from 'react-dom/client';
import HelloReact from '../components/i';

var f = {};

(() => {

    f._all = (s) => (document.querySelectorAll(s));

    f._ = (s) => (f._all(s)[0]);

    f.r = (s, c) => {

        createRoot(f._(s)).render(c);

    };

    console.log(f._('#app'));

    f.r('#app', <HelloReact />);

})();