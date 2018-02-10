<template>
  <v-card>
    <!-- Access count -->
    <v-card-text>
      <div>
        <h5 class="title">総アクセス数</h5>
        <div class="ml-2">{{ game.access }} 回</div>
      </div>
    </v-card-text>

    <!-- Stars count -->
    <v-card-text>
      <div>
        <h5 class="title">総合評価</h5>
        <div class="ml-2">
          <span>
            <v-icon v-for="n in intStar" :key="n" class="orange--text">star</v-icon>
          </span>
          <span v-if="game.star > 0">({{ formatStar }})</span>
          <span v-else>評価は未だありません</span>
        </div>
      </div>
    </v-card-text>

    <v-card-actions>
      <v-btn block dark class="teal darken-2" @click="$emit('onReview')" >
        評価する
        <v-icon>star</v-icon>
      </v-btn>
    </v-card-actions>

    <!-- User commets -->
    <v-card-text>
      <div>
        <h5 class="title">最新口コミ</h5>
        <div v-if="game.reviews && game.reviews.length > 0">
          <v-expansion-panel expand>
            <v-expansion-panel-content
              v-for="(rv, index) in game.reviews"
              :key="index"
              value="true"
            >
              <div slot="header">
                {{ rv.user }}
                <span>
                  <v-icon v-for="n in rv.star" :key="n" class="yellow--text text--darken-2 star">
                    star
                  </v-icon>
                </span>
              </div>
              <v-card>
                <v-card-text class="grey lighten-3">
                  {{ rv.comment }}
                </v-card-text>
              </v-card>
            </v-expansion-panel-content>
          </v-expansion-panel>
        </div>
        <div class="ml-2" v-else>
          口コミは未だありません
        </div>
      </div>
    </v-card-text>
  </v-card>
</template>

<script>
/**
 * Game Detail Information Component
 */
export default {
  props: {
    game: {
      type: Object,
    },
  },
  computed: {
    intStar: function() {
      return (this.game.star) ? Math.round(this.game.star) : 0;
    },
    formatStar: function() {
      return (this.game.star) ? this.game.star.toFixed(2) : 0.0;
    },
  },
};
</script>

<style>
.star {
  font-size: 75%;
}
</style>
