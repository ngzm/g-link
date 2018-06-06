import naxios from '../libs/naxios';

/**
 * Service Class for Information menu
 */
export default class InforService {
  /**
   * post contact form data through Ajax
   */
  static sendContact(contact, success, fail) {
    naxios.post('/api/contacts/create', contact)
      .then((res) => { success(res); })
      .catch((err) => { fail(err); });
  }

  /**
   * get contact one time token against csrf through Ajax
   */
  static getToken( success, fail) {
    naxios.get('/api/contacts')
      .then((res) => { success(res); })
      .catch((err) => { fail(err); });
  }
}
