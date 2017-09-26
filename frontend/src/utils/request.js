import 'whatwg-fetch';

export default async (
  method,
  path,
  query = {},
  body = {},
  headers = {},
) => {
  // necessary method & path
  if (!method && !path) throw new Error('necessary method & path');
  // build options of fetch
  const options = (() => {
    const opt = {
      method,
      headers,
    };
    // if has body, insert body to opt
    if (Object.keys(body).length !== 0) {
      Object.assign(opt, {
        body: JSON.stringify(body),
      });
    }
    return opt;
  })();
  // build queryString of fetch
  const queryString = (() => {
    let queryStr = '';
    if (Object.keys(query).length !== 0) {
      Object.keys(query).forEach((key) => {
        if ({}.hasOwnProperty.call(query, key)) {
          const value = query[key];
          if (key === Object.keys(query)[0]) {
            queryStr += `?${key}=${value}`;
          } else {
            queryStr += `&${key}=${value}`;
          }
        }
      });
    }
    return queryStr;
  })();
  // let's fetch
  try {
    const res = await fetch(`${window.$config.HOST}${path}${queryString}`, options);
    const data = await res.json();
    if (res.status === 401 && !window.location.href.endsWith('/login')) {
      return setTimeout(() => { window.location.href = '/login'; }, 1000);
    }
    if (res.status >= 400) {
      // alert(data.msg);
      return Object.assign({}, { ok: false, status: res.status }, data);
    }
    return Object.assign({}, { ok: true }, data);
  } catch (err) {
    return { ok: false, msg: err };
  }
};
