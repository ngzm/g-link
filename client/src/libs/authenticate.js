import rsasign from 'jsrsasign';
import WebStorage from '../libs/webstorage';

/**
 * URL of the authentication service
 */
const AUTHENTICATE_URL = '/rp/google/create';

/**
 * Define CLIENT TOKEN data
 */
const myRandom = (min, max) => Math.floor( Math.random() * (max - min + 1) ) + min;
const CLIENT_NAME = 'game_link_client_application';
const CLIENT_TOKEN = (() => {
  const now = rsasign.jws.IntDate.get('now').toString();
  const rnd = myRandom(100, 999).toString();
  return rsasign.crypto.Util.sha256(`${CLIENT_NAME}-${now}-${rnd}`);
})();

/**
 * Functions for ths authentication
 */
export default {
  // id token storage
  hasIdToken: () => !!(WebStorage.idToken.get()),
  getIdToken: () => WebStorage.idToken.get(),
  setIdToken: (idToken) => { WebStorage.idToken.set(idToken); },
  clearIdToken: () => { WebStorage.idToken.remove(); },

  // client token storage
  hasClientToken: () => !!(WebStorage.clientToken.get()),
  getClientToken: () => WebStorage.clientToken.get(),
  setClientToken: () => { WebStorage.clientToken.set(CLIENT_TOKEN); },
  clearClientToken: () => { WebStorage.clientToken.remove(); },

  // claer all storage
  clearAllStorage: () => {
    WebStorage.idToken.remove();
    WebStorage.clientToken.remove();
  },

  // get authentication uri on server
  getAuthUri: () => {
    const ctoken = `client_token=${CLIENT_TOKEN}`;
    const redirect = `redirect_uri=${window.location.href}`;
    return encodeURI(`${AUTHENTICATE_URL}?${ctoken}&${redirect}`);
  },
};
