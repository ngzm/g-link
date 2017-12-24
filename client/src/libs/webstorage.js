const ID_TOKEN_STORAGE_KEY     = 'game_link_id_token';
const CLIENT_TOKEN_STORAGE_KEY = 'game_link_client_token';

export default {
  idToken: {
    get: () => localStorage.getItem(ID_TOKEN_STORAGE_KEY),
    set: (token) => { localStorage.setItem(ID_TOKEN_STORAGE_KEY, token); },
    remove: () => { localStorage.removeItem(ID_TOKEN_STORAGE_KEY); },
  },
  clientToken: {
    get: () => localStorage.getItem(CLIENT_TOKEN_STORAGE_KEY),
    set: (token) => { localStorage.setItem(CLIENT_TOKEN_STORAGE_KEY, token); },
    remove: () => { localStorage.removeItem(CLIENT_TOKEN_STORAGE_KEY); },
  },
};
