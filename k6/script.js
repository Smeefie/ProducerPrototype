import http from 'k6/http';
import { sleep } from 'k6';
import { check } from 'k6';

export const options = {
    vus: 10,
    duration: '5s',

};

export default function () {
    let res = http.get('http://4.153.93.107/kafdrop/');
    check(res, {
        "is status 200": (r) => r.status === 200
    });
};