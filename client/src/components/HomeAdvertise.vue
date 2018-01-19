<template>
  <v-layout row wrap>
    <v-flex xs12 md6 lg4 xl2 v-for="ad in advertises" :key="ad.id">
      <v-card class="grey lighten-2" flat>
        <v-card-text>

          <v-container fluid grid-list-sm>
            <v-layout row>
              <v-flex>
                <div>
<a href="http://www.accesstrade.net/at/c.html?rk=01002cpb000ppz" target="_blank"><img src="http://www.accesstrade.net/at/r.html?rk=01002cpb000ppz" alt="" border="0" /></a>
                </div>
              </v-flex>
              <v-flex>
                <p class="atitle">
777タウン.net
                </p>
                <p>
パチンコもパチスロも24時間遊び放題！！稼いだコインで景品をGETできるよ！
                </p>
              </v-flex>
            </v-layout>
          </v-container>

        </v-card-text>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
/**
 * Advertise list on Home Component
 */
export default {
  //
  // TODO: 本来はDBから読み込むデータ
  data() {
    return {
      advertises: [
        { id: 1, title: '進撃の巨人', img: 'sss/bbb/ccc/.png' },
        { id: 2, title: 'マンハッタン島', img: 'sss/bbb/ccc/.png' },
        { id: 3, title: 'ファアリーテイル', img: 'sss/bbb/ccc/.png' },
        { id: 4, title: 'Monster Hunter', img: 'sss/bbb/ccc/.png' },
        { id: 5, title: 'マリオブラザース', img: 'sss/bbb/ccc/.png' },
        { id: 6, title: 'Packman', img: 'sss/bbb/ccc/.png' },
      ],
    };
  },
};
</script>

<style>
.atitle {
  color: #666666;
  font-weight: bold;
  padding: 0;
  margin: 0 0 8px 0;
}
</style>
