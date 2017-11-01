import naxios from '../libs/naxios';

/**
 * Service Class of Game items
 */
export default class GameService {
  /**
   * fetch games list through Ajax from server
   */
  static fetchGames(category, success, fail) {
    // GameList api のURL
    const url = `/api/game_list/${category}`;

    naxios.get(url)
      .then((res) => {
        console.log(JSON.stringify(res.data));
        success(res);
      })
      .catch((err) => {
        fail(err);
      });
  }

  /**
   * fetch game detail through Ajax from server
   */
  static fetchGameDetail(id, success, fail) {
    // GameList api のURL
    const url = `/api/game_detail/${id}`;

    naxios.get(url)
      .then((res) => {
        console.log(JSON.stringify(res.data));
        success(res);
      })
      .catch((err) => {
        fail(err);
      });
  }
}
