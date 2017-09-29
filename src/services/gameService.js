import naxios from '../libs/naxios';

/**
 * Service Class of Game items
 */
export default class GameService {
  /**
   * fetch games through Ajax from server
   */
  static fetchGames(category, success, fail) {
    // TODO: URLは適当
    const url = `/assets/games/games-${category}.json`;

    naxios.get(url)
      .then((res) => { success(res); })
      .catch((err) => { fail(err); });
  }
}
