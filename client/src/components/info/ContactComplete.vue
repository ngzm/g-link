<template>
  <v-card class="mt-4">
    <v-card-title class="pt-4">
      <h3 class="subheading blue--text">送信完了</h3>
    </v-card-title>
    <v-card-text class="pt-2">
      <h5 class="subheading blue--text">{{ contact.name }} 様のお問い合わせをサイト管理者に送信しました</h5>
    </v-card-text>
    <v-card-actions class="ml-3 pt-3 pb-4">
      <v-btn @click="restart">問い合わせフォームに戻る</v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  props: {
    contact: {
      required: true,
      type: Object,
    },
  },
  methods: {
    restart: function() {
      this.$emit('onRestart');
    },
  },
};
</script>

<style>
</style>
