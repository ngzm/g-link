<template>
  <div>
    <!-- FAB Buttons when window size is greater than XS -->
    <div class="hidden-sm-and-down text-xs-right g-fab-commands">
      <v-tooltip bottom>
        <v-btn
          slot="activator"
          color="blue"
          fab
          dark
          small
          @click="$emit('onGoBack')"
        >
          <v-icon>navigate_before</v-icon>
        </v-btn>
        <span>BACK</span>
      </v-tooltip>
      <v-tooltip bottom>
        <v-btn
          slot="activator"
          color="blue"
          fab
          dark
          small
          @click="$emit('onReview')"
        >
          <v-icon>star</v-icon>
        </v-btn>
        <span>REVIEW GAME</span>
      </v-tooltip>
      <v-tooltip bottom>
        <v-btn
          slot="activator"
          color="blue"
          fab
          dark
          small
          @click="$emit('onPlay')"
        >
          <v-icon>play_arrow</v-icon>
        </v-btn>
        <span>PLAY GAME</span>
      </v-tooltip>
    </div>

    <!-- Bottm navigation buttons when window size is less equal XS -->
    <v-card
      class="hidden-md-and-up"
      height="50px"
      flat
    >
      <v-bottom-navigation
        :value="true"
        color="blue darken-2"
        fixed
      >
        <v-btn
          color="white"
          @click="$emit('onGoBack')"
        >
          <span>Back</span>
          <v-icon>navigate_before</v-icon>
        </v-btn>
        <v-btn
          color="white"
          @click="$emit('onReview')"
        >
          <span>REVIEW GAME</span>
          <v-icon>star</v-icon>
        </v-btn>
        <v-btn
          color="white"
          @click="$emit('onPlay')"
        >
          <span>PLAY GAME</span>
          <v-icon>play_arrow</v-icon>
        </v-btn>
      </v-bottom-navigation>
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
