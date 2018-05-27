<template>
  <v-form
    ref="form"
    v-model="valid"
    lazy-validation
  >
    <div class="mt-4">
      <v-text-field
        v-model="name"
        :counter="nameSize"
        :rules="nameRules"
        label="貴方のお名前 または ニックネーム"
        required
      />
    </div>
    <div class="mt-4">
      <v-text-field
        v-model="email"
        :counter="emailSize"
        :rules="emailRules"
        label="貴方のメールアドレス"
        required
      />
    </div>
    <div class="mt-4">
      <v-text-field
        v-model="email2"
        :counter="emailSize"
        :error="email2Error"
        :error-messages="email2Messages"
        label="メールアドレス再入力"
        required
      />
    </div>
    <div class="mt-4">
      <v-text-field
        v-model="ask"
        :counter="askSize"
        :rules="askRules"
        rows="6"
        label="お問い合わせ内容"
        required
        multi-line
      />
    </div>
    <div class="mt-3">
      <v-btn
        :disabled="invalid"
        @click="submit"
      >
        確認
      </v-btn>
      <v-btn @click="clear">クリア</v-btn>
    </div>
  </v-form>
</template>

<script>
export default {
  props: {
    contact: {
      required: true,
      type: Object,
    },
  },
  data() {
    return {
      valid: false,
      name: '',
      nameSize: 64,
      nameRules: [
        (v) => !!v || '必ず入力してください',
        (v) => !!v && v.length <= this.nameSize || `${this.nameSize}文字以内で入力してください`
      ],
      emailData: '',
      emailSize: 64,
      emailRules: [
        (v) => !!v || '必ず入力してください',
        (v) => !!v && v.length <= this.emailSize || `${this.emailSize}文字以内で入力してください`,
      ],
      email2Data: '',
      email2Error: false,
      email2Messages: [],
      ask: '',
      askSize: 400,
      askRules: [
        (v) => !!v || '必ず入力してください',
        (v) => !!v && v.length <= this.askSize || `${this.askSize}文字以内で入力してください`
      ],
    };
  },
  computed: {
    invalid: function() {
      return !this.valid || this.email2Error;
    },
    email: {
      get: function() {
        return this.emailData;
      },
      set: function(dat) {
        this.emailData = dat;
        this.validateEmail();
      },
    },
    email2: {
      get: function() {
        return this.email2Data;
      },
      set: function(dat) {
        this.email2Data = dat;
        this.validateEmail();
      },
    },
  },
  mounted: function() {
    this.name = this.contact.name || '';
    this.email = this.contact.email || '';
    this.email2 = this.contact.email || '';
    this.ask = this.contact.ask || '';
  },
  methods: {
    validateEmail: function() {
      if (this.emailData === this.email2Data) {
        this.email2Error = false;
        this.email2Messages = [];
      } else {
        this.email2Messages = ['メールアドレス欄と一致しません'];
        this.email2Error = true;
      }
    },
    submit: function() {
      if (this.$refs.form.validate() && !this.email2Error) {
        this.$emit('onSubmit', { name: this.name, email: this.email, ask: this.ask });
      }
    },
    clear: function() {
      this.$refs.form.reset();
    },
  },
};
</script>

<style>
</style>
