import naxios from '../libs/naxios';

/**
 * Service Class of Game items
 */
export default class GameService {
  /**
   * fetch games list through Ajax from server
   */
  static fetchGames(category, success, fail) {
    naxios.get(`/api/games/search/${category}`)
      .then((res) => { success(res); })
      .catch((err) => { fail(err); });
  }

  /**
   * fetch game detail through Ajax from server
   */
  static fetchGameDetail(id, success, fail) {
    naxios.get(`/api/games/${id}`)
      .then((res) => { success(res); })
      .catch((err) => { fail(err); });
  }

  /**
   * fetch game review through Ajax from server
   */
  static fetchGameReview(id, success, fail) {
    naxios.get(`/api/game_review/${id}`)
      .then((res) => { success(res); })
      .catch((err) => { fail(err); });
  }

  /**
   * create game review through Ajax
   */
  static createGameReview(review, success, fail) {
    // Post a new review of the game.
    naxios.post(`/api/game_review/${review.game_id}`, review)
      .then((res) => {
        // Success on create, and then fetch the game detail.
        return naxios.get(`/api/game_detail/${res.data.game_id}`);
      })
      .then((res) => {
        success(res);
      })
      .catch((err) => {
        fail(err);
      });
  }

  /**
   * update game review through Ajax
   */
  static updateGameReview(review, success, fail) {
    // Patch the updated review of the game.
    naxios.patch(`/api/game_review/${review.game_id}`, review)
      .then((res) => {
        // Success on update, and then fetch the game detail.
        return naxios.get(`/api/game_detail/${res.data.game_id}`);
      })
      .then((res) => {
        success(res);
      })
      .catch((err) => {
        fail(err);
      });
  }
}
