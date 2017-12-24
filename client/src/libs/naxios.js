import Axios from 'axios';
import Authenticate from './authenticate';

/**
 * RailsのCSRF-TOKEN取得
 */
const csrfToken = document.head.querySelector('[name=csrf-token]').content;

/**
 * Axios オブジェクトを生成
 */
const naxios = Axios.create();

/**
 * Intercept these headers to the Axios request
 * - Set ID token to authrization header
 * - Set CSRF-TOKEN to prevent csrf on rails
 */
naxios.interceptors.request.use(
  (config) => {
    config.headers = {
      ...config.headers,
      'X-CSRF-TOKEN': csrfToken,
    };
    if (Authenticate.hasIdToken()) {
      config.headers = {
        ...config.headers,
        Authorization: `Bearer ${Authenticate.getIdToken()}`,
      };
    }
    return config;
  },
  error => Promise.reject(error)
);

/**
 * Intercept on error functions to the Axions response
 * when status is 401 or 403, then going to login page
 */
naxios.interceptors.response.use(
  response => response,
  (error) => {
    if (401 === error.response.status || 403 === error.response.status) {
      Authenticate.clearAllStorage();
      Authenticate.setClientToken();
      window.location.href = Authenticate.getAuthUri();
    } else {
      return Promise.reject(error);
    }
  }
);

export default naxios;

/**
 * 認証 interrupt を行わない Axios オブジェクトを生成
 */
export const naxios_no_auth = Axios.create();

/**
 * Intercept these headers to the Axios request
 * - Set CSRF-TOKEN to prevent csrf on rails
 *
 * This does not interrupt autehticate header
 */
naxios_no_auth.interceptors.request.use(
  (config) => {
    config.headers = {
      ...config.headers,
      'X-CSRF-TOKEN': csrfToken,
    };
    return config;
  },
  error => Promise.reject(error)
);

