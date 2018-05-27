import { naxios } from '../libs/naxios';

/**
 * Service Class for Information menu
 */
export default class InforService {
  /**
   * send contact form data through Ajax
   */
  static sendContact(contact, success, fail) {
    success('OK');

    /**
    naxios.post('/api/info/contact', contact)
      .then((res) => { success(res); })
      .catch((err) => { fail(err); });
    */
  }
}
