import request from '../utils/request';
export const fetchData = query => {
    return request({
        url: 'http://127.0.0.1:3007/api/getgoods',
        method: 'get',
        params: query
    });
};

export const editdata = form => {
    return request({
        url: 'http://127.0.0.1:3007/api/editgoods',
        method: 'post',
        data: form
    })
}

export const deleteedit = form => {
    return request({
        url: 'http://127.0.0.1:3007/api/deleteedit',
        method: 'post',
        data: form
    })
}

export const searchedit = form => {
    return request({
        url: 'http://127.0.0.1:3007/api/searchedit',
        method: 'post',
        data: form
    })
}

export const addedit = form => {
    // console.log(form);
    return request({
        url: 'http://127.0.0.1:3007/api/addedit',
        method: 'post',
        data: form
    })
}

export const echartslist = form => {
    // console.log(form);
    return request({
        url: 'http://127.0.0.1:3007/api/echartslist',
        method: 'post',
    })
}

export const fetchUser = query => {
    return request({
        url: 'http://127.0.0.1:3007/api/getUserinfo',
        method: 'get',
        params: query
    });
};

export const searchtel = form => {
    return request({
        url: 'http://127.0.0.1:3007/api/searchtel',
        method: 'post',
        data: form
    });
};

export const deleteeUser = form => {
    return request({
        url: 'http://127.0.0.1:3007/api/deleteeUser',
        method: 'post',
        data: form
    })
}

export const editdataUser = form => {
    return request({
        url: 'http://127.0.0.1:3007/api/editUser',
        method: 'post',
        data: form
    })
}

export const fetchNews = query => {
    return request({
        url: 'http://127.0.0.1:3007/api/getUserNews',
        method: 'get',
        params: query
    });
};

export const deleteeUserNews = form => {
    return request({
        url: 'http://127.0.0.1:3007/api/deleteeUserNews',
        method: 'post',
        data: form
    })
}
