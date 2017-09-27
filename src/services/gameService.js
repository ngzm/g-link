import naxios from '../libs/naxios';

/**
 * Game categories, especially used by ui-menu list
 */
export const gamesCategories = [
  { id: 1, title: 'Action', route: 'action', icon: 'home' },
  { id: 2, title: 'Adventure', route: 'adventure', icon: 'history' },
  { id: 3, title: 'Racing', route: 'racing', icon: 'featured_play_list' },
  { id: 4, title: 'Shooting', route: 'shooting', icon: 'trending_up' },
  { id: 5, title: 'Battle', route: 'battle', icon: 'home' },
  { id: 6, title: 'Sports', route: 'sports', icon: 'history' },
  { id: 7, title: 'Fancy', route: 'fancy', icon: 'featured_play_list' },
  { id: 8, title: 'Puzzle', route: 'puzzle', icon: 'trending_up' },
  { id: 9, title: 'Jewels', route: 'jewels', icon: 'home' },
  { id: 10, title: 'Brain', route: 'brain', icon: 'history' },
  { id: 11, title: 'Table', route: 'table', icon: 'trending_up' },
  { id: 12, title: 'Variety', route: 'variety', icon: 'featured_play_list' },
];

/**
 * Service Class of Game items
 */
export class GameService {
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

  /**
   * compare by stars function for gamelist sorter
   */
  static compStar(a, b) {
    return (a.star === b.star) ? 0 : ((a.star < b.star) ? 1 : -1);
  }

  /**
   * compare by access counts function for gamelist sorter
   */
  static compAccess(a, b) {
    return (a.access === b.access) ? 0 : ((a.access < b.access) ? 1 : -1);
  }
}
