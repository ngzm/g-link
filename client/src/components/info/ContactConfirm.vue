<template>
  <v-card class="mt-4">
    <v-card-title class="pt-4">
      <h3 class="subheading blue--text">入力内容をご確認ください</h3>
    </v-card-title>
    <v-card-text class="pt-2">
      <h5 class="subheading">貴方のお名前 または ニックネーム</h5>
      <p class="mt-2 ml-3 grey--text text--darken-1">{{ contact.name }}</p>
    </v-card-text>
    <v-card-text class="pt-3">
      <h5 class="subheading">貴方のメールアドレス</h5>
      <p class="mt-2 ml-3 grey--text text--darken-1">{{ contact.email }}</p>
    </v-card-text>
    <v-card-text class="pt-3">
      <h5 class="subheading">お問い合わせ内容</h5>
      <p class="mt-2 ml-3 grey--text text--darken-1"><span v-html="askbr" /></p>
    </v-card-text>
    <v-card-actions class="ml-3 pt-3 pb-4">
      <v-btn @click="submit">送信</v-btn>
      <v-btn @click="back">戻る</v-btn>
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
  computed: {
    askbr: function() {
      const sanitized = this.contact.ask.replace(/[&'`"<>]/g,
        match => ({
          '&': '&amp;',
          '\'': '&#x27;',
          '`': '&#x60;',
          '"': '&quot;',
          '<': '&lt;',
          '>': '&gt;',
        }[match])
      );
      return sanitized.replace(/\r\n/g, '<br>').replace(/(\r|\n)/g, '<br>');
    },
  },
  methods: {
    submit: function() {
      this.$emit('onSubmit');
    },
    back: function() {
      this.$emit('onBack');
    },
  },
};
</script>

<style>
</style>
