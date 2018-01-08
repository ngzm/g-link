import authenticate from '../libs/authenticate';
import { naxios_no_auth } from '../libs/naxios';

/**
 * Service Class of Users
 */
export default class UserService {

  static auth(success, fail) {
    if (authenticate.hasClientToken()) {
      // I have client_token on local storage
      const cToken = authenticate.getClientToken();
      naxios_no_auth.get(`/api/users/auth/exchange?client_token=${cToken}`)
        .then((res) => {
          const idToken = res.data.id_token;
          authenticate.setIdToken(idToken);
          return naxios_no_auth.get(`/api/users/auth?id_token=${idToken}`);
        })
        .then((res) => {
          authenticate.clearClientToken();
          success(res);
        })
        .catch((err) => {
          authenticate.clearAllStorage();
          fail(err);
        });
    } else if (authenticate.hasIdToken()) {
      const idToken = authenticate.getIdToken();
      naxios_no_auth.get(`/api/users/auth?id_token=${idToken}`)
        .then((res) => {
          success(res);
        })
        .catch((err) => {
          authenticate.clearAllStorage();
          fail(err);
        });
    } else {
      // no client_token or id_token on local storage
      // There is no need to authenticate.
      authenticate.clearAllStorage();
      fail({ response: { status: 401, data: {} } });
    }
  }

  static signOut() {
    authenticate.clearAllStorage();
  }
}
