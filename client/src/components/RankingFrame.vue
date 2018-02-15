<template>
  <v-layout row wrap>
    <v-flex>
      <h5 class="title">評価順ランキング</h5>
      <RankingList :headers="headers_star" :items="items_star" />
    </v-flex>
    <v-flex>
      <h5 class="title">アクセス数ランキング</h5>
      <RankingList :headers="headers_access" :items="items_access" />
    </v-flex>
    <v-flex xs12>
      <h5 class="title">新着順</h5>
      <RankingList :headers="headers_update" :items="items_update" />
    </v-flex>
  </v-layout>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
import RankingList from './RankingList.vue';

const { mapState } = createNamespacedHelpers('ranking');

export default {
  data() {
    return {
      headers_update: [
        { text: 'No', sortable: false, value: 'no' },
        { text: 'タイトル', align: 'left', sortable: false, value: 'title' },
        { text: '登録日', sortable: false, value: 'created_at' },
      ],
      headers_star: [
        { text: 'No', sortable: false, value: 'no' },
        { text: 'タイトル', align: 'left', sortable: false, value: 'title' },
        { text: '評価', sortable: false, value: 'star' },
      ],
      headers_access: [
        { text: 'No', sortable: false, value: 'no' },
        { text: 'タイトル', align: 'left', sortable: false, value: 'title' },
        { text: 'アクセス数', sortable: false, value: 'access' },
      ],
    };
  },
  computed: {
    items_update: function() {
      return this.updates.map((g) => {
        const dt = new Date(g.created_at);
        const y = dt.getFullYear();
        const m = dt.getMonth() + 1;
        const d = dt.getDate();
        return {
          id: g.id,
          cid: g.category1,
          title: g.title,
          value: `${y}/${m}/${d}`,
        };
      });
    },
    items_star: function() {
      return this.stars.map((g) => {
        return {
          id: g.id,
          cid: g.category1,
          title: g.title,
          value: (g.star) ? g.star.toFixed(2) : '-',
        };
      });
    },
    items_access: function() {
      return this.accesses.map((g) => {
        return {
          id: g.id,
          cid: g.category1,
          title: g.title,
          value: g.access,
        };
      });
    },
    ...mapState( [
      'updates',
      'stars',
      'accesses',
    ]),
  },
  components: {
    RankingList,
  },
};
</script>

<style>
</style>
