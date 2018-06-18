<template>
  <v-container grid-list-lg>
    <v-layout
      row
      wrap
    >
      <v-flex xs12>
        <h5 class="headline">お問い合わせ</h5>
        <ContactComplete
          v-if="hasComplete"
          :contact="contact"
          @onRestart="onRestart"
        />
        <ContactConfirm
          v-else-if="isConfirm"
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
import ContactComplete from './ContactComplete.vue';
import { createNamespacedHelpers } from 'vuex';
const { mapState, mapMutations, mapActions } = createNamespacedHelpers('info');

export default {
  components: {
    ContactForm,
    ContactConfirm,
    ContactComplete,
  },
  data() {
    return {
      ENUM: { FORM: 1, CONFIRM: 2, COMPLETE: 3 },
      mode: 1,
      contact: {},
    };
  },
  computed: {
    isConfirm: function() {
      return (this.mode === this.ENUM.CONFIRM || this.mode === this.ENUM.COMPLETE);
    },
    hasComplete: function() {
      return (this.mode === this.ENUM.COMPLETE && this.contactSent);
    },
    ...mapState([
      'contactSent',
    ]),
  },
  methods: {
    onConfirm: function(form) {
      this.setContactSent(false);
      this.contact = { ...form };
      this.mode = this.ENUM.CONFIRM;
    },
    onSend: function() {
      this.sendContact(this.contact);
      this.mode = this.ENUM.COMPLETE;
    },
    onBack: function() {
      this.setContactSent(false);
      this.mode = this.ENUM.FORM;
    },
    onRestart: function() {
      this.contact = {};
      this.setContactSent(false);
      this.mode = this.ENUM.FORM;
    },
    ...mapMutations([
      'setContactSent',
    ]),
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
