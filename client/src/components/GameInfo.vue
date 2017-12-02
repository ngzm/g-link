<template>
  <v-card>
    <!-- Game title and description -->
    <v-card-title primary-title>
      <div>
        <h4 class="display-2">{{ game.title }}</h4>
        <div class="ml-2">{{ game.description }}</div>
      </div>
    </v-card-title>

    <!-- Game instructions -->
    <v-card-text>
      <div>
        <h5 class="title">Instructions</h5>
        <ul>
          <li v-for="(is, index) in game.instructions" :key="index">
            {{ is.inst }}
          </li>
        </ul>
      </div>
    </v-card-text>

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
        <h5 class="title">評価</h5>
        <div class="ml-2">
          <v-icon v-for="n in game.star" :key="n" class="yellow--text" >
            star
          </v-icon>
        </div>
      </div>
    </v-card-text>

    <!-- User commets -->
    <v-card-text>
      <div>
        <h5 class="title">最新口コミ</h5>

       <v-expansion-panel expand>
          <v-expansion-panel-content v-for="(rv, index) in game.reviews" :key="index">
            <div slot="header">{{ rv.user }}</div>
            <v-card>
              <v-card-text class="grey lighten-3">
                {{ rv.comment }}
              </v-card-text>
            </v-card>
          </v-expansion-panel-content>
        </v-expansion-panel>

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
};
</script>

<style>
</style>
