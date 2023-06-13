import f from './lib';
import Start from '../components/start';

(() => {

    f.r('#app', <Start key={f.uniqid()} />);

})();