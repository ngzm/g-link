<template>
  <section>
    <v-container grid-list-lg>
      <!-- Alerts -->
      <AlertField v-bind:alerts="serverErrors" />

      <v-layout row wrap>
        <v-flex xs12>
          <h5 class="headline">アカウント情報</h5>
        </v-flex>

        <v-flex xs12 v-if="authenticated">
          <v-layout row wrap>
            <v-flex xs12>
              <v-avatar size="98px" class="grey lighten-4">
                <img :src="user.picture" alt="user picture">
              </v-avatar>
            </v-flex>
          </v-layout>

          <v-layout row wrap class="mt-2">
            <v-flex xs3 md2 class="cyan lighten-3 text-xs-right"><h6 class="body-2">ユーザ</h6></v-flex>
            <v-flex xs9 sm8 md6 xl4 class="cyan lighten-4">{{ user.name }}</v-flex>
          </v-layout>

          <v-layout row wrap class="mt-2">
            <v-flex xs3 md2 class="cyan lighten-3 text-xs-right"><h6 class="body-2">氏名</h6></v-flex>
            <v-flex xs9 sm8 md6 xl4 class="cyan lighten-4">{{ user.full_name }}</v-flex>
          </v-layout>

          <v-layout row wrap class="mt-2">
            <v-flex xs3 md2 class="cyan lighten-3 text-xs-right"><h6 class="body-2">email</h6></v-flex>
            <v-flex xs9 sm8 md6 xl4 class="cyan lighten-4">{{ user.email }}</v-flex>
          </v-layout>

          <v-layout row wrap class="mt-2">
            <v-flex xs3 md2 class="cyan lighten-3 text-xs-right"><h6 class="body-2">認証元</h6></v-flex>
            <v-flex xs9 sm8 md6 xl4 class="cyan lighten-4">{{ user.provider }}</v-flex>
          </v-layout>
        </v-flex>

        <v-flex xs12 v-else>
          <v-alert class="warning" icon="warning" value="true">ログインしていません</v-alert>
        </v-flex>

      </v-layout>
    </v-container>
  </section>
</template>

<script>
import { mapState } from 'vuex';
import AlertField from './AlertField.vue';

export default {
  computed: {
    ...mapState('user', [
      'user',
      'authenticated',
    ]),
    ...mapState('errors', [
      'serverErrors',
    ]),
  },

  components: {
    AlertField,
  },
};
</script>

<style>
</style>
