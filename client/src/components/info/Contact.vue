<template>
  <v-container grid-list-lg>
    <v-layout
      row
      wrap
    >
      <v-flex xs12>
        <h5 class="headline">お問い合わせ</h5>
        <ContactConfirm
          v-if="mode == ENUM.CONFIRM"
          :contact="contact"
          @onSubmit="onSend"
          @onBack="onBack"
        />
        <ContactForm
          v-else
          :contact="contact"
          @onSubmit="onConfirm"
        />
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import ContactForm from './ContactForm.vue';
import ContactConfirm from './ContactConfirm.vue';
import { createNamespacedHelpers } from 'vuex';
const { mapActions } = createNamespacedHelpers('info');

export default {
  components: {
    ContactForm,
    ContactConfirm,
  },
  data() {
    return {
      ENUM: { FORM: 1, CONFIRM: 2 },
      mode: 1,
      contact: {},
    };
  },
  methods: {
    onConfirm: function(form) {
      this.contact = { ...form };
      this.mode = this.ENUM.CONFIRM;
    },
    onSend: function() {
      this.sendContact(this.contact);
      this.contact = {};
      this.mode = this.ENUM.FORM;
    },
    onBack: function() {
      this.mode = this.ENUM.FORM;
    },
    ...mapActions([
      'sendContact',
      'getToken',
    ]),
  },
  beforeRouteEnter(to, from, next) {
    next(vm => {
      vm.getToken();
    });
  },
  beforeRouteUpdate(to, from, next) {
    this.getToken();
    next();
  },
};
</script>

<style>
</style>
