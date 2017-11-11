import naxios from '../libs/naxios';

/**
 * Service Class of Game items
 */
export default class GameService {
  /**
   * fetch games list through Ajax from server
   */
  static fetchGames(category, success, fail) {
    const url = `/api/game_list/${category}`;
    naxios.get(url)
      .then((res) => { success(res); })
      .catch((err) => { fail(err); });
  }

  /**
   * fetch game detail through Ajax from server
   */
  static fetchGameDetail(id, success, fail) {
    const url = `/api/game_detail/${id}`;
    naxios.get(url)
      .then((res) => { success(res); })
      .catch((err) => { fail(err); });
  }

  /**
   * fetch game review through Ajax from server
   */
  static fetchGameReview(id, success, fail) {
    const url = `/api/game_review/${id}`;
    naxios.get(url)
      .then((res) => { success(res); })
      .catch((err) => { fail(err); });
  }

  /**
   * create game review through Ajax
   */
  static createGameReview(review, success, fail) {
    const url = `/api/game_review/${review.game_id}`;
    naxios.post(url, review)
      .then((res) => { success(res); })
      .catch((err) => { fail(err); });
  }

  /**
   * update game review through Ajax
   */
  static updateGameReview(review, success, fail) {
    const url = `/api/game_review/${review.game_id}`;
    naxios.patch(url, review)
      .then((res) => { success(res); })
      .catch((err) => { fail(err); });
  }
}
