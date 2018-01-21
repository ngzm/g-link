import naxios from '../libs/naxios';

/**
 * Service Class for Ranking
 */
export default class RankingService {
  /**
   * fetch game ranking through Ajax from server
   */
  static fetchRanking(fetchSize, success, fail) {
    const size = (fetchSize > 0 && fetchSize <= 100) ? fetchSize : 10;
    naxios.get(`/api/ranking?fsize=${size}`)
      .then((res) => { success(res); })
      .catch((err) => { fail(err); });
  }
}
