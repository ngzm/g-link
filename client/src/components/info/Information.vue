<template>
  <section>
    <!-- Alerts -->
    <AlertField :alerts="serverErrors" />

    <v-container grid-list-xl>
      <v-layout
        class="mt-2"
        row
        wrap
      >
        <v-flex xs12>
          <h5 class="title grey white--text pa-2">サイト情報</h5>
          <ul class="mt-3 ml-4">
            <li>当サイトは、フリーオンラインゲームへのリンクサイトです</li>
            <li>全てのゲームは無料でプレイできますので、思う存分楽しんでください</li>
          </ul>
        </v-flex>
      </v-layout>
      <v-layout
        class="mt-2"
        row
        wrap
      >
        <v-flex xs12>
          <h5 class="title grey white--text pa-2">注意事項</h5>
          <ul class="mt-3 ml-4">
            <li>当サイトで紹介するゲームの著作権は全て制作者にあります</li>
            <li>当サイトで使用する画像や音源など素材の著作権は全て制作者にあります</li>
            <li>当サイトで使用する画像・音源・スクリプトなどの素材の転載は禁止いたします</li>
            <li>当サイトのリンク先について、当サイトは一切責任を負いません</li>
            <li>紹介しているソフトウェアや情報を使用したことによる不利益・被害・損失等に関して、 当サイトはその一切の責任を負いません。自己責任でお願いします</li>
          </ul>
        </v-flex>
      </v-layout>

      <v-layout
        class="mt-2"
        row
      >
        <v-flex xs12>
          <h5 class="title grey white--text pa-2">サイト管理人</h5>
          <ul class="mt-3 ml-4">
            <li>French Connection 管理人 Zumin</li>
          </ul>
        </v-flex>
      </v-layout>
    </v-container>
  </section>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
import AlertField from '../util/AlertField.vue';
const { mapState } = createNamespacedHelpers('errors');

export default {
  components: {
    AlertField,
  },
  computed: {
    ...mapState([
      'serverErrors',
    ]),
  },
};
</script>

<style>
</style>
