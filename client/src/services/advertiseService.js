import naxios from '../libs/naxios';

/**
 * Service Class for Ranking
 */
export default class AdvertiseService {
  /**
   * Fetch advertise datas through Ajax from server
   */
  static fetchAdvertise(adtype, success, fail) {
    naxios.get(`/api/advertises/search?adtype=${adtype}`)
      .then((res) => { success(res); })
      .catch((err) => { fail(err); });
  }
}
