import Tagify from '@yaireo/tagify'

document.addEventListener("turbolinks:load", () => {
  var input = document.getElementById('post_tags')
  new Tagify(input, {

    // tag data Object property which will be displayed as the tag's text
    tagTextProp: 'value',

    // placeholder text
    placeholder: 'Nhập các thẻ tags, tối đa 5 thẻ',

    // [regex] split tags by any of these delimiters ("null" to cancel)
    delimiters: ",",

    // regex pattern to vali<a href="https://www.jqueryscript.net/time-clock/">date</a> input by.
    pattern: null,

    // add the text which was inputed as a tag when blur event happens
    addTagOnBlur: true,

    // use 'select' for single-value dropdown-like select box
    // use 'mix' as value to allow mixed-content
    // use 'integrated' to skip the creation of the wrapper
    // the 'pattern' setting must be set to some character.
    mode: null,

    // by default, the native way of inputs' onChange events is kept, and it only fires when the field is blured.
    onChangeAfterBlur: true,

    mixMode: {
      insertAfterTag: '\u00A0', // node or string to add after a tag added
    },

    // interpolation for mix mode
    // everything between these will become a tag
    mixTagsInterpolator: ['[[', ']]'],

    // define conditions in which typed mix-tags content is allowing a tag to be created after.
    mixTagsAllowedAfter: /,|\.|\:|\s/,

    // maximum number of tags
    maxTags: Infinity,

    // false or null will disallow editing
    editTags: {
      clicks: 2, // Number of clicks to enter "edit-mode": 1 for single click. Any other value is considered as double-click
      keepInvalid: true, // keeps invalid edits as-is until esc is pressed while in focus
    },

    // exposed callbacks object to be triggered on events: 'add' / 'remove' tags
    callbacks: {},

    // automatically adds the text which was inputed as a tag when blur event happens
    addTagOnBlur: true,

    // automatically converts pasted text into tags
    pasteAsTags: true,

    // allow tuplicate tags
    duplicates: false,

    // trim the tag's value
    trim: true,

    // is this list has any items, then only allow tags from this list
    whitelist: [],

    // a list of non-allowed tags
    blacklist: [],

    // should ONLY use tags allowed in whitelist
    enforceWhitelist: false,

    // disable manually typing/pasting/editing tags
    userInput: true,

    // tries to autocomplete the input's value while typing
    autoComplete: {
      enabled: true,
      rightKey: false // If true, when → is pressed, use the suggested value to create a tag, else just auto-completes the input. In mixed-mode this is ignored and treated as "true"
    },

    dropdown: {
      classname     : '',
      enabled       : 2,      // minimum input characters to be typed for the suggestions dropdown to show
      maxItems      : 5,
      searchKeys    : ["value", "searchBy"],
      fuzzySearch   : true,
      caseSensitive : false,
      accentedSearch: true,
      highlightFirst: false,  // highlights first-matched item in the list
      closeOnSelect : true,   // closes the dropdown after selecting an item, if `enabled:0` (which means always show dropdown)
      clearOnSelect : true,   // after selecting a suggetion, should the typed text input remain or be cleared
      position      : 'all',  // 'manual' / 'text' / 'all'
      appendTarget  : null    // defaults to document.body one DOM has been loaded
    },

    hooks:{
      beforeRemoveTag: () => Promise.resolve(),
      beforePaste: () => Promise.resolve(),
      suggestionClick: () => Promise.resolve()
    },

    // object consisting of functions which return template strings
    // take a tag input as argument and returns a transformed value
    transformTag: function(){},

    // if true, do not remove tags which did not pass validation
    keepInvalidTags: false,

    // skip invald tags
    skipInvalid: false,

    // if false, do not create invalid tags from invalid user input
    createInvalidTags: true,

    // true - remove last tag; edit - edit last tag
    backspace: true,

    // allows tags to get focus, and also to be deleted via Backspace
    a11y: {
      focusableTags: false,
    },

    // if you wish your original input/textarea value property format to other than the default (which I recommend keeping) you may use this and make sure it returns a string.

    // if the pattern setting does not meet your needs, use this function, which recieves tag data object as an argument and should return true if validaiton passed or false/string of not
    // a string may be returned as the reason of the validation failure.
  });
});
