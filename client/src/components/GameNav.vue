<template>
  <div>
    <!-- FAB Buttons when window size is greater than XS -->
    <div class="hidden-sm-and-down text-xs-right g-fab-commands">
      <v-btn
        fab
        dark
        small
        class="blue"
        @click="$emit('onPlay')"
        v-tooltip:bottom="{ html: 'PLAY GAME' }"
      ><v-icon>play_arrow</v-icon></v-btn>
      <v-btn
        fab
        dark
        small
        class="blue"
        @click="$emit('onReview')"
        v-tooltip:bottom="{ html: 'REVIEW GAME' }"
      ><v-icon>star</v-icon></v-btn>
      <v-btn
        fab
        dark
        small
        class="blue"
        @click="$emit('onGoBack')"
        v-tooltip:bottom="{ html: 'BACK' }"
      ><v-icon>apps</v-icon></v-btn>
    </div>

    <!-- Bottm navigation buttons when window size is less equal XS -->
    <v-card height="50px" flat class="hidden-md-and-up">
      <v-bottom-nav :value="true">
        <v-btn flat class="white--text" @click="$emit('onPlay')">
          <span>PLAY GAME</span>
          <v-icon>play_arrow</v-icon>
        </v-btn>
        <v-btn flat class="white--text" @click="$emit('onReview')">
          <span>REVIEW GAME</span>
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
  top: 80px;
  right: 25px;
}
</style>
