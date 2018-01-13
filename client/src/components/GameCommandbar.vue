<template>
  <div>
    <!-- FAB Buttons when window size is greater than XS -->
    <div class="hidden-xs-only text-xs-right g-fab-commands">
      <v-btn
        icon
        fab
        dark
        class="pink"
        @click="$emit('onReview')"
        v-tooltip:bottom="{ html: 'プレイする' }"
      ><v-icon>play_arrow</v-icon></v-btn>
      <v-btn
        icon
        fab
        dark
        class="orange"
        @click="$emit('onReview')"
        v-tooltip:bottom="{ html: '評価する' }"
      ><v-icon>star</v-icon></v-btn>
      <v-btn
        icon
        fab
        dark
        class="blue"
        @click="$emit('onGoBack')"
        v-tooltip:bottom="{ html: '一覧に戻る' }"
      ><v-icon>apps</v-icon></v-btn>
    </div>

    <!-- Bottm navigation buttons when window size is less equal XS -->
    <v-card height="50px" flat class="hidden-sm-and-up">
      <v-bottom-nav :value="true">
        <v-btn flat class="white--text" @click="$emit('onReview')">
          <span>Play game</span>
          <v-icon>play_arrow</v-icon>
        </v-btn>
        <v-btn flat class="white--text" @click="$emit('onReview')">
          <span>Review game</span>
          <v-icon>star</v-icon>
        </v-btn>
        <v-btn flat class="white--text" @click="$emit('onGoBack')">
          <span>Back</span>
          <v-icon>apps</v-icon>
        </v-btn>
      </v-bottom-nav>
    </v-card>
  </div>
</template>

<script>
</script>

<style>
.g-fab-commands {
  position: fixed;
  top: 74px;
  right: 4px;
  float: left;
}
</style>
