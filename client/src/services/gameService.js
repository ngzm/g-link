import naxios from '../libs/naxios';

/**
 * Service Class of Game items
 */
export default class GameService {
  /**
   * fetch games through Ajax from server
   */
  static fetchGames(category, success, fail) {
    // GameList api のURL
    const url = `/api/game_list/${category}`;

    naxios.get(url)
      .then((res) => { success(res); })
      .catch((err) => { fail(err); });
  }
}
